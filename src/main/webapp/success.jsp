<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Success</title>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Rubik:400,700'>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
}
body {
  background: #e35869;
  font-family: 'Rubik', sans-serif;
}
.success {
  background: #fff;
  width: 500px;
  margin: 65px auto;
  display: -webkit-box;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
          flex-direction: column;
  border-radius: 4px;
  box-shadow: 0 2px 25px rgba(0, 0, 0, 0.2);
}
.success h1 {
  padding: 35px 35px 35px 35px;
  font-weight: 300;
  text-align:center;
}
.success .action {
  display: -webkit-box;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
          flex-direction: row;
}
.success .action .logout-button{
  width: 100%;
  border: none;
  padding: 18px;
  font-family: 'Rubik', sans-serif;
  cursor: pointer;
  text-transform: uppercase;
  background: #45A29E;
  color: #777;
  border-bottom-left-radius: 4px;
  border-bottom-right-radius: 0;
  letter-spacing: 0.2px;
  outline: 0;
  -webkit-transition: all .3s;
  transition: all .3s;
}
.success .action input[type=button]:hover {
  background: #66FCF1;
}
</style>
</head>
<body>
<div class="success">
	
	<h1>Welcome <%=session.getAttribute("user")%> </h1>
	<div class="action">
		<input class="logout-button" type="button" value="Logout" onclick="window.location='logout.jsp'" >
	</div>
</div>



</body>
</html>
<%-- Welcome <%=session.getAttribute("user")%> --%> 
<!-- <a href='logout.jsp'>Log out</a> -->
<%
}
%>