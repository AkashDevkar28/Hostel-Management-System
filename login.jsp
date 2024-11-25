<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<%
    // Retrieve form data
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Database connection details
    String jdbcUrl = "jdbc:mysql://localhost:3306/Hostel";
    String dbUser = "root";
    String dbPassword = "Akash@1728";
    String dbDriver = "com.mysql.jdbc.Driver";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    boolean isAuthenticated = false;

    try {
        // Load JDBC driver
        Class.forName(dbDriver);

        // Establish connection
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // SQL query to check if username and password match
        String sql = "SELECT * FROM signup WHERE username = ? AND password = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);

        // Execute the query
        rs = pstmt.executeQuery();

        // Check if credentials are valid
        if (rs.next()) {
            isAuthenticated = true;
            response.sendRedirect("index1.html"); // Redirect to dashboard if login is successful
        } else {
            out.println("<p style='color:red;'>Invalid username or password. Please try again.</p>");
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        // Close resources
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
