<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
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
<title>Contact Us</title>
<link href="StandardTemp.css" rel="stylesheet" type="text/css">
<style>
.contactus-head {
  font-size: 40px;
  line-height: 50px;
  font-weight: 700;
  margin-top: 0px;
  margin-right: 0px;
  margin-bottom: 10px;
  margin-left: 0px;
}
.contactus-subhead {
  max-width: 385px;
  color: #939393;
  font-size: 18px;
  margin-top: 0px;
  margin-right: 0px;
  margin-bottom: 50px;
  margin-left: 0px;
}
</style>
</head>
<body>
	<t:BaseHtml>
		<jsp:body>
			<div class="container mx-1">
				<div class="text-content">
            <p class="text-blk contactus-head">
              Contact us
            </p>
          </div>
          <div class="workik-contact-bigbox">
            <div class="workik-contact-box">
              <div class="phone text-box">
                <p class="contact-text"><img class="contact-svg" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/ET21.jpg">
                +494 485 5551018</p>
              </div>
              <div class="address text-box">
                <p class="contact-text"><img class="contact-svg" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/ET22.jpg">
                hello@oas.com
                </p>
              </div>
              <div class="mail text-box">
               <p class="contact-text"> <img class="contact-svg" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/ET23.jpg">
                527 Livingston, Rutgers, New Brunswick, 08901
                </p>
              </div>
            </div>
            </div>
			</div>
		</jsp:body>
	</t:BaseHtml>
</body>
</html>
<%
}
%>
