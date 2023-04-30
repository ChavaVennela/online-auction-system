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
			<h1>List Product to sell</h1>
			<div class="container" style="font-size: 20px;">
				<hr>
					<form action="upload" method="post" enctype="multipart/form-data">
					  <div class="form-group row">
					    <label for="inputProductname" class="col-sm-2 col-form-label py-0">Product Title</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="prodname" id="inputProductname" placeholder="Product Title/Name" style="width:50%;"
					      required = "required">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputBrand" class="col-sm-2 col-form-label py-0">Brand</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="brand" id="inputBrand" placeholder="Brand Name" style="width:50%;" required = "required">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputColour" class="col-sm-2 col-form-label py-0">Colour</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="colour" id="inputColour" placeholder="Colour of the Product" style="width:50%;">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <fieldset class="form-group">
					    <div class="row">
					      <legend class="col-form-label col-sm-2 pt-0">Category</legend>
					      <div class="col-sm-10">
					        <div class="form-check">
					          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="Laptop" required = "required">
					          <label class="form-check-label" for="gridRadios1">
					            Laptop
					          </label>
					        </div>
					        <div class="form-check">
					          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="Mobile" required = "required">
					          <label class="form-check-label" for="gridRadios2">
					            Mobile
					          </label>
					        </div>
					        <div class="form-check">
					          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios3" value="Accessory" required = "required">
					          <label class="form-check-label" for="gridRadios3">
					          	Accessory
					          </label>
					        </div>
					      </div>
					    </div>
					  </fieldset>
					  <div class="form-group row">
					    <div class="col-sm-2">Is it Re-furbished?</div>
					    <div class="col-sm-10">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="isrefurb" id="gridCheck1">
					        <label class="form-check-label" for="gridCheck1">
					        </label>
					      </div>
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputBasePrice" class="col-sm-2 col-form-label py-0">Base Price</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="baseprice" id="inputBasePrice" placeholder="Base Bid Price" style="width:50%;"
					      required = "required">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputSecretSellPrice" class="col-sm-2 col-form-label py-0">Minimum Selling Price</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="secretprice" id="inputSecretSellPrice" placeholder="Minimum Selling Price for the product"
					      	style="width:50%;" required = "required">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputMinIncrement" class="col-sm-2 col-form-label py-0">Minimum Increment</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="minincrement" id="inputMinIncrement" placeholder="Minimum Increment for each bid"
					      	style="width:50%;" required = "required">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputExpiryTime" class="col-sm-2 col-form-label py-0">Expiry Time</label>
					    <div class="col-sm-10">
					      <input type="datetime-local" data-format="MM/dd/yyyy HH:mm:ss PP" class="form-control" name="exptime"
					      id="inputExpiryTime" style="width:50%;" required = "required">
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <label for="inputProductPhoto" class="col-sm-2 col-form-label py-0">Product Photo</label>
					    <div class="col-sm-10">
					      <input type="file" name="imgfile" id="inputProductPhoto" class="form-control" style="width:50%;" >
					    </div>
					  </div>
					  <div style="font-size: 10px;">
					    <br>
					  </div>
					  <div class="form-group row">
					    <div class="col-sm-10">
					      <button type="submit" class="btn btn-primary">Submit</button>
					    </div>
					  </div>
					</form>
			</div>
			<br><br>
		</jsp:body>
	</t:BaseHtml>
</body>
</html>