<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<t:BaseHtml>
		<jsp:body>
			<div class="container mx-4">
				<div class="row">
					<div class="col-sm-4">
						<div class="card" style="width:300px">
							<img class="card-img-top" src="laptopimg.jpg" alt="laptop image">
						  	<div class="card-body">
						    	<h4 class="card-title">Laptops</h4>
						    	<a href="#" class="btn btn-primary">Explore/View Laptops</a>
						  	</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="card" style="width:300px">
							<img class="card-img-top" src="mobileimg.jpg" alt="Mobile image">
						  	<div class="card-body">
						    	<h4 class="card-title">Mobiles</h4>
						    	<a href="#" class="btn btn-primary">Explore/View Mobiles</a>
						  	</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="card" style="width:300px">
							<img class="card-img-top" src="accessoriesimg.webp" alt="Accessory image">
						  	<div class="card-body">
						    	<h4 class="card-title">Mobiles</h4>
						    	<a href="#" class="btn btn-primary">Explore/View Accessories</a>
						  	</div>
						</div>
					</div>
				</div>
			</div>
		</jsp:body>
	</t:BaseHtml>
</body>
</html>