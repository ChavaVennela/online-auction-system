<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
<%@ page import ="java.io.*, java.util.*, javax.servlet.*, java.sql.*" %>
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
<title>Selected-Item-Page</title>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Rubik:400,700'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link href="./StandardTemp.css" rel="stylesheet" type="text/css">
<style>
		#bids {
		  font-family: Arial, Helvetica, sans-serif;
		  border-collapse: collapse;
		  width: 100%;
		  text-align: center;
		}
		
		#bids td, #bids th {
		  border: 1px solid #ddd;
		  padding: 8px;
		}
		
		#bids tr:nth-child(even){background-color: #f2f2f2;}
		
		#bids tr:hover {background-color: #ddd;}
		
		#bids th {
		  padding-top: 12px;
		  padding-bottom: 12px;
		  text-align: center;
		  background: linear-gradient(#FF9F2F, #FF6026);;
		  color: white;
		}
</style>
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
		    <a href="UserEditDetails.jsp">Profile</a>
		    <a href="qna.jsp">Q/A</a>
		    <a href="#contact">Contact</a>
		    <% if(((Boolean)(session.getAttribute("isAdmin")) == true)) { %>
            	<a href="adminhomepage.jsp">Admin Page</a>
           <% }
            	%>
            <% if(((Boolean)(session.getAttribute("isStaff")) == true) && ((Boolean)(session.getAttribute("isAdmin")) == false)) { %>
            	<a href="customer_representative_homepage.jsp">Customer Rep. Page</a>
           <% }
            	%>
	    </div>
		<div class="main">
			<% try {
					Class.forName("com.mysql.jdbc.Driver");
					ApplicationDB DBconnect = new ApplicationDB();
					Connection con = DBconnect.getConnection();		
					Statement stmt = con.createStatement();
					String Itemid = request.getParameter("Itemid");
					ResultSet result = stmt.executeQuery("select * from Bids where Itemid='" + Itemid + "'");
				%>	
			<table id="bids">
				<tr>
					<th>User</th>
					<th>Bid</th>
				</tr>
				<%while(result.next()){
					%>
					<tr>
					<td><a href="mybids.jsp?username=<%=result.getString("username")%>"><%= result.getString("username")%></a></td>
					<td><%= result.getString("pricelist")%></td>
					</tr>
				<% }%>
			</table>
			<p><button onclick="location.href='SelectedItem.jsp?Itemid=<%= Itemid %>'" style="padding: 10px 25px;margin: 10px 2px;" type="button" class="btn btn-primary">Go Back</button></p>
			
		<% DBconnect.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}%>
		</div>
	</div>
</body>
</html>
<%
}
%>