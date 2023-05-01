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
<title>Place-Bid-Page</title>
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
					ResultSet result = stmt.executeQuery("Select ItemDetails.Itemid as Itemid, ItemDetails.imgpath as imgpath, ItemDetails.category as category, ItemDetails.color as color, ItemDetails.brand as brand, ItemDetails.refurbished as refurbished, Item.Price as Price, Item.username as username, Item.expireTime as expireTime, Item.secretsellerprice as secretsellerprice, Item.increment as increment, Item.currentbid as currentbid, Item.availability as availability from ItemDetails, Item where Item.Itemid=ItemDetails.Itemid and Item.Itemid='"+Itemid+"'");
					if(result.next()){
						String path = result.getString("imgpath");
						/* path="/"+path; */
			%>
	    	<div class="container">
	    		<div class="row">
	   	    			<div class="col">
	    				<div>
	    					<p>Current Bid: <%= result.getString("currentbid") %></p>
	    					<p>Minimum Increment Amount: <%= result.getString("increment") %></p>
	    					<form method="POST">
							    <div class="content">
							    	<p><input type="checkbox" id="auto_bid" name="auto_bid" value="true" onclick="toggleinput()">
 								 	<label for="auto_bid"> Opt for Auto bid</label></p>
							      <div class="input-field">
							        <p>Your Bid:<% int value = Integer.parseInt(result.getString("currentbid"))+Integer.parseInt(result.getString("increment"));%>
							   		<input type="number" id="placedbid" name="placedbid" min=<%=value %>></p>
							      </div>
							      <div class="input-field">
							        <p>Max Limit on this product:
							   		<input type="number" id="maxlimit" name="maxlimit" min=0></p>
							      </div>
							    </div>
							    <div class="action">
							    	<button formaction="updatebid.jsp?Itemid=<%= result.getString("Itemid")%>&min_inc=<%=result.getString("increment") %>" id="submit" class="btn btn-primary" disabled>Submit</button>
							    	<button formaction="SelectedItem.jsp?Itemid=<%= result.getString("Itemid")%>" class="btn btn-primary">Cancel</button>
							    </div>
							</form>
							<script>
							  var bidplaced = document.getElementById("placedbid");
							  var submit = document.getElementById("submit");
							  bidplaced.addEventListener("input", function() {
							    if(bidplaced.checkValidity()) {
							      submit.disabled = false;
							    } else {
							      submit.disabled = true;
							    }
							  });
							</script>
	    				</div>
	    			</div>
	    		</div>
	    	</div>	
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
<%
}
%>