<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<%
String placedbid = (request.getParameter("placedbid"));
int minimum_increment=Integer.parseInt(request.getParameter("min_inc"));
String Itemid = request.getParameter("Itemid");
Class.forName("com.mysql.jdbc.Driver");
String user=(String)session.getAttribute("user");
ApplicationDB DBconnect = new ApplicationDB();
Connection con = DBconnect.getConnection();		
Statement stmt = con.createStatement();
String checked= request.getParameter("auto_bid");
String limit= request.getParameter("maxlimit");


try {
		String updateItem="UPDATE Item SET currentbid='"+placedbid+"' where Itemid='"+Itemid+"'";
		PreparedStatement pstmt = con.prepareStatement(updateItem);
		int rowsUpdated = pstmt.executeUpdate();
		String checkon="Select * FROM Bids WHERE pricelist=(Select MAX(pricelist) FROM Bids WHERE username='"+user+"' and Itemid='"+Itemid+"') and username='"+user+"' and Itemid='"+Itemid+"'";
		Statement stmt1 = con.createStatement();
		ResultSet result=stmt1.executeQuery(checkon);
		String insert="INSERT INTO Bids(username, Itemid, pricelist, maxlimit, autobid1)"+"VALUES (?, ?, ?, ?, ?)";
		PreparedStatement ps=con.prepareStatement(insert);
		ps.setString(1, user);
		ps.setString(2, Itemid);
		ps.setString(3, placedbid);
		if(checked==null){
			if(result.next()){
				if(Integer.parseInt(result.getString("maxlimit")) > Integer.parseInt(placedbid)){
					ps.setString(4, result.getString("maxlimit"));
				}
				else{
					ps.setString(4, placedbid);
				}
				ps.setString(5, result.getString("autobid1"));
			}
			else{
				ps.setString(4, placedbid);
				ps.setString(5, "0");
			}
		}
		else{
			ps.setString(4, limit);
			ps.setString(5, "1");
		}
		ps.executeUpdate();
		Statement st1=con.createStatement();
		String check="SELECT b1.username as username, b1.pricelist as pricelist, b1.maxlimit as maxlimit, b1.autobid1 as autobid1 FROM Bids b1 JOIN (SELECT username, MAX(bidId) AS max_bidId FROM Bids where Itemid='"+Itemid+"' GROUP BY username) b2 ON b1.username = b2.username AND b1.bidId = b2.max_bidId ORDER BY b1.maxlimit DESC LIMIT 2";
		ResultSet res1=st1.executeQuery(check);
		if(res1.next()){
			int val1=Integer.parseInt(res1.getString("maxlimit"));
			String autobid1=res1.getString("autobid1");
			String username1=res1.getString("username");
			int price1=Integer.parseInt(res1.getString("pricelist"));
			if(res1.next()){
				int val2=Integer.parseInt(res1.getString("maxlimit"));
				String autobid2=res1.getString("autobid1");
				String username2=res1.getString("username");
				int price2=Integer.parseInt(res1.getString("pricelist"));
				if(autobid1.equals("1")){
						String insert1="Insert into Bids(username, Itemid, pricelist, maxlimit, autobid1) VALUES(?, ?, ?, ?, ?)";
						PreparedStatement ps1=con.prepareStatement(insert1);
						ps1.setString(1, username1);
						ps1.setString(2, Itemid);
						int finalval= val2+minimum_increment;
						ps1.setString(3, String.valueOf(finalval));
						ps1.setString(4, String.valueOf(val1));
						ps1.setString(5, autobid1);
						ps1.executeUpdate();
						String updateItem1="UPDATE Item SET currentbid='"+String.valueOf(finalval)+"' where Itemid='"+Itemid+"'";
						PreparedStatement pstmt1 = con.prepareStatement(updateItem1);
						int rowsUpdated1 = pstmt1.executeUpdate();
				}
			}
		}
	con.close();
	response.sendRedirect("SelectedItem.jsp?Itemid="+Itemid);
 } catch (SQLException ex) {
	 out.println(checked+"   ");
   out.println("Error: " + ex.getMessage());
   String redirect="SelectedItem.jsp?Itemid="+Itemid;
   out.println("Couldnot update <a href="+redirect+">try again</a>");
}

%>