<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-3.2.1.js"></script>
<link href="css/timeline.css" rel="stylesheet" />
<link href="css/view.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
>
<script>
	var parameters = {
		index : 0,
		order : 'hits',
		time : 24,
		siteList : [ 'c1', 'c2', 'c3', 'c4' ]
	}

	var id_check = "중복!"
	var check_flag = 0

	function boardView() {
		$.ajax({
			url : 'board.do',
			dataType : 'text',
			data : {
				index : parameters.index,
				order : parameters.order,
				time : parameters.time,
				siteList : parameters.siteList
			},
			success : function(data) {
				if (parameters.index == 0)
					$('#board').html(data)
				else
					$('#board').append(data)
			}
		})
	}

	function selectSite() {
		var check = false
		parameters.siteList = []
		$(".site:checked").each(function() {
			parameters.siteList.push($(this).val())
			check = true
		})
		
		if(!check){
			parameters.siteList=['null']
		}
		
		boardView()
	}

	$(function() {
		boardView()

		$(window).scroll(function() {
			var sh = $(window).scrollTop() + $(window).height();
			var dh = $(document).height();
			if (sh == dh) {
				parameters.index += 10;
				boardView()
			}
		})

		$('.order').click(function() {
			parameters.index = 0
			parameters.order = $(this).val()
			boardView()
		})

		$('.time').click(function() {
			parameters.index = 0
			parameters.time = $(this).val()
			boardView()
		})

		$('.site').click(function() {
			parameters.index = 0
			selectSite()
		})

		$('#total').click(function() {
			parameters.index = 0
			$('.site').prop('checked', true)
			selectSite()
		})
		
		$(document).on('click', '.scrap', function() {
			$.ajax({
				url : 'scrap.do',
				data : {
					bid : $(this).val()
				},
				success : function(data) {
					if (data != -1)
						alert(data + '번 게시물 스크랩하였습니다')
					else
						alert('이미 추가하였습니다')
				}
			})
		})

		document.getElementById('submit').onclick = function() {
			var userID = $('#userID').val();
			var password = $('#password').val()
			
			if(check_flag == 0) {
				alert('중복체크하세요!')
				return
			}
			
			if(password == "") {
				alert('비밀번호 입력하세요!')
				return
			}
			
			if(password != $('#passwordCheck').val()) {
				alert("비밀번호가 일치하지않습니다!")
				return
			}
				
			location = 'signup.do?userID=' + userID + '&password=' + password;
		}
		
		document.getElementById('check').onclick = function() {
			$.ajax({
				url : 'memberCheck.do',
				data : {
					userID : document.getElementById('userID').value
				},
				success : function(data) {
					if($.trim(data) != id_check)
						check_flag = 1
					else
						check_flag = 0
					$('#checkmeg').html(data)
				}
			})
		}
		
		document.getElementById('login').onclick = function() {
			location.href = "login.do?userID=" + $('#loginId').val() + "&password=" + $('#loginPw').val()
		}
	})
</script>
<title>main.jsp</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"
></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"
></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
></script>
</head>
<body class="homepage">
	<div id="page-wrapper">
		<!-- Header -->
		<div id="header-wrapper">
			<div class="user" style="background-color: #FDE9DF;">
				<%
					if (session.getAttribute("sessionId") == null) {
				%>
				<button type="button" class="btn" data-toggle="modal"
					data-target="#exampleModal"
				>JOIN</button>
				<button type="button" class="btn" data-toggle="modal"
					data-target="#exampleModal2"
				>LOGIN</button>
				<%
					} else {
				%>
				<a href='logout.do'>로그아웃</a> <a href='scrapBoard.do'>내 스크랩</a>
				<%
					}
				%>
			</div>
			<div id="header">
				<!-- Logo -->
				<h1 class="w3-container w3-center w3-animate-left">
					<!-- <a href="index.html"> -->
					THE HUB FACTORY</a>
				</h1>
				<button id="total">전체</button>
				<input type="checkbox" id="fm" class="site" value="c1"
					checked="checked"
				>
				<label for="fm">에펨코리아</label>
				<input type="checkbox" id="ppom" class="site" value="c2"
					checked="checked"
				>
				<label for="ppom">뽐뿌</label>
				<input type="checkbox" id="univ" class="site" value="c3"
					checked="checked"
				>
				<label for="univ">웃대</label>
				<input type="checkbox" id="ruliweb" class="site" value="c4"
					checked="checked"
				>
				<label for="ruliweb">루리웹</label><br />

				<button class="button order" value="hits">조회수</button>
				<button class="button order" value="commentCnt">댓글수</button>
				<button class="button order" value="date">최신</button>
				<br />
				<button class="button time" value="3">3시간전</button>
				<button class="button time" value="6">6시간전</button>
				<button class="button time" value="12">12시간전</button>
				<button class="button time" value="24">24시간전</button>
				<br />
				<div></div>
				<form action="boardSearch.do" method="post" name="searchForm">
					<select name="searchOption">
						<option value="titleSearch">검색 방법 선택</option>
						<option value="titleSearch">제목</option>
						<option value="contentSearch">내용</option>
						<option value="titleContentSearch">제목+내용</option>
					</select>
					<input type="text" size="40" name="searchKeyword"
						id="searchKeyword" minlength="2" maxlength="10"
						required="required"
					/>
					<input type="hidden" value=0 name="index">
					<input type="hidden" value="" name="order">
					<input type="hidden" value=24 name="time">
					<input type="submit" value="글검색" id="search">
				</form>
				<!-- 	<p>A responsive template by HTML5 UP</p>-->
				</header>
				</section>
			</div>
		</div>
	</div>
	<!-- JOIN Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
	>
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">JOIN</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"
					>
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table>
						<tr>
							<td>ID</td>
							<td>
								<input type="text" id="userID" />
							</td>
							<td>
								<button class="btn btn-secondary" id="check">중복확인</button>
							</td>
							<td id='checkmeg'></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td>
								<input type="password" id="password" />
							</td>
						</tr>
						<tr>
							<td>비밀번호 재입력</td>
							<td>
								<input type="password" id="passwordCheck" />
							</td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal"
					>Close</button>
					<button type="button" id="submit" class="btn btn-primary">JOIN</button>
				</div>
			</div>
		</div>
	</div>
	<!-- LOginModal -->
	<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
	>
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">LOGIN</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"
					>
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form name="input" method="post" action="">
						<div class="input-group">
							<span class="input-group-addon" style="width: 40px;"><i
								class="glyphicon glyphicon-user"
								style="font-size: 20px; color: #0881A3;"
							></i></span>
							<input id="loginId" type="text" class="form-control" name="id"
								placeholder="Id"
							>
						</div>
						<div class="input-group">
							<span class="input-group-addon" style="width: 40px;"><i
								class="glyphicon glyphicon-lock"
								style="font-size: 20px; color: #0881A3;"
							></i></span>
							<input id="loginPw" type="password" class="form-control"
								name="password" placeholder="Password"
							>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal"
					>Close</button>
					<button id="login" type="button" class="btn btn-primary">LOGIN</button>
					<button type="button" class="btn btn-primary">JOIN</button>
				</div>
			</div>
		</div>
	</div>
	<div id="board"></div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/skel-viewport.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
</body>
</html>