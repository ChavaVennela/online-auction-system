<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
<%@ page import ="java.sql.*" %>
<%
String userid = request.getParameter("username");
String pwd = request.getParameter("password");
String role = request.getParameter("role");

Class.forName("com.mysql.jdbc.Driver");
ApplicationDB DBconnect = new ApplicationDB();
Connection con = DBconnect.getConnection();
Statement st = con.createStatement();
ResultSet rs;
if(role.equals("user")){
	rs = st.executeQuery("select * from userlogin where username='" + userid + "' and password='" + pwd
	+ "'");
	if (rs.next()) {
	session.setAttribute("user", userid); // the username will be stored in the session
	boolean isStaff = false;
	session.setAttribute("isStaff", isStaff);
	boolean isAdmin = false;
	session.setAttribute("isAdmin", isAdmin);
	out.println("welcome " + userid);
	out.println("<a href='logout.jsp'>Log out</a>");
	response.sendRedirect("home.jsp");
	} else {
	out.println("Invalid User password <a href='login.jsp'>try again</a>");
	}
}
else if(role.equals("customer_rep")){
	rs = st.executeQuery("select * from CustomerReps where username='" + userid + "' and password='" + pwd
			+ "'");
	if (rs.next()) {
		session.setAttribute("user", userid); // the username will be stored in the session
		boolean isStaff = true;
		session.setAttribute("isStaff", isStaff);
		boolean isAdmin = false;
		session.setAttribute("isAdmin", isAdmin);
		
		response.sendRedirect("customer_representative_homepage.jsp");
		} else {
		out.println("Invalid Customer Rep. password <a href='login.jsp'>try again</a>");
		}
}
else if(role.equals("admin")){
	rs = st.executeQuery("select * from Admin where username='" + userid + "' and password='" + pwd
			+ "'");
	if (rs.next()) {
		session.setAttribute("user", userid); // the username will be stored in the session
		boolean isStaff = true;
		session.setAttribute("isStaff", isStaff);
		boolean isAdmin = true;
		session.setAttribute("isAdmin", isAdmin);
		
		response.sendRedirect("adminhomepage.jsp");
		} else {
		out.println("Invalid Admin password <a href='login.jsp'>try again</a>");
		}
	
}
out.println("Invalid Admin password <a href='login.jsp'>try again</a>");
out.println(role);
out.println(role.equals("user"));

%>