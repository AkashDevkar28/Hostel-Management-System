<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<%
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirm-password");

    String jdbcUrl = "jdbc:mysql://localhost:3306/Hostel?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    String dbUser = "root";
    String dbPassword = "Akash@1728";
    String dbDriver = "com.mysql.cj.jdbc.Driver";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        if (!password.equals(confirmPassword)) {
            out.println("<p style='color:red;'>Passwords do not match. Please try again.</p>");
        } else {
            Class.forName(dbDriver);
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            String sql = "INSERT INTO signup (username, email, password) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            pstmt.setString(3, password);

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
               
                response.sendRedirect("login.html");
            } else {
                out.println("<p style='color:red;'>Sign-up failed. Please try again.</p>");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
