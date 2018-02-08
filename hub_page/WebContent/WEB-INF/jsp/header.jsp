<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/timeline.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Passion+One"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="js/jquery-3.2.1.js"></script>
<script src="js/header.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>main.jsp</title>
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
</head>
<body>
	<!-- 
		<div id="header-wrapper">  -->
	<div class="user" style="background-color: #E3AC1B">
		<%
			if (session.getAttribute("sessionId") == null) {
		%>

		<button type="button" class="btn" data-toggle="modal"
			data-target="#exampleModal">JOIN</button>
		<button type="button" class="btn" data-toggle="modal"
			data-target="#exampleModal2">LOGIN</button>
		<%
			} else {
		%>
		<button id="logout" class="btn">logout</button>
		<button id="myscrap" class="btn">my scrap</button>
		<%
			}
		%>

	</div>
	<div id="page-wrapper">

		<!-- Logo -->
		<h1
			style="font-family: 'Passion One', cursive; margin: 0 0 0 0; padding: 0 0 0 0; color: #122965;"
			class="w3-container w3-center w3-animate-left">
			<a href='main.do'>THE HUB FACTORY</a>
		</h1>


	</div>




	<!-- JOIN Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">JOIN</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<table>
						<tr>
							<td>ID</td>
							<td><input type="text" id="userID" /></td>
							<td>
								<button class="btn btn-secondary" id="check">중복확인</button>
							</td>
							<td id='checkmeg'></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" id="password" /></td>
						</tr>
						<tr>
							<td>비밀번호 재입력</td>
							<td><input type="password" id="passwordCheck" /></td>
						</tr>
					</table>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" id="submit" class="btn btn-primary">JOIN</button>
				</div>
			</div>
		</div>
	</div>
	<!-- LOginModal -->
	<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">LOGIN</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form name="input" method="post" action="login.do">
						<div class="input-group">
							<span class="input-group-addon" style="width: 40px;"><i
								class="glyphicon glyphicon-user"
								style="font-size: 20px; color: #0881A3;"></i></span> <input
								id="loginId" type="text" class="form-control" name="userID"
								placeholder="Id">
						</div>
						<div class="input-group">
							<span class="input-group-addon" style="width: 40px;"><i
								class="glyphicon glyphicon-lock"
								style="font-size: 20px; color: #0881A3;"></i></span> <input
								id="loginPw" type="password" class="form-control"
								name="password" placeholder="Password">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="login" type="button" class="btn btn-primary">LOGIN</button>
					<button type="button" class="btn btn-primary">JOIN</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>