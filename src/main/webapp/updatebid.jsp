<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<%
String placedbid = (request.getParameter("placedbid"));
String Itemid = request.getParameter("Itemid");
Class.forName("com.mysql.jdbc.Driver");
String user=(String)session.getAttribute("user");
ApplicationDB DBconnect = new ApplicationDB();
Connection con = DBconnect.getConnection();		
Statement stmt = con.createStatement();

try {
	String updateItem="UPDATE Item SET currentbid='"+(String)placedbid+"' where Itemid='"+Itemid+"'";
	PreparedStatement pstmt = con.prepareStatement(updateItem);
	int rowsUpdated = pstmt.executeUpdate();
 } catch (SQLException ex) {
   out.println("Error: " + ex.getMessage());
   String redirect="SelectedItem.jsp?Itemid="+Itemid;
   out.println("Couldnot update <a href="+redirect+">try again</a>");
}
try {
	ResultSet result=stmt.executeQuery("Select * from Bids where username='"+user+"' and Itemid='"+Itemid+"'");
	if(result.next()){
		String price=result.getString("pricelist")+";"+placedbid;
		String updateBids="UPDATE Bids SET pricelist='"+price+"' where username='"+user+"' and Itemid='"+Itemid+"'";
		PreparedStatement ps1=con.prepareStatement(updateBids);
		int rowsUpdated1=ps1.executeUpdate();
	}
	else{
		String insert="INSERT INTO Bids(username, Itemid, pricelist)"+"VALUES (?, ?, ?)";
		PreparedStatement ps=con.prepareStatement(insert);
		ps.setString(1, user);
		ps.setString(2, Itemid);
		ps.setString(3, placedbid);
		ps.executeUpdate();
	}
	con.close();
	response.sendRedirect("SelectedItem.jsp?Itemid="+Itemid);
 } catch (SQLException ex) {
	 out.println(user);
	 out.println("Error: " + ex.getMessage());
	   String redirect="SelectedItem.jsp?Itemid="+Itemid;
	   out.println("Couldnot update <a href="+redirect+">try again</a>");
}

%>