<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Room</title>
    <link rel="stylesheet" href="booking.css">
</head>
<body>
    <h1>Book Your Room</h1>
    <form action="processBooking.jsp" method="post">
        <!-- Dropdown for Room Type -->
        <label for="roomType">Select Room Type:</label>
        <select id="roomType" name="roomType" required>
            <option value="">Select Room Type</option>
            <%
                // Database connection details
                String url = "jdbc:mysql://localhost:3306/hostel";
                String user = "root";
                String password = "Akash@1728";
                Connection connection = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    // Load and establish the database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(url, user, password);

                    // Query to fetch available room types
                    String query = "SELECT room_id, room_type FROM rooms WHERE available_rooms > 0";
                    stmt = connection.createStatement();
                    rs = stmt.executeQuery(query);

                    // Populate dropdown with available room types
                    while (rs.next()) {
            %>
                        <option value="<%= rs.getInt("room_id") %>"><%= rs.getString("room_type") %></option>
            <%
                    }
                } catch (Exception e) {
                    out.println("<option>Error: " + e.getMessage() + "</option>");
                } finally {
                    // Close resources to prevent memory leaks
                    if (rs != null) try { rs.close(); } catch (SQLException e) {}
                    if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                    if (connection != null) try { connection.close(); } catch (SQLException e) {}
                }
            %>
        </select>

        <!-- Full Name -->
        <label for="fullName">Full Name:</label>
        <input type="text" id="fullName" name="fullName" required>

        <!-- Email -->
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <!-- Phone Number -->
        <label for="phone">Phone Number:</label>
        <input type="tel" id="phone" name="phone" required>

        <!-- College Name -->
        <label for="collegeName">College Name:</label>
        <input type="text" id="collegeName" name="collegeName" required>

        <!-- Duration of Stay -->
        <label for="stayDuration">Duration of Stay (Months):</label>
        <input type="number" id="stayDuration" name="stayDuration" min="1" required>

        <!-- Preferences -->
        <label for="preferences">Preferences (Optional):</label>
        <textarea id="preferences" name="preferences" rows="3"></textarea>

        <!-- Submit Button -->
        <button type="submit">Book Room</button>
    </form>
</body>
</html>
