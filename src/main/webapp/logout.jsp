<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate();
response.sendRedirect("login.jsp");

 /* String userId=(String)session.getAttribute("user");if(userId == null) {
	
} */


%>