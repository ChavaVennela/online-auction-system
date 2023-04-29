<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sale Analysis</title>
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
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="main-box clearfix">
						<div class="table-responsive">
						    <h1 style="text-align: center;">Sales Report</h1>
						    
						    
						    
						    
						    
						    
						    
						    
						    
						    
							<table class="table peritem-list">
							<thead>
								<tr>
								    <th><span>Itemname</span></th>
									<!-- <th><span>Category</span></th> -->
									<!--<th><span>Seller</span></th>-->
									<!-- <th><span>Buyer</span></th> -->
									<th><span>Price sold</span></th>
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
								
								ResultSet rs = stmt.executeQuery("SELECT Item.currentbid, ItemDetails.Itemname, ItemDetails.category, Transaction.seller_username, Transaction.buyer_username FROM Transaction JOIN Item ON Transaction.Itemid = Item.Itemid JOIN ItemDetails ON Item.Itemid = ItemDetails.Itemid");
								int priceInt = Integer.parseInt("0");
								// Loop through the data and generate table rows
								while (rs.next()) {
									String Itemname = rs.getString("Itemname");
									/*  String Category = rs.getString("category");
									String Seller = rs.getString("seller_username");
									String Buyer = rs.getString("buyer_username"); */
									String price = rs.getString("currentbid"); 
									priceInt = priceInt+ Integer.parseInt(price);
									out.println("<tr>");
									out.println("<td>" + Itemname + "</td>");
									/*  out.println("<td>" + Category + "</td>");
									out.println("<td>" + Seller + "</td>");
									out.println("<td>" + Buyer + "</td>"); */
									out.println("<td>" + price + "</td>");
									out.println("<td>&nbsp;</td>");
									out.println("</tr>");
								}
								
								out.println("<h1>Total Earnings: $" + priceInt + "</h1>");
								// Clean up
								rs.close();
								stmt.close();
								con.close();
								
							%>
							</tbody>
							
						  </table> 
						  
						  
						  
						  
						  <table class="table peritemtype-list">
							<thead>
								<tr>
								    <!-- <th><span>Itemname</span></th> -->
									<th><span>Category</span></th>
									<!--<th><span>Seller</span></th>-->
									<!-- <th><span>Buyer</span></th> -->
									<th><span>Earnings</span></th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
							<%
								// Connect to the database
								Class.forName("com.mysql.jdbc.Driver");
								ApplicationDB DBconnect1 = new ApplicationDB();
								Connection con1 = DBconnect1.getConnection();
								Statement stmt1 = con1.createStatement();
								
								ResultSet rs1 = stmt1.executeQuery("SELECT ItemDetails.category, sum(Item.currentbid) as b FROM Transaction JOIN Item ON Transaction.Itemid = Item.Itemid JOIN ItemDetails ON Item.Itemid = ItemDetails.Itemid GROUP BY category");
								/*  int priceInt = Integer.parseInt("0"); */
								// Loop through the data and generate table rows
								while (rs1.next()) {
									/*  String Itemname = rs.getString("Itemname"); */
									String Category = rs1.getString("category");
									/*  String Seller = rs.getString("seller_username");
									String Buyer = rs.getString("buyer_username"); */
									String price = rs1.getString("b"); 
									/*priceInt = priceInt+ Integer.parseInt(price); */
									out.println("<tr>");
									/*out.println("<td>" + Itemname + "</td>"); */
									out.println("<td>" + Category + "</td>");
									/*out.println("<td>" + Seller + "</td>");
									out.println("<td>" + Buyer + "</td>"); */
									out.println("<td>" + price + "</td>");
									out.println("<td>&nbsp;</td>");
									out.println("</tr>");
								}
								
								/*  out.println("<h1>Total Earnings: $"+ priceInt+ "</h1>"); */
								// Clean up
								rs1.close();
								stmt1.close();
								con1.close();
								
							%>
							</tbody>
							
						  </table>   
						  
						   <table class="table perselleruser-list">
							<thead>
								<tr>
								    <!-- <th><span>Itemname</span></th> -->
									<!--  <th><span>Category</span></th> -->
									<th><span>Seller</span></th>
									<!-- <th><span>Buyer</span></th> -->
									<th><span>Earnings</span></th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
							<%
								// Connect to the database
								Class.forName("com.mysql.jdbc.Driver");
								ApplicationDB DBconnect2 = new ApplicationDB();
								Connection con2 = DBconnect2.getConnection();
								Statement stmt2 = con2.createStatement();
								
								ResultSet rs2 = stmt2.executeQuery("SELECT Transaction.seller_username, sum(Item.currentbid) as b FROM Transaction JOIN Item ON Transaction.Itemid = Item.Itemid JOIN ItemDetails ON Item.Itemid = ItemDetails.Itemid GROUP BY seller_username");
								/*  int priceInt = Integer.parseInt("0"); */
								// Loop through the data and generate table rows
								while (rs2.next()) {
									/*  String Itemname = rs.getString("Itemname"); */
									/*  String Category = rs1.getString("category"); */
									String Seller = rs2.getString("seller_username");
									/*String Buyer = rs.getString("buyer_username"); */
									String price = rs2.getString("b"); 
									/*  priceInt = priceInt+ Integer.parseInt(price); */
									out.println("<tr>");
									/*out.println("<td>" + Itemname + "</td>"); 
									out.println("<td>" + Category + "</td>"); */
									out.println("<td>" + Seller + "</td>");
									/*out.println("<td>" + Buyer + "</td>"); */
									out.println("<td>" + price + "</td>");
									out.println("<td>&nbsp;</td>");
									out.println("</tr>");
								}
								
								/*  out.println("<h1>Total Earnings: $"+ priceInt+ "</h1>"); */
								// Clean up
								rs2.close();
								stmt2.close();
								con2.close();
								
							%>
							</tbody>
							
						  </table>   
						  
						   
						  
						   <table class="table perbuyer-list">
							<thead>
								<tr>
								    <!-- <th><span>Itemname</span></th> -->
									<!--  <th><span>Category</span></th> -->
									<!--  <th><span>Seller</span></th>-->
									<th><span>Buyer</span></th>
									<th><span>Earnings</span></th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
							<%
								// Connect to the database
								Class.forName("com.mysql.jdbc.Driver");
								ApplicationDB DBconnect3 = new ApplicationDB();
								Connection con3 = DBconnect3.getConnection();
								Statement stmt3 = con3.createStatement();
								
								ResultSet rs3 = stmt3.executeQuery("SELECT Transaction.buyer_username, sum(Item.currentbid) as b FROM Transaction JOIN Item ON Transaction.Itemid = Item.Itemid JOIN ItemDetails ON Item.Itemid = ItemDetails.Itemid GROUP BY buyer_username");
								/*  int priceInt = Integer.parseInt("0"); */
								// Loop through the data and generate table rows
								while (rs3.next()) {
									/*  String Itemname = rs.getString("Itemname"); */
									/*  String Category = rs1.getString("category"); */
									String Seller = rs3.getString("buyer_username");
									/*String Buyer = rs.getString("buyer_username"); */
									String price = rs3.getString("b"); 
									/*  priceInt = priceInt+ Integer.parseInt(price); */
									out.println("<tr>");
									/*out.println("<td>" + Itemname + "</td>"); 
									out.println("<td>" + Category + "</td>"); */
									out.println("<td>" + Seller + "</td>");
									/*out.println("<td>" + Buyer + "</td>"); */
									out.println("<td>" + price + "</td>");
									out.println("<td>&nbsp;</td>");
									out.println("</tr>");
								}
								
								/*  out.println("<h1>Total Earnings: $"+ priceInt+ "</h1>"); */
								// Clean up
								rs3.close();
								stmt3.close();
								con3.close();
								
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