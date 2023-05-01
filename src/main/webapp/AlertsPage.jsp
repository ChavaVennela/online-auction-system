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
<html>
<head>
    <title>Alerts</title>
</head>
<body>
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
	PreparedStatement transactStmt = conn.prepareStatement(alertQuery);
	transactStmt.setString(1, username);
	ResultSet transactRs = alertStmt.executeQuery();
     while (transactRs.next()) { %>
    		<p>You have won the auction for this product</p>
            <p>Item Name: <%= transactRs.getString("ItemName") %></p>
            <hr>
    <% } %>
    
    <h3>General Alerts for bids you placed:</h3>
    <hr>
    <% 
    // Display the alerts for the transactions
	String bidQuery = "SELECT i.Itemid, d.Itemname, i.currentbid FROM Item i, ItemDetails d, Bids b WHERE i.Itemid = d.Itemid AND i.Itemid = b.Itemid" +
			 " AND b.bidId = (SELECT MAX(b2.bidId) FROM Bids b2 WHERE b2.username = b.username AND b2.Itemid = b.Itemid) AND b.autobid1 = TRUE AND i.currentbid > b.maxlimit";
	PreparedStatement bidStmt = conn.prepareStatement(alertQuery);
	bidStmt.setString(1, username);
	ResultSet transactRs1 = alertStmt.executeQuery();
     while (transactRs1.next()) { %>
    		<p>You have won the auction for this product</p>
            <p>Item Name: <%= transactRs1.getString("ItemName") %></p>
            <hr>
    <% } %>
    
    
    
</body>
</html>

<%
%>

<%
}
%>