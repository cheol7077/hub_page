<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-3.2.1.js"></script>
<link href="css/timeline.css" rel="stylesheet" />
<link href="css/view.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script>
	var index = 0
	var order = ""
	var time = ""
	var site = ""
	var HEAD = "board.do?index=0&order="
	var MID = "&time="

	function Request() {
		var requestParam = "";
		this.getParameter = function(param) {
			var url = unescape(location.href);
			var paramArr = (url.substring(url.indexOf("?") + 1, url.length))
					.split("&");
			for (var i = 0; i < paramArr.length; i++) {
				var temp = paramArr[i].split("=");
				if (temp[0].toUpperCase() == param.toUpperCase()) {
					requestParam = paramArr[i].split("=")[1];
					break;
				}
			}
			return requestParam;
		}
	}

	$(function() {
		var request = new Request();
		if (request.getParameter("order") != null
				&& request.getParameter("time") != 0 && request.getParameter("site") != null) {
			order = request.getParameter("order");
			time = request.getParameter("time");
			site = request.getParameter("site")
		}
		$(window).scroll(function() {
			var sh = $(window).scrollTop() + $(window).height();
			var dh = $(document).height();
			if (sh == dh) {
				index += 10;
				$.ajax({
					url : 'board.do',
					data : {
						index : index,
						order : order,
						time : time,
						site : site
					},
					success : function(data) {
						$('body').append(data);
					}
				})
			}
		})

		$('.order').click(function() {
			location.href = "board.do?index=0&order=" + $(this).val() + "&time=" + time +"&site=" + site
		})

		$('.time').click(function() {
			location.href = "board.do?index=0&order=" + order + "&time=" + $(this).val() +"&site=" + site
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

		$('.site').click(function() {
			location.href = "board.do?index=0&order=" + order + "&time=" + time + "&site=" + $(this).val()
		})
	});
</script>
<head>
<title>The Hub Factory</title>
</head>
<body>
	<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
	<div></div>
	<button class="button site" value="c1">전체</button>
	<button class="button site" value="c1">FM코리아</button>
	<button class="button site" value="c2">뽐뿌</button>
	<button class="button site" value="c3">웃긴대학</button>
	<button class="button site" value="c4">루리웹</button>
	<br />

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
		</select> <input type="text" size="40" name="searchKeyword" id="searchKeyword"
			minlength="2" maxlength="10" required="required" /> <input
			type="hidden" value=0 name="index"> <input type="hidden"
			value="" name="order"> <input type="hidden" value=24
			name="time"> <input type="submit" value="글검색" id="search">
	</form>

	<c:forEach var="board" items="${requestScope.list }">
		<div class="qa-message-list" id="wallmessages">
			<div class="message-item" id="m16">
				<div class="message-inner">
					<div class="message-head clearfix">
						<div class="avatar pull-left">
							<a href="./index.php?qa=user&qa_1=Oleg+Kolesnichenko"><i
								class="glyphicon glyphicon-list"
								style="font-size: 36px; color: #FFD6A4;"></i></a>
						</div>
						<div class="user-detail">
							<h5 class="handle">${board.title }</h5>
							<h4 class="handle">조회수:${board.hits } 댓글수:${board.commentCnt }
								날짜:${board.date }</h4>
							<%
								if (session.getAttribute("sessionId") != null) {
							%>
							<button class="scrap" value="${board.id}">스크랩</button>
							<%
								}
							%>
						</div>
					</div>

					<a href="${board.url }" onclick='window.open(this.href, "new","width=700, height=800");return false;' class="boardurl">${board.thumbnail }</a>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>