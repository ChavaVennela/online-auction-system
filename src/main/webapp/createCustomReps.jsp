<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
 <%@ page import ="java.sql.*" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if ((session.getAttribute("user") == null) || ((Boolean)(session.getAttribute("isAdmin")) == false)) {
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
<title>Create CR </title>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Rubik:400,700'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link href="./StandardTemp.css" rel="stylesheet" type="text/css">
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
	  <div class="container-fluid">
	    <a class="navbar-brand titlename" href="#">OAS</a>
	    <div class="collapse navbar-collapse" id="navbarCollapse">
	      <ul class="navbar-nav me-auto mb-2 mb-md-0 navelements">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="search.jsp">Search</a>
	        </li>
	        <li class="nav-item">
		          <a class="nav-link" href="productUploadPage.jsp">Add Product</a>
		        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="logout.jsp">Logout</a>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
	
	<div>
    	<div class="sidebar">
		    <a href="#about">About</a>
		    <a href="userhomepage.jsp">Profile</a>
		    <a href="qna.jsp">Q/A</a>
		    <a href="#contact">Contact</a>
		    <% if(((Boolean)(session.getAttribute("isAdmin")) == true)) { %>
            	<a href="adminhomepage.jsp">Admin Page</a>
           <% }
            	%>
	    </div>
    	<div class="main">
    	<div class="login-form">
		  <form method="POST">
		    <h1>Registration form for Customer Representatives</h1>
		    <div class="content">
		      <div class="input-field">
		        <input type="text" placeholder="Name" name="name" autocomplete="nope" required>
		      </div>
		      <div class="input-field">
		        <input type="text" placeholder="Email" name="email" autocomplete="nope" required>
		      </div>
		      <div class="input-field">
		        <input type="text" placeholder="Username" name="username" autocomplete="nope" required>
		      </div>
		      <div class="input-field">
		        <input type="password" placeholder="Password" name="password" autocomplete="nope" required>
		      </div>
		      <div class="input-field">
		        <input type="password" placeholder="Re-enter Password" name="re_password" autocomplete="nope" required>
		      </div>
		      <div class="input-field">
		        <input type="text" placeholder="Phone Number" name="phone" autocomplete="nope">
		      </div>
		      <div class="input-field">
		        <input type="text" placeholder="Address" name="address" autocomplete="nope">
		      </div>
		    </div>
		    <div class="action">
		      	<button formaction="AddCustrep.jsp" class="btn btn-primary">Submit</button>
		      	
		    </div>
		  </form>
		</div>
				
		</div>
    </div>
</body>
</html>
<%
}
%>