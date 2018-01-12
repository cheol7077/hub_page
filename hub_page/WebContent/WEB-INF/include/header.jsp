<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/header.css" rel="stylesheet" />

<!-- modal부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script>
	var id_check = "중복!"
	var check_flag = 0
	
	$(function() {
		document.getElementById('submit').onclick = function() {
			if(check_flag == 0) {
				alert('중복체크하세요!')
				return
			}
			
			if($('#password').val() == "") {
				alert('비밀번호 입력하세요!')
				return
			}
			
			if($('#password').val() != $('#passwordCheck').val()) {
				alert("비밀번호가 일치하지않습니다!")
				return
			}
			
			var userID = $('#userID').val();
			var password = $('#password').val();
			
			location = 'signup.do?userID=' + userID + '&password=' + password;
		}
		
		document.getElementById('check').onclick = function() {
			$.ajax({
				url : 'check.do',
				data : {
					userID: document.getElementById('userID').value
				},
				success : function(data) {
					if($.trim(data) != id_check) {
						check_flag = 1
					}
					else
						check_flag = 0

					$('#checkmeg').html(data)
				}
			})
		}
	})
</script>

<title>Insert title here</title>
</head>
<body>

	<div class="main">
		<div class="mainin">
			<img src="img/networking.png" class="mimg"
				style="margin-left: 10px; margin-top: 23px; max-width: 760px; vertical-align: middle">
		</div>
		<div class="mainin">
			<p>THE HUB FACTORY</p>
		</div>

		<button type="button" class="btn" data-toggle="modal"
			data-target="#exampleModal">회원가입</button>
		<button type="button" class="btn" data-toggle="modal"
			data-target="#exampleModal2">로그인</button>

		<!-- 	<input id="signup" type="button" value="회원가입" /> -->
	</div>

	<ul class="sidenav">
		<li><a class="active" href="#home">CONTENT1</a></li>
		<li><a href="#news">CONTENT2</a></li>
		<li><a href="#contact">CONTENT3</a></li>
		<li><a href="#about">CONTENT4</a></li>

	</ul>

	<!-- JOIN Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
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
							<td>id</td>
							<td><input type="text" id="userID" /></td>
							<td><button id="check">중복확인</button></td>
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
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form name="input" method="post" action="">
						<table>
							<tr>
								<td>ID</td>
								<td><input type="text" id="id" /></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="password" id="pw" /></td>
							</tr>
						</table>
						<!-- 			<input type="submit" value="입력완료" /> -->
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">LOGIN</button>
					<button type="button" class="btn btn-primary">JOIN</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>