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
	String newName = request.getParameter("name");
	String newEmail = request.getParameter("email");
	String newPassword= request.getParameter("password");
	String newUsername = request.getParameter("username");
	String newPhone=request.getParameter("phone");
	String newAddress=request.getParameter("address");
	String interests = request.getParameter("interests");
	
	
	Class.forName("com.mysql.jdbc.Driver");
	ApplicationDB DBconnect = new ApplicationDB();
	Connection con = DBconnect.getConnection();
	
	
	
	try {
			//Make an insert statement for the Sells table:
			String update = "UPDATE `userlogin` SET `name`=?, `email`=?, `password`=?, `phone`=?, `addr`=?, `interests`=? WHERE `username`=?";

			//Create a Prepared SQL statement allowing y'ou to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(update);
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, newName);
			ps.setString(2, newEmail);
			ps.setString(3, newPassword);
			ps.setString(4, newPhone);
			ps.setString(5, newAddress);
			ps.setString(6, interests);
			ps.setString(7, newUsername);
			ps.executeUpdate();
			out.print("Update successfull");
			/* out.print(newUsername);
			out.print(newName); */
			con.close();
			response.sendRedirect("AdminUsersPage.jsp");
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("update failed");
			out.print("<a href='UserEditDetails.jsp'>Update</a>");
		}
	
%>

</body>
</html>