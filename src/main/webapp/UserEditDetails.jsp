<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Upload</title>
</head>
<body>
	<t:BaseHtml>
		<jsp:body>
			<h1>Update Details</h1>
			<div class="container" style="font-size: 20px;">
				<hr>
					<form>
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0">Username</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputProductname" placeholder="existing username" style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  
					  <div class="form-group row">
					    <label for="inputBrand" class="col-sm-2 col-form-label py-0">Email</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputBrand" placeholder="existing email" style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0">Phone</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputProductname" placeholder="existing phone number" style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputColour" class="col-sm-2 col-form-label py-0">Password</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputColour" placeholder="existing password" style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputBasePrice" class="col-sm-2 col-form-label py-0">Interests</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputBasePrice" placeholder="existing interests" style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputBasePrice" class="col-sm-2 col-form-label py-0">Bank name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputBasePrice" placeholder="existing Bank name" style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputBasePrice" class="col-sm-2 col-form-label py-0">Account Number</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputBasePrice" placeholder="existing Account number" style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputBasePrice" class="col-sm-2 col-form-label py-0">Routing Number</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputBasePrice" placeholder="existing Routing number" style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  
					 <div class="form-group row">
					    <div class="col-sm-10">
					      <button type="submit" class="btn btn-primary">Update Details</button>
					    </div>
					  </div>
					</form>
			</div>
		</jsp:body>
	</t:BaseHtml>
</body>
</html>