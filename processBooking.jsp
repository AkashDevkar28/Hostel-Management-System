<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Status</title>
    <link rel="stylesheet" href="processBooking.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Room Booking Status</h1>
        </header>
        <main>
            <section>
                <%
                    // Retrieve form data
                    String fullName = request.getParameter("fullName");
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phone");
                    String collegeName = request.getParameter("collegeName");
                    String preferences = request.getParameter("preferences");
                    int roomId = Integer.parseInt(request.getParameter("roomType"));
                    int stayDuration = Integer.parseInt(request.getParameter("stayDuration"));

                    // Database connection details
                    String url = "jdbc:mysql://localhost:3306/hostel";
                    String user = "root";
                    String password = "Akash@1728";

                    Connection connection = null;
                    PreparedStatement checkStmt = null, updateStmt = null, insertStmt = null;
                    ResultSet rs = null;

                    try {
                        // Load JDBC driver and connect to database
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection(url, user, password);

                        // Check room availability
                        String checkQuery = "SELECT available_rooms FROM rooms WHERE room_id = ?";
                        checkStmt = connection.prepareStatement(checkQuery);
                        checkStmt.setInt(1, roomId);
                        rs = checkStmt.executeQuery();

                        if (rs.next() && rs.getInt("available_rooms") > 0) {
                            // Reduce room availability
                            String updateQuery = "UPDATE rooms SET available_rooms = available_rooms - 1 WHERE room_id = ?";
                            updateStmt = connection.prepareStatement(updateQuery);
                            updateStmt.setInt(1, roomId);
                            updateStmt.executeUpdate();

                            // Insert booking details
                            String insertQuery = "INSERT INTO bookings (room_id, full_name, email, phone, college_name, stay_duration, preferences) VALUES (?, ?, ?, ?, ?, ?, ?)";
                            insertStmt = connection.prepareStatement(insertQuery);
                            insertStmt.setInt(1, roomId);
                            insertStmt.setString(2, fullName);
                            insertStmt.setString(3, email);
                            insertStmt.setString(4, phone);
                            insertStmt.setString(5, collegeName);
                            insertStmt.setInt(6, stayDuration);
                            insertStmt.setString(7, preferences != null ? preferences : ""); // Default to empty string if null
                            insertStmt.executeUpdate();

                            out.println("<h2>Booking Successful!</h2>");
                            out.println("<hr>");
                            out.println("<p>Thank you, <b>" + fullName + "</b>. Your room has been booked successfully.</p>");
                        } else {
                            // No rooms available
                            out.println("<h2>Sorry, no rooms available for the selected type.</h2>");
                            out.println("<hr>");
                            out.println("<p>Please try again later or select a different room type.</p>");
                        }
                    } catch (Exception e) {
                        // Handle exceptions and display meaningful error
                        e.printStackTrace();
                        out.println("<h2>Error Occurred!</h2>");
                        out.println("<hr>");
                        out.println("<p>" + e.getMessage() + "</p>");
                    } finally {
                        // Close resources to prevent memory leaks
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (checkStmt != null) try { checkStmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (updateStmt != null) try { updateStmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (insertStmt != null) try { insertStmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (connection != null) try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </section>
        </main>
        <footer>
            <p>&copy; 2024 Hostel Management System. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>