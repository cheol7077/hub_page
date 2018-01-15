<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%><%-- 
<%@ page import="board.vo.BoardVO" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/timeline.css" rel="stylesheet" />
<link href="css/view.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
						<div class="post-meta">
							<div class="asker-meta">
								<span class="qa-message-what"></span> <span
									class="qa-message-when"><i
									class="glyphicon glyphicon-time"></i><span
									class="qa-message-when-data">${board.date }</span> </span> <span
									class="qa-message-who"> <span class="qa-message-who-pad">by
								</span> <span class="qa-message-who-data"><a
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