<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
<%@ page import ="java.io.*, java.util.*, javax.servlet.*, java.sql.*" %>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Selected-Item-Page</title>
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
		    <a href="UserEditDetails.jsp">Profile</a>
		    <a href="#clients">Clients</a>
		    <a href="#contact">Contact</a>
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
			%>
			<div>
	    		<h3><%= result.getString("brand")%> <%= result.getString("color")%> </h3>
	    	</div>
	    	<hr>
	    	<div class="container">
	    		<div class="row">
	    			<div class="col">
	    				<img class="selecteditem_img" src='product-images/<%=path%>'>
	    			</div>
	    			<div class="col">
	    				Ongoing Auction! <p>Closes at: <%=result.getString("expireTime") %>
	    				<hr>
	    				<div>
	    					<p>Current Bid: <%= result.getString("currentbid") %></p>
	    					<p>Number of Bids: </p> 
	    				</div>
	    				<div>
	    				<%
	    				String user=(String)session.getAttribute("user");
	    				if(user.equals(result.getString("username"))){
	    					%>
	    					<button id="place_bid" onclick="location.href='place_bid.jsp?Itemid=<%= result.getString("Itemid")%>'" style="width:200px" type="button" class="btn btn-primary" disabled>Place Bid</button>
	    					
	    				<% }
	    				else{%>
	    					<button id="place_bid" onclick="location.href='place_bid.jsp?Itemid=<%= result.getString("Itemid")%>'" style="width:200px" type="button" class="btn btn-primary">Place Bid</button>
	    				<%} %>	
	    					<button onclick="location.href='bidHistory.jsp?Itemid=<%= result.getString("Itemid")%>'" style="width:200px" type="button" class="btn btn-primary">Bid History</button>
	    					<ul class = "unordered list">
	    						<li>No delivery charges!</li>
					    		<li>Fast and Safe delivery</li>
					    		<li>15 days return period</li>
							</ul>
	    				</div>
	    			</div>
	    		</div>
	    	</div>
	    	<hr>
	    	<h2 style="colr:red">Product Information</h2>
	    	<ul class = "unordered list">
	    		<li>
	    			<span class = "a-list-item">
	    				<span class = "a-text-bold">Brand :</span>
	    				<span><%= result.getString("brand") %></span>
	    			</span>
				</li>
				<li>
	    			<span class = "a-list-item">
	    				<span class = "a-text-bold">Color :</span>
	    				<span><%= result.getString("color") %></span>
	    			</span>
				</li>
				<li>
	    			<span class = "a-list-item">
	    				<span class = "a-text-bold">Category :</span>
	    				<span><%= result.getString("category") %></span>
	    			</span>
				</li>		    			
		 </ul>	
			<hr>
			<h2>Q/A</h2>
					
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