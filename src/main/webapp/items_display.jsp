<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
 <%@ page import ="java.sql.*" %>
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
					String category = request.getParameter("category");
					ResultSet result = stmt.executeQuery("select ItemDetails.Itemid, ItemDetails.Itemname, ItemDetails.imgpath as imgpath, Item.expireTime, Item.currentbid from ItemDetails, Item where ItemDetails.category='" + category + "' and Item.Itemid=ItemDetails.Itemid and Item.availability=true");
				%>
	<table>
		<tr>    
			<td>Item</td>
			<td>View</td>
		</tr>
			<%
				while (result.next()) {%>
					<tr>    
						<td><%= result.getString("Itemname") %>
						<img class="items_display_img" src='product-images/<%= result.getString("imgpath")%>'></td>
						<td>
							<% out.print("<p>Expire Time: " + result.getString("expireTime") + "</p>");
					         out.print("<span>Current Bid: " + result.getInt("currentbid") + "  &nbsp;&nbsp;</span>"); %>
								<button type="button" class="btn btn-primary" onclick="location.href='SelectedItem.jsp?Itemid=<%= result.getString("Itemid") %>'">view details</button>
						</td>
					</tr>
				<% }
			DBconnect.closeConnection(con);
			%>
		</table>

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
		</div>
    </div>
</body>
</html>
<%
}
%>
