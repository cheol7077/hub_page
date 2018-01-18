<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- 스크랩 2분할 -->
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
<title>Insert title here</title>
</head>
<body>
<%-- <jsp:include page="/WEB-INF/jsp/main.jsp" flush="true">
</jsp:include> --%>
			<jsp:include page="/WEB-INF/jsp/header.jsp" flush="false"/>

<div class="iframe1"style="float: left; width: 33%;">
	<c:forEach var="board" items="${requestScope.list }">
		<div class="qa-message-list" id="wallmessages">
			<div class="message-item" id="m16">
				<div class="message-inner">
					<div class="message-head clearfix">
						<div class="avatar pull-left">
							${board.thumbnail }
						</div>
						<div class="user-detail">
						<a href="${board.url }" class="boardurl">${board.title}</a>
						</div>
						</div>
	<div class="qa-message-content"><h4 class="handle" style="font-size:12px;">조회수:${board.hits } 댓글수:${board.commentCnt }
								날짜:${board.date }</h4>
							</div>
				<%-- 			<div class="post-meta">
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
							</div> --%>
					<%-- 
				
					<div class="qa-message-content">${board.content }</div> --%>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<div class="iframe"></div>
</body>
</html>