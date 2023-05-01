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
<%
// Initialize database connection
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver");
ApplicationDB DBconnect = new ApplicationDB();
conn = DBconnect.getConnection();
	

// Check if a new item has been added that matches the user's category interests
String username = (String)session.getAttribute("user");
String insertQuery = "INSERT INTO Alerts (username, Itemid) SELECT ?, i.Itemid FROM ItemDetails i, Item it WHERE i.category IN (SELECT interests FROM userlogin WHERE username = ?) AND it.availability=TRUE AND" 
		+ " it.Itemid = i.Itemid AND NOT EXISTS (SELECT * FROM Alerts WHERE itemid = i.Itemid AND username = ?)" + " ORDER BY it.expireTime DESC LIMIT 5" + " ON DUPLICATE KEY UPDATE Alerts.Itemid = i.Itemid";
/* String insertQuery = "INSERT INTO Alerts (username, Itemid) " +
"SELECT ? as username, i.Itemid FROM ItemDetails i WHERE i.category IN (SELECT interests FROM userlogin WHERE username = ?) AND NOT EXISTS (SELECT * FROM Alert WHERE itemid = i.Itemid AND username = ?) "
+ "ORDER BY i.expireTime DESC LIMIT 5"; */
PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
insertStmt.setString(1, username);
insertStmt.setString(2, username);
insertStmt.setString(3, username);
insertStmt.executeUpdate();


// Display the alerts for the user
String alertQuery = "SELECT i.ItemName, a.Itemid, it.currentbid, it.expireTime FROM ItemDetails i, Alerts a, Item it WHERE a.username=? AND a.is_new_alert=TRUE AND a.is_transaction=FALSE AND a.Itemid=i.Itemid AND i.Itemid=it.Itemid";
PreparedStatement alertStmt = conn.prepareStatement(alertQuery);
alertStmt.setString(1, username);
ResultSet alertRs = alertStmt.executeQuery();

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
    <h1>Alerts</h1>
    <h3>New Items you might be interested in:</h3>
    <hr>
    <% while (alertRs.next()) { %>
            <p>Item Name: <%= alertRs.getString("ItemName") %></p>
            <p>Current Bid: <%= alertRs.getString("currentbid") %></p>
            <p>Expire Time: <%= alertRs.getString("expireTime") %></p>
            <% out.println("<button type=\"button\" class=\"btn btn-primary\" onclick=\"location.href='SelectedItem.jsp?Itemid=" + alertRs.getString("Itemid") + "';\">view details</button>"); %>
            <%-- <br>
            <form method="post" action="deleteAlert.jsp">
	            <input type="hidden" name="username" value="<%= username %>">
	            <input type="hidden" name="itemId" value="<%= alertRs.getString("Itemid") %>">
	            <input type="submit" value="Delete">
	        </form> --%>
            <hr>
    <% } %>
    
    <h3>Auctions you won:</h3>
    <hr>
    <% 
    // Display the alerts for the transactions
	String transactQuery = "SELECT it.ItemName, t.Itemid FROM Transaction t, ItemDetails it WHERE t.buyer_username=? AND t.Itemid=it.Itemid";
	PreparedStatement transactStmt = conn.prepareStatement(transactQuery);
	transactStmt.setString(1, username);
	ResultSet transactRs = transactStmt.executeQuery();
     while (transactRs.next()) { %>
    		<p>You have won the auction for this product</p>
            <p>Item Name: <%= transactRs.getString("ItemName") %></p>
            <hr>
    <% } %>
    
    <h3>General Alerts for bids you placed:</h3>
    <hr>
    <% 
    // Display the alerts for the transactions
	String bidQuery = "SELECT i.Itemid, d.Itemname, i.currentbid, i.expireTime FROM Item i, ItemDetails d, Bids b WHERE i.Itemid = d.Itemid AND i.Itemid = b.Itemid AND b.username = ? " +
			  "AND b.bidId = (SELECT MAX(bidId) FROM Bids WHERE username = ? AND Itemid = i.Itemid) AND b.autobid1 = TRUE AND i.currentbid > b.maxlimit";
	PreparedStatement bidStmt = conn.prepareStatement(bidQuery);
	bidStmt.setString(1, username);
	bidStmt.setString(2, username);
	ResultSet bidRs1 = bidStmt.executeQuery();
     while (bidRs1.next()) { %>
    		<p>Alert! Someone else placed a bid which is more than your maximum limit for this item</p>
            <p>Item Name: <%= bidRs1.getString("ItemName") %></p>
            <p>Current Bid: <%= bidRs1.getString("currentbid") %></p>
            <p>Expire Time: <%= bidRs1.getString("expireTime") %></p>
            <% out.println("<button type=\"button\" class=\"btn btn-primary\" onclick=\"location.href='SelectedItem.jsp?Itemid=" + bidRs1.getString("Itemid") + "';\">view details</button>"); %>
            
            <hr>
    <% 
     } %>
    
    
    
</body>
</html>

<%
conn.close();
%>

<%
}
%>