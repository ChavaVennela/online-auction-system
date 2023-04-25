<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Selected Item</title>
</head>
<body>
	<t:BaseHtml>
		<jsp:body>
			<div>
	    		<h3>Item Title </h3>
	    	</div>
	    	<hr>
	    	<div class="container">
	    		<div class="row">
	    			<div class="col">
	    				Picture
	    			</div>
	    			<div class="col">
	    				Bid and other Info
	    				<div>
	    					<p>Condition: ... </p>
	    					<p>Time Left: </p>
	    				</div>
	    				<hr>
	    				<div>
	    					<p>Current Bid: </p>
	    					<p>Number of Bids: </p> <!--  should be a link -->
	    				</div>
	    				<div>
	    					<button type="button" class="btn btn-primary">Place Bid</button>
	    				</div>
	    			</div>
	    		</div>
	    	</div>
	    </jsp:body>
	</t:BaseHtml>
</body>
</html>