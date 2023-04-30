<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
 <%@ page import ="java.sql.*" %>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Submit Answer</title>
</head>
<body>
	<h1>Submit Answer</h1>
	
	<%
		// Get the form parameters
		String username = request.getParameter("username");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		String customer_rep_username = request.getParameter("customer_rep");
		
		// Insert the answer into the database
		Class.forName("com.mysql.jdbc.Driver");
		ApplicationDB DBconnect = new ApplicationDB();
		Connection conn = DBconnect.getConnection();
		PreparedStatement stmt = null;
		
		try {
			
			String sql = "UPDATE `Q/A` SET `answer`=?, `customer_rep`=? WHERE `username`=? AND `question`=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, answer);
			stmt.setString(2, customer_rep_username);
			stmt.setString(3, username);
			stmt.setString(4, question);
			stmt.executeUpdate();
			
			out.println("<p>Answer submitted successfully!</p>");
			
		} catch (Exception e) {
			e.printStackTrace();
			out.println("<p>Error submitting answer.</p>");
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	%>
<p><a href="qna.jsp">Back to Questions and Answers</a></p>
	
</body>
</html>