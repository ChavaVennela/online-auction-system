<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
 <%@ page import ="java.sql.*" %>

<% 
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver");
ApplicationDB DBconnect = new ApplicationDB();
conn = DBconnect.getConnection();
String username = (String)session.getAttribute("user");

String alertQuery = "SELECT i.ItemName, a.Itemid, it.currentbid, it.expireTime FROM ItemDetails i, Alerts a, Item it WHERE a.username=? AND a.is_new_alert=TRUE AND a.is_transaction=FALSE AND a.Itemid=i.Itemid AND i.Itemid=it.Itemid";
PreparedStatement alertStmt = conn.prepareStatement(alertQuery);
alertStmt.setString(1, username);
ResultSet alertRs = alertStmt.executeQuery();

while (alertRs.next()) {
	String itemid = alertRs.getString("Itemid");
	String updateQuery = "UPDATE Alerts SET is_new_alert = FALSE WHERE username=? AND Itemid=? AND is_new_alert=TRUE AND is_transaction=FALSE";
	PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
	updateStmt.setString(1, username);
	updateStmt.setString(2, itemid);
	updateStmt.executeUpdate();
	}
	
	conn.close();


session.invalidate();
response.sendRedirect("login.jsp"); %>

 /* String userId=(String)session.getAttribute("user");if(userId == null) {
	
} */

