<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
<%@ page import ="java.io.*, java.util.*, javax.servlet.*, java.sql.*" %>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

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
<title>User-Edit-Details-Page</title>
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
		    <a href="#clients">Clients</a>
		    <a href="#contact">Contact</a>
	    </div>
	    <div class="main">
			<h2>User Information</h2>
			
	<%
	try {
		//Get the database connection
		Class.forName("com.mysql.jdbc.Driver");
		ApplicationDB DBconnect = new ApplicationDB();
		Connection con = DBconnect.getConnection();		
		Statement stmt = con.createStatement();
		HttpSession ses = request.getSession();
		String username = request.getParameter("username");
		
		if(username == null) {
			username = (String)ses.getAttribute("user");
		}
		ResultSet result = stmt.executeQuery("Select userlogin.name as name, userlogin.email as email, userlogin.password as password, userlogin.phone as phone, userlogin.addr as address, userlogin.interests as interests from userlogin where userlogin.username = '"+username+"'");
		%>
		<% 
		if(result.next()){
	 %>
			<form method="POST">
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0" style="width:30%;">Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="name" value='<%=result.getString("name")%>' style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0" style="width:30%;">Email</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="email" value='<%=result.getString("email")%>' style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0" style="width:30%;">Password</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="password" value='<%=result.getString("password")%>' style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0" style="width:30%;">Phone</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="phone" value='<%=result.getString("phone")%>' style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0" style="width:30%;">Address</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="address" value='<%=result.getString("address")%>' style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0" style="width:30%;">Interests</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="interests" value='<%=result.getString("interests")%>' style="width:50%;">
					      <%out.println("<input type='hidden' id='username' name='username' value='" + username + "'>"); %>
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  	 <div class="form-group row">
					  	 <div class="col-sm-10">
						</div>
					  </div>
					  <div class="action">
					  	<button formaction="updateUser.jsp" class="btn btn-primary" style="margin: 4px 2px; padding: 13px 25px;">Update</button>
				    	<button formaction="deleteuserself.jsp" id="submit" class="btn btn-primary" style="margin: 4px 2px; padding: 13px 25px;">Delete my Account</button>
				    	<button formaction="home.jsp" class="btn btn-primary" style="margin: 4px 2px; padding: 13px 25px;">Cancel</button>
				    </div>
					</form>
					
			<%}
					else{%>
					<div>Something Went wrong with the database sorry for inconvenience</div>
					<% 
					
					}
		/*  out.println(username); */
					DBconnect.closeConnection(con);
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