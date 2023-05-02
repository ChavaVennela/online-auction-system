<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
<%@ page import ="java.sql.*" %>

<%
if ((session.getAttribute("user") == null)) { %>
You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%
} 
else {
	
// If the user is logged in, display the search results
String searchTerm = request.getParameter("searchTerm");

// Query the database to get all the questions that match the search term
Class.forName("com.mysql.jdbc.Driver");
ApplicationDB DBconnect = new ApplicationDB();
Connection con = DBconnect.getConnection();
PreparedStatement stmt = null;
ResultSet rs = null;

try {
    String sql = "SELECT * FROM `Q/A` WHERE question LIKE ?";
    stmt = con.prepareStatement(sql);
    stmt.setString(1, "%" + searchTerm + "%");
    rs = stmt.executeQuery();
    
    // Display the search results
    out.println("<h1>Search Results for: " + searchTerm + "</h1>");
    boolean foundResults = false;
    while (rs.next()) {
    	String username = rs.getString("username");
        String question = rs.getString("question");
    	out.println("<h3>" + username + " asked: " + question + "</h3>");
    	
    	foundResults = true;
    }
    
    if (!foundResults) {
        out.println("<p>No results found.</p>");
    }
    } catch (SQLException e) {
    out.println("<p>Error executing database query: " + e.getMessage() + "</p>");
} finally {
    if (rs != null) {
        try {
            rs.close();
        } catch (SQLException e) {
            // Ignore
        }
    }
    if (stmt != null) {
        try {
            stmt.close();
        } catch (SQLException e) {
            // Ignore
        }
    }
    if (con != null) {
        try {
            con.close();
        } catch (SQLException e) {
            // Ignore
        }
    }
}

%>

<p><a href="qna.jsp">Back to Questions and Answers</a></p>

<%
}
%>
