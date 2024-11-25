<%@ page language="java" import="java.sql.*" %>
<%
    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/hostel_management";
    String user = "root";
    String password = "";

    Connection connection = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Establish the connection
        connection = DriverManager.getConnection(url, user, password);

        // Connection is successful, you can use it here
        out.println("Database connection established successfully!");
    } catch (Exception e) {
        // Handle exceptions
        out.println("Error connecting to database: " + e.getMessage());
    } finally {
        // Always close the connection to avoid resource leaks
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {
                out.println("Error closing the connection: " + ex.getMessage());
            }
        }
    }
%>
