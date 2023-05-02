<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
 <%@ page import ="java.sql.*" %>
<%

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
<title>User Home Page </title>
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
		    <% if(((Boolean)(session.getAttribute("isStaff")) == false)) { %>
	        	<li class="nav-item">
            	<a class="nav-link" href="AlertsPage.jsp">Alerts</a>
            	</li>
           <% }
            	%>
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
		    <a href="contactus.jsp">Contact</a>
		    <% if(((Boolean)(session.getAttribute("isStaff")) == true) && ((Boolean)(session.getAttribute("isAdmin")) == false)) { %>
            	<a href="customer_representative_homepage.jsp">Customer Rep. Page</a>
           <% }
            	%>
            <% if(((Boolean)(session.getAttribute("isAdmin")) == true)) { %>
            	<a href="adminhomepage.jsp">Admin Page</a>
           <% }
            	%>
	    </div>
    	<div class="main">
    	<div class="login-form">
    	 <form method="GET">
		    <div class="action" style="margin-top: 30px;">
		      	<button formaction="UserEditDetails.jsp" class="btn btn-primary"> View / Update My Information </button>
		    </div>
		    <div class="action" style="margin-top: 30px;">
		      	<button formaction="mybids.jsp" class="btn btn-primary"> My Bids</button>
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