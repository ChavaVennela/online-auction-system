<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
<%@ page import ="java.io.*, java.util.*, javax.servlet.*, java.sql.*" %>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>

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
	          <a class="nav-link" href="logout.jsp">Logout</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link">Disabled</a>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
	
	<div>
    	<div class="sidebar">
		    <a href="#about">About</a>
		    <a href="#services">Services</a>
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
	    String username = (String)session.getAttribute("user");
		ResultSet result = stmt.executeQuery("Select BankDetails.account_num as account_num, BankDetails.routing_num as routing_num, BankDetails.bank_name as bank_num, userlogin.username as username, userlogin.email as email, userlogin.phone as phone, userlogin.password as password from BankDetails,userlogin where BankDetails.username=userlogin.username and BankDetails.username ='"+username+"'");
		%>
		<% 
		if(result.next()){
	 %>
			<form method="POST">
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0" style="width:30%;">Username</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputProductname" value='<%=result.getString("username")%>' style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0" style="width:30%;">Email</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputProductname" value='<%=result.getString("email")%>' style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0" style="width:30%;">Password</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputProductname" value='<%=result.getString("password")%>' style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0" style="width:30%;">Account number</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputProductname" value='<%=result.getString("account_num")%>' style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0" style="width:30%;">Routing number</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputProductname" value='<%=result.getString("routing_num")%>' style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0" style="width:30%;">Bank Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputProductname" value='<%=result.getString("bank_num")%>' style="width:50%;">
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
				    	<button formaction="deleteuserself.jsp" id="submit" class="btn btn-primary" style="margin: 4px 2px; padding: 13px 25px;">Delete my Account</button>
				    	<button formaction="home.jsp" class="btn btn-primary" style="margin: 4px 2px; padding: 13px 25px;">Cancel</button>
				    </div>
					</form>
					
			<%}
					else{%>
					<div>Something Went wrong with the database sorry for inconvenience</div>
					<% 
					
					}
					DBconnect.closeConnection(con);
							} catch (Exception e) {
					out.print(e);
			}%>
			</div>
		</div>
</body>
</html>