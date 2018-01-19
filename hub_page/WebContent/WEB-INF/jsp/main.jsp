<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="js/jquery-3.2.1.js"></script>
<script src="js/main.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->

<link href="css/timeline.css" rel="stylesheet" />
<link href="css/view.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/main.css" />

<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>THE HUB FACTORY</title>
</head>
<body class="homepage">
	<div id="page-wrapper">
		<!-- Header -->
		<div id="header-wrapper">
			<div id="header">
				<jsp:include page="/WEB-INF/jsp/header.jsp" flush="false" />
				<button id="total">전체</button>
				<input type="checkbox" id="fm" class="site" value="c1"
					checked="checked"> <label for="fm">에펨코리아</label> <input
					type="checkbox" id="ppom" class="site" value="c2" checked="checked">
				<label for="ppom">뽐뿌</label> <input type="checkbox" id="univ"
					class="site" value="c3" checked="checked"> <label
					for="univ">웃대</label> <input type="checkbox" id="ruliweb"
					class="site" value="c4" checked="checked"> <label
					for="ruliweb">루리웹</label><br />

				<button class="button init" value="init">초기화</button>
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
				<form method="get" name="searchForm" id="searchForm"
					onsubmit="return false">
					<select name="searchOption" id="searchOption">
						<option value="titleSearch">검색 방법 선택</option>
						<option value="titleSearch">제목</option>
						<option value="contentSearch">내용</option>
						<option value="titleContentSearch">제목+내용</option>
					</select> <input type="text" size="40" name="searchKeyword"
						id="searchKeyword" maxlength="10" onkeyup="enterkey();" /> <input
						type="hidden" value=0 name="index" id="index"> <input
						type="hidden" value="hits" name="order" id="order"> <input
						type="hidden" value="24" name="time" id="time"> <input
						type="hidden" value="c1" name="siteList[]" id="siteList[]">
					<input type="hidden" value="c2" name="siteList[]"> <input
						type="hidden" value="c3" name="siteList[]"> <input
						type="hidden" value="c4" name="siteList[]"> <input
						type="button" value="글검색" name="search" id="search"> <br />
					<b id="searchResult"></b>
				</form>
				<!-- 	<p>A responsive template by HTML5 UP</p>-->
			</div>
		</div>
		<div id="board"></div>
		<iframe id="content">hello</iframe>
	</div>
</body>
</html>