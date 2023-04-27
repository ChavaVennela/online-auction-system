<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User list page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<t:BaseHtml>
		<jsp:body>
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="main-box clearfix">
						<div class="table-responsive">
							<table class="table user-list">
							<thead>
								<tr>
								    <th><span>Name</span></th>
									<th><span>Username</span></th>
									<th><span>Email</span></th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tr>
								<td>Mila Kunis</td>
								<td>MK</td>
								<td>hello@gmail.com</td>								
								<td style="width: 20%;">
								<a href="#" class="table-link danger">
									<span class="fa-stack">
									<i class="fa fa-square fa-stack-2x"></i>
									<i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
									</span>
								</a>
						    </td>
							</tr>
							
						  </table>  
						</div>
					</div>
				</div>	
			</div>
		</div>					
		</jsp:body>
	</t:BaseHtml>
</body>
</html>