<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.onlineauctionsystem.pkg.*"%>
 <%@ page import ="java.sql.*" %>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Submit Question</title>
</head>
<body>
	<h1>Submit Question</h1>
	<%
	String username = request.getParameter("username");
	String question = request.getParameter("question");
	out.println("<p>Your question: </p>");
	out.println(username);
	out.println(question);
	// Validate the input
	if (username == null || username.isEmpty() || question == null || question.isEmpty()) {
		out.println("<p>Please provide both a username and a question.</p>");
	} else {
		// Save the question to the database
		Class.forName("com.mysql.jdbc.Driver");
		ApplicationDB DBconnect = new ApplicationDB();
		Connection conn = DBconnect.getConnection();
		PreparedStatement stmt = null;
		
		try {
			
			String sql = "INSERT INTO `Q/A` (username, question) VALUES (?, ?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, question);
			stmt.executeUpdate();
			
			out.println("<p>Your question has been submitted.</p>");
			
		} catch (Exception e) {
			e.printStackTrace();
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
	}
%>

<p><a href="qna.jsp">Back to Questions and Answers</a></p>
</body>
</html>
