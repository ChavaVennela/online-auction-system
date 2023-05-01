<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
if ((session.getAttribute("user") == null) || ((Boolean)(session.getAttribute("isStaff")) == false)) {
%>
You are not logged in or you don't have the access<br/>
<a href="login.jsp">Please Login</a>
<%} 
else {
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Items-Display-page</title>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Rubik:400,700'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link href="./StandardTemp.css" rel="stylesheet" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
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
	    	
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="main-box clearfix">
					    
						<div class="table-responsive">
						    <h1>All users</h1>
							<table class="table user-list">
							<thead>
								<tr>
								    <th><span>Name</span></th>
									<th><span>Username</span></th>
									<th><span>Email</span></th>
									<th><span>Action</span></th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
							<%
								// Connect to the database
								Class.forName("com.mysql.jdbc.Driver");
								ApplicationDB DBconnect = new ApplicationDB();
								Connection con = DBconnect.getConnection();
								Statement stmt = con.createStatement();
								// Retrieve data from the userlogin table
								ResultSet rs = stmt.executeQuery("SELECT * FROM userlogin");
								
								// Loop through the data and generate table rows
								while (rs.next()) {
									String name = rs.getString("name");
									String username = rs.getString("username");
									String email = rs.getString("email");
									
									out.println("<tr>");
									out.println("<td>" + name + "</td>");
									out.println("<td>" + username + "</td>");
									out.println("<td>" + email + "</td>");
								    out.println("<td><a href=\"UserCREditDetails.jsp?username=" + username + "\" id=\"submit\" class=\"btn btn-primary\">Edit</a></td>");
									out.println("</tr>");
								}
								
								
								
								// Clean up
								rs.close();
								stmt.close();
								con.close();
							%>
							</tbody>
							
						  </table>
						  
						  
						    
						</div>
						
					</div>
				</div>	
			</div>
			
		</div>
	    
				
		</div>
    </div>
</body>
</html>
<%
}
%>