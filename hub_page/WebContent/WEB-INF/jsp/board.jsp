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
	var index = 0;
	var order = "";
	var time = "";
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
		order = request.getParameter("order");
		time = request.getParameter("time");
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
						time : time
					},
					success : function(data) {
						$('body').append(data);
					}
				})
			}
		})

		$('.order').click(function() {
			location.href = HEAD + $(this).val() + MID + time
		})

		$('.time').click(function() {
			location.href = HEAD + order + MID + $(this).val()
		})

		$(document).on('click', '.scrap', function() {
			location.href = "scrap.do?uid="
		})
	});
</script>

<title>board.jsp</title>
</head>
<body>
	<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
	<div></div>
	<input type="button" class="button1" value="에펨코리아" />
	<input type="button" class="button1" value="뽐뿌" />
	<input type="button" class="button1" value="클리앙" />
	<br />

	<button class="button1 order" value="hits">조회수</button>
	<button class="button1 order" value="commentCnt">댓글수</button>
	<button class="button1 order" value="date">최신</button>
	<br />

	<button class="button1 time" value="3">3시간전</button>
	<button class="button1 time" value="6">6시간전</button>
	<button class="button1 time" value="12">12시간전</button>
	<button class="button1 time" value="24">24시간전</button>
	<div></div>
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
							<div class="post-meta">
								<div class="asker-meta">
									<span class="qa-message-what"></span> <span
										class="qa-message-when"><i
										class="glyphicon glyphicon-time"></i><span
										class="qa-message-when-data">${board.date }</span> </span> <span
										class="qa-message-who"> <span
										class="qa-message-who-pad">by </span> <span
										class="qa-message-who-data"><a
											href="./index.php?qa=user&qa_1=Oleg+Kolesnichenko">${board.hits }</a></span>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="qa-message-content">${board.content }</div>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>