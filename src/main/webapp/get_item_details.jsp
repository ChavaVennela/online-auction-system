<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
<%-- <%@page import="java.io.PrintStream"%> --%>    
<%@ page import ="java.sql.*" %>
<%
String category = request.getParameter("category");
Class.forName("com.mysql.jdbc.Driver");
ApplicationDB DBconnect = new ApplicationDB();
Connection con = DBconnect.getConnection();
Statement st = con.createStatement();
ResultSet rs;
/* //System.out.println("Hello"); */
rs = st.executeQuery("select * from ItemDetails where category='" + category + "'");
if (rs.next()) {
session.setAttribute("category", category); // the username will be stored in the session
out.println("See " + category);
out.println("<a href='logout.jsp'>Log out</a>");
response.sendRedirect("items_display.jsp");
} else {
out.println("No items in this category <a href='home.jsp'>Go back to Home page</a>");
}
%>