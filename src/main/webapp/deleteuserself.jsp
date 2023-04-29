<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// Get the username parameter from the request
String username = request.getParameter("username");

//Connect to the database
Class.forName("com.mysql.jdbc.Driver");
ApplicationDB DBconnect = new ApplicationDB();
Connection con = DBconnect.getConnection();
Statement stmt = con.createStatement();

//Delete the user from the userlogin table
String query = "DELETE FROM userlogin WHERE username='" + username + "'";

stmt.executeUpdate(query);

  // Redirect back to the previous page
response.sendRedirect("logout.jsp");
%>

</body>
</html>