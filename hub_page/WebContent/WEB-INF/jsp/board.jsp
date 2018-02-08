<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="css/timeline.css" rel="stylesheet" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="js/thum.js" type="text/javascript"></script>
<style>
#screenshot {
	position: absolute;
	border: 1px solid #ccc;
	background: #333;
	padding: 5px;
	display: none;
	color: #fff;
}
</style>


<c:forEach var="board" items="${boardList}">

	<c:set value="${board.overlab}" var="overlab" />

	<div class="qa-message-list" id="wallmessages">
		<div class="message-item" id="m16">
			<div class="message-inner">
				<div class="message-head clearfix">
					<div class="avatar pull-left">
						<img src="cp/${board.cid }.png" />
					</div>
					<div class="user-detail">
						<a href="${board.url }" rel="${board.thumbnail }"
							class="boardurl screenshot">${board.title}</a>
						<h4 class="handle">
							<span class="glyphicon glyphicon-heart" style="color: #E3AC1B;"></span>조회수:${board.hits }
							<span class="glyphicon glyphicon-pencil" style="color: #E3AC1B;"></span>
							댓글수:${board.coCnt } <br />
							<span class="glyphicon glyphicon-time" style="color: #E3AC1B;"></span>날짜:${board.date }
						</h4>
						${board.dateCompare }
						<c:if test="${board.overlab ne '' }">
							<button class="overlab" value="${board.id}::${board.overlab}">보기</button>
							<div id="${board.id}"></div>
						</c:if>
						<%
							if (session.getAttribute("sessionId") != null) {
						%>
						<button class="scrap" value="${board.id}">스크랩</button>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>