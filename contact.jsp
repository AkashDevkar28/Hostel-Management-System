<%-- dbConnection.jsp --%>
<%@ page import="java.sql.*" %>
<%
    String dbURL = "jdbc:mysql://localhost:3306/Hostel";
    String dbUser = "root";
    String dbPassword = "Akash@1728";

    Connection conn = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // Get form data
        String fullName = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        String insertQuery = "INSERT INTO contact_us (full_name, email, message) VALUES (?, ?, ?)";

        PreparedStatement pstmt = conn.prepareStatement(insertQuery);
        pstmt.setString(1, fullName);
        pstmt.setString(2, email);
        pstmt.setString(3, message);

        int rowsInserted = pstmt.executeUpdate();

        if (rowsInserted > 0) {
            out.println("<h2>Thank you for contacting us! Your message has been received.</h2>");
            out.println("<a href='contact.html'>Back to Contact Page</a>");
        } else {
            out.println("<h2>Failed to save your message. Please try again later.</h2>");
        }

    
    } catch (Exception e) {
        out.println("Database connection error: " + e.getMessage());
    }
%>
