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
		    <a href="UserEditDetails.jsp">Profile</a>
		    <a href="#clients">Clients</a>
		    <a href="#contact">Contact</a>
	    </div>
    	<div class="main">
	<h1>Question and Answer</h1>
	
	<h2>Ask a Question</h2>
	<form action="submit_question.jsp" method="post">
		<label for="username">Username:</label>
		<input type="text" id="username" name="username">
		<br><br>
		<label for="question">Question: &nbsp;&nbsp;</label>
		<textarea id="question" name="question"></textarea>
		<br>
		<input type="submit" value="Submit Question">
	</form>
	
	<br>
	<hr>
	
	<h2>Answers: </h2>
	
	<%-- Loop through all the questions and display them --%>
	<%-- You could also add pagination or filtering options here --%>
	<%
		// Query the database to get all the questions
		Class.forName("com.mysql.jdbc.Driver");
		ApplicationDB DBconnect = new ApplicationDB();
		Connection con = DBconnect.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM `Q/A`";
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				String username = rs.getString("username");
				String question = rs.getString("question");
				String answer = rs.getString("answer");
				
				// Display the question and answer
				out.println("<h3>" + username + " asked: " + question + "</h3>");
				
				if (answer != null && !answer.isEmpty()) {
					out.println("<p><strong>Answer:</strong> " + answer + "</p>");
				} else {
					// Display a form for customer reps to answer the question
					out.println("<form action='submit_answer.jsp' method='post'>");
					out.println("<input type='hidden' name='username' value='" + username + "'>");
					out.println("<input type='hidden' name='question' value='" + question + "'>");
					out.println("<label for='answer'>Answer: &emsp;&emsp;&emsp;&emsp; </label>");
					out.println("<textarea id='answer' name='answer'></textarea>");
					out.println("<br>");
					out.println("<label for='customer_rep'>Customer Rep username: </label>");
					out.println("<input type='text' id='cust_rep' name='customer_rep'>");
					out.println("<br>");
					out.println("<input type='submit' value='Submit Answer'>");
					out.println("</form>");
				}
				
				out.println("<hr>");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	%>
		<br><br><br>
			</div>
    	</div>
</body>
</html>
<%

}

%>