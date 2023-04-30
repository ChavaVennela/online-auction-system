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
	String Itemname = request.getParameter("Itemname");
	String category = request.getParameter("category");
	String color= request.getParameter("color");
	String brand= request.getParameter("brand");
	String Itemid= request.getParameter("Itemid");
	
	
	Class.forName("com.mysql.jdbc.Driver");
	ApplicationDB DBconnect = new ApplicationDB();
	Connection con = DBconnect.getConnection();
	
	
	
	try {
			//Make an insert statement for the Sells table:
			String update = "UPDATE `ItemDetails` SET `Itemname`=?, `category`=?, `color`=?, `brand`=? WHERE `Itemid`=?";

			//Create a Prepared SQL statement allowing y'ou to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(update);
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, Itemname);
			ps.setString(2, category);
			ps.setString(3, color);
			ps.setString(4, brand);
			ps.setString(5, Itemid);
			ps.executeUpdate();
			out.print("Update successfull");
			/* out.print(newUsername);
			out.print(newName); */
			con.close();
			response.sendRedirect("AdminProductsPage.jsp");
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("update failed");
			out.print("<a href='ProductEditDetails.jsp'>Update</a>");
		}
	
%>

</body>
</html>