<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%} 
else {
%>
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
	String newUserName = request.getParameter("username");
	String newPassword= request.getParameter("password");
	String re_password=request.getParameter("re_password");
	String newPhone=request.getParameter("phone");
	String newAddress=request.getParameter("address");
	
	Class.forName("com.mysql.jdbc.Driver");
	ApplicationDB DBconnect = new ApplicationDB();
	Connection con = DBconnect.getConnection();
	
	Statement st = con.createStatement();
	ResultSet rs;
	
	rs = st.executeQuery("select * from userlogin where username='" + newUserName + "' or email='" + newEmail
	+ "'");
	if (rs.next()) {
	out.println("Sorry the username or user email already exits");
	out.println("<a href='createNewUser.jsp'>Register</a>");
	out.println("<a href='login.jsp'>Login</a>");
	/* response.sendRedirect("createNewUser.jsp"); */
	}
	else if(!(newPassword.equals(re_password))){
		out.println("Sorry passwords don't match");
		out.println("<a href='createNewUser.jsp'>Register</a>");
		/* response.sendRedirect("createNewUser.jsp"); */
	}
	else{
		try {
			//Make an insert statement for the Sells table:
			String insert = "INSERT INTO userlogin(name, email, username, password, phone, addr)"
					+ "VALUES (?, ?, ?, ?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, newName);
			ps.setString(2, newEmail);
			ps.setString(3, newUserName);
			ps.setString(4, newPassword);
			ps.setString(5, newPhone);
			ps.setString(6, newAddress);
			ps.executeUpdate();
			
			con.close();
			out.print("insert succeeded");
			String user=newUserName;
			response.sendRedirect("UserCreatedPage.jsp");
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("insert failed");
			out.print("<a href='createNewUser.jsp'>Register</a>");
		}
	}
%>

</body>
</html>
<%
}
%>