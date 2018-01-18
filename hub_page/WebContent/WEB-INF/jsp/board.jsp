<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/timeline.css" rel="stylesheet" />
<link href="css/view.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
>
<script>
$(function() {
	
 	$('.boardurl').click(function() {
		var url = $(this).attr('href'); 
	
		$.ajax({
			data: {
				url :url
			},
			success:function(data){
				
				 $('.iframe').replaceWith("<div class='iframe' style='float: left; width: 67%;'>"+
				 '<iframe src='+url+' style="display:block; width:100vw; height: 100vh"/></div>')
			}
		})
		return false;
	})
});
 
</script>
<div>
<c:forEach var="board" items="${boardList}">
	<div class="qa-message-list" id="wallmessages">
		<div class="message-item" id="m16">
			<div class="message-inner">
				<div class="message-head clearfix">
					<div class="avatar pull-left">
						<img src="cp/${board.communityID }.png" />
					</div>
					<div class="user-detail">
						<a href="${board.url }"class="boardurl">${board.title}</a>
						
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
				<div class="qa-message-content">${board.thumbnail }</div>
			</div>
		</div>
	</div>
</c:forEach>
</div>
<div class="iframe"></div>
