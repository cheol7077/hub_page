<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/timeline.css" rel="stylesheet" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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

						<h4 class="handle"><span class="glyphicon glyphicon-heart" style="color:#E3AC1B;"></span>조회수:${board.hits }
						<span class="glyphicon glyphicon-pencil" style="color:#E3AC1B;"></span>
						댓글수:${board.commentCnt }
							<br/><span class="glyphicon glyphicon-time"style="color:#E3AC1B;"></span>날짜:${board.date }</h4>
						<%
							if(session.getAttribute("sessionId") != null) {
						%>
						<button value="${board.id}">스크랩</button>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>