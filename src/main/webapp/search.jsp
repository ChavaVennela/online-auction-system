<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
 <%@ page import ="java.sql.*" %>
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
<title>Items-Display-page</title>
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
				<% try {
					Class.forName("com.mysql.jdbc.Driver");
					ApplicationDB DBconnect = new ApplicationDB();
					Connection con = DBconnect.getConnection();		
					Statement stmt = con.createStatement();
					String category = request.getParameter("category");
					ResultSet result = stmt.executeQuery("select ItemDetails.Itemid, ItemDetails.Itemname, ItemDetails.imgpath as imgpath from ItemDetails, Item where ItemDetails.category='" + category + "' and Item.Itemid=ItemDetails.Itemid and Item.availability=true");
				} catch (Exception e) {
					out.print(e);
				}
				%>
			<br>
			<form action="search.jsp" method="get">
			    <p><label for="category">Category:</label>
			    <select id="category" name="category">
			    	<option value="All_items">All items</option>
			        <option value="Laptop">Laptop</option>
			        <option value="Mobile">Mobile</option>
			        <option value="Accessory">Accessory</option>
			    </select></p>
			   <p> <label for="searchType">Search by:</label>
			    <select id="searchType" name="searchType">
			    	<option value="feature">feature</option>
			        <option value="brand">Brand</option>
			        <option value="color">Color</option>
			        <option value="name">Name</option>
			    </select></p>
			    <p><label for="keyword">Keyword:</label>
			    <input type="text" id="keyword" name="keyword"></p>
			    <p><label for="sort">Sort by:</label>
			    <select name="sort" id="sort">
			    	<option value="not_sorted">Not sorted</option>
			        <option value="expire_asc">Expiry Time (Ascending)</option>
			        <option value="expire_desc">Expiry Time (Descending)</option>
			        <option value="bid_asc">Current Bid Price (Ascending)</option>
			        <option value="bid_desc">Current Bid Price (Descending)</option>
			    </select></p>
			   <p> <input type="submit" value="Search"></p>
			</form>
			
			<hr>
			
			<%
			   
			   // Retrieve the form inputs
			   String category = "All_items";
			   String searchType = "feature";
			   String keyword = "";
			   String sort = "not_sorted";
			   
			   if(request.getParameter("category") != null){
			   	category = request.getParameter("category");
			   }
			   if(request.getParameter("searchType") != null){
			   	searchType = request.getParameter("searchType");
			   }
			   if(request.getParameter("keyword") != null){
			   	keyword = request.getParameter("keyword");
			   }
			   if(request.getParameter("sort") != null){
			   	sort = request.getParameter("sort");
			   }
			   
			   //System.out.println("hello");
			   //System.out.println(category);
			
			   // Create a SQL query based on the form inputs
			   String query = "SELECT i.*, id.* FROM Item i JOIN ItemDetails id ON i.Itemid=id.Itemid WHERE availability=1";
			   if (!category.equals("All_items")) {
			      query += " AND category='" + category + "'";
			   }
			   
			   if (keyword!=""){
				   
			   if (searchType.equals("feature")) {
			      query += " AND (Itemname LIKE '%" + keyword + "%' OR category LIKE '%" + keyword + "%' OR color LIKE '%" + keyword + "%' OR brand LIKE '%" + keyword + "%')";
			   } else if (searchType.equals("brand")) {
			      query += " AND brand='" + keyword + "'";
			   } else if (searchType.equals("color")) {
			      query += " AND color='" + keyword + "'";
			   } else if (searchType.equals("name")) {
			      query += " AND Itemname='" + keyword + "'";
			   }}
			   if (sort.equals("expire_asc")) {
			      query += " ORDER BY expireTime ASC";
			   } else if (sort.equals("expire_desc")) {
			      query += " ORDER BY expireTime DESC";
			   } else if (sort.equals("bid_asc")) {
			      query += " ORDER BY currentbid ASC";
			   } else if (sort.equals("bid_desc")) {
			      query += " ORDER BY currentbid DESC";
			   }
			
			   // Execute the query and display the results
			   try {
				   
			      Class.forName("com.mysql.jdbc.Driver");
			 	  ApplicationDB DBconnect = new ApplicationDB();
				  Connection con = DBconnect.getConnection();
			      PreparedStatement ps = con.prepareStatement(query);
			      ResultSet rs = ps.executeQuery();
			
			      while (rs.next()) {
			    	  
			    	 /*  out.println("<tr>");
		    	      out.println("<td>" + rs.getString("Itemname") + "<img class=\"items_display_img\" src='product-images/" + rs.getString("imgpath") + "'></td>");
		    	      out.println("<td><button type=\"button\" class=\"btn btn-primary\" onclick=\"location.href='SelectedItem.jsp?Itemid=" + rs.getString("Itemid") + "';\">view details</button></td>");
		    	      out.println("</tr>"); 
		    	      out.println("</br>");
			      } */
			    	  
			          // Display the results in HTML format
			         out.println("<h4>Item Name: " + rs.getString("Itemname") + "</h4>");
			         out.print("<span>Category: " + rs.getString("category") + ";  </span>");
			         out.print("<span>Colour: " + rs.getString("color") + "</span>");
			         out.println("<p>Brand: " + rs.getString("brand") + "</p>");
			         out.println("<img class=\"items_display_img\" src='product-images/" + rs.getString("imgpath") + "'>");
			         out.print("<p>Expire Time: " + rs.getString("expireTime") + "</p>");
			         out.print("<span>Current Bid: " + rs.getInt("currentbid") + "  &nbsp;&nbsp;</span>");
			         out.println("<button type=\"button\" class=\"btn btn-primary\" onclick=\"location.href='SelectedItem.jsp?Itemid=" + rs.getString("Itemid") + "';\">view details</button>");
			         
			         out.println("<hr>");
			      }
			
			      rs.close();
			      ps.close();
			      con.close();
			   } catch (SQLException se) {
			      se.printStackTrace();
			   } catch (Exception e) {
			      e.printStackTrace();
			   }
			%>
			
		</div>
    </div>
</body>
</html>
<%

}

%>
