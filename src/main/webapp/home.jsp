<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link href="StandardTemp.css" rel="stylesheet" type="text/css">
</head>
<body>
	<t:BaseHtml>
		<jsp:body>
			<div>Welcome ${user}</div>
			<div class="container mx-1">
				<div class="row">
					<div class="col-sm-4">
						<div class="card" style="width:300px">
							
						  	<div class="card-body">
						    	<h4 class="card-title">Laptops</h4>
						    	<a href="items_display.jsp?category=Laptop">
						    	<img class="card-img-top homepage_img" src="laptopimg.jpg" alt="laptop image">
						    	<button class="btn btn-primary homepage_btn">Explore/View Laptops</button>
						    	</a>
						  	</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="card" style="width:300px">
							
						  	<div class="card-body">
						    	<h4 class="card-title">Mobiles</h4>
						    	<a href="items_display.jsp?category=Mobile">
						    	<img class="card-img-top homepage_img" src="mobileimg.jpg" alt="Mobile image">
						    	<button class="btn btn-primary homepage_btn">Explore/View Mobiles</button>
						    	</a>
						  	</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="card" style="width:300px">
							
						  	<div class="card-body">
						    	<h4 class="card-title">Accessories</h4>
						    	<a href="items_display.jsp?category=Accessory">
						    	<img class="card-img-top homepage_img" src="accessoriesimg.webp" alt="Accessory image">
						    	<button class="btn btn-primary homepage_btn">Explore/View Accessories</button>
						    	</a>
						  	</div>
						</div>
					</div>
				</div>
			</div>
		</jsp:body>
	</t:BaseHtml>
</body>
</html>
