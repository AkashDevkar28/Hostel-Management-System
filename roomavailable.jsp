<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room Availability</title>
    <link rel="stylesheet" href="roomAvailable.css">
</head>
<body>
    <h1>Room Availability</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Room Type</th>
                <th>Total Rooms</th>
                <th>Available Rooms</th>
                <th>Price Per Month</th>
            </tr>
        </thead>
        <tbody>
            <%
                String url = "jdbc:mysql://localhost:3306/hostel";
                String user = "root";
                String password = "Akash@1728";
                Connection connection = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(url, user, password);
                    String query = "SELECT room_type, total_rooms, available_rooms, price_per_month FROM rooms";
                    stmt = connection.createStatement();
                    rs = stmt.executeQuery(query);

                    while (rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getString("room_type") %></td>
                            <td><%= rs.getInt("total_rooms") %></td>
                            <td><%= rs.getInt("available_rooms") %></td>
                            <td><%= rs.getDouble("price_per_month") %></td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (connection != null) connection.close();
                }
            %>
        </tbody>
    </table>
</body>
</html>
