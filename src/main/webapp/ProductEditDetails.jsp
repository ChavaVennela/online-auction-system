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
<title>Product-Edit-Details-Page</title>
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
			<h2>Product Information</h2>
			
	<%
	try {
		//Get the database connection
		Class.forName("com.mysql.jdbc.Driver");
		ApplicationDB DBconnect = new ApplicationDB();
		Connection con = DBconnect.getConnection();		
		Statement stmt = con.createStatement();
		HttpSession ses = request.getSession();
		String Itemid = request.getParameter("Itemid");
		
		
		ResultSet result = stmt.executeQuery("Select ItemDetails.Itemname as Itemname, ItemDetails.category as category, ItemDetails.color as color, ItemDetails.brand as brand from ItemDetails where ItemDetails.Itemid = '"+Itemid+"'");
		%>
		<% 
		if(result.next()){
	 %>
			<form method="POST">
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0" style="width:30%;">Product name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="Itemname" value='<%=result.getString("Itemname")%>' style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0" style="width:30%;">Category</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="category" value='<%=result.getString("category")%>' style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0" style="width:30%;">Color</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="color" value='<%=result.getString("color")%>' style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0" style="width:30%;">Brand</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="brand" value='<%=result.getString("brand")%>' style="width:50%;">
					        <%out.println("<input type='hidden' id='Itemid' name='Itemid' value='" + Itemid + "'>"); %>
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
					  	<button formaction="updateProduct.jsp" class="btn btn-primary" style="margin: 4px 2px; padding: 13px 25px;">Update</button>
				    	<button formaction="deleteitem.jsp" id="submit" class="btn btn-primary" style="margin: 4px 2px; padding: 13px 25px;">Delete product</button>
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