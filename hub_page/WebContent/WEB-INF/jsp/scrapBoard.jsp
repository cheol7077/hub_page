<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-3.2.1.js"></script>
<script src="js/scrap.js"></script>
<link href="css/scrap.css" rel="stylesheet" />
<link href="css/timeline.css" rel="stylesheet" />
<link href="css/view.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 스크랩 2분할 -->
<title>내 스크랩</title>

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header.jsp" flush="false" />
	<div id="scrapBoard">
		<c:forEach var="board" items="${boardList}">
			<div class="qa-message-list" id="wallmessages">
				<div class="message-item" id="m16">
					<div class="message-inner">
						<div class="message-head clearfix">
							<div class="avatar pull-left">
								<img src="cp/${board.communityID }.png" />
							</div>
							<div class="user-detail">
								<a href="${board.url }" class="boardurl">${board.title}</a>
								<button class="delete" value="${board.id}">삭제</button>
							</div>
						</div>
						<h4 class="handle" style="font-size: 12px;">조회수:${board.hits }
							댓글수:${board.commentCnt } 날짜:${board.date }</h4>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<iframe id="scrapContent"></iframe>
</body>
</html>