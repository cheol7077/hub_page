<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="board" items="${requestScope.list }">
	<div class="qa-message-list" id="wallmessages">
		<div class="message-item" id="m16">
			<div class="message-inner">
				<div class="message-head clearfix">
					<div class="avatar pull-left">
						<a href="./index.php?qa=user&qa_1=Oleg+Kolesnichenko"><img
							src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"></a>
					</div>
					<div class="user-detail">
						<h5 class="handle">${board.title }</h5>
						<div class="post-meta">
							<div class="asker-meta">
								<span class="qa-message-what"></span> <span
									class="qa-message-when"> <span
									class="qa-message-when-data">${board.date }</span>
								</span> <span class="qa-message-who"> <span
									class="qa-message-who-pad">by </span> <span
									class="qa-message-who-data"><a
										href="./index.php?qa=user&qa_1=Oleg+Kolesnichenko">${board.hits }</a></span>
								</span>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="qa-message-content">${board.content }</div> -->
				 <div>
				<c:set var="content" value="${board.content}"/>
					<% String content = (String)pageContext.getAttribute("content");
					content = content.replace("\\", "::");
					String contents[] = content.split("::");
					for(int i=0; i<contents.length; i++){
						if(contents[i].startsWith("http")&&((contents[i].endsWith("jpg")||(contents[i].endsWith("bmp"))||(contents[i].endsWith("gif"))||(contents[i].endsWith("png"))||(contents[i].endsWith("jpeg")) ))){
							contents[i] = "<img width = 200 height = 200 src =\'" +contents[i] + "\'/>" + "";
						}else if(contents[i].startsWith("https://www.youtube.com")||(contents[i].startsWith("https://media"))){
							contents[i] = "<iframe src =\'" +contents[i] + "\'/>"  ;
						}else if(contents[i].startsWith("http")){
							contents[i] = "<a href =\'" +contents[i] + "\'/>" ;						
						}
						else{
							contents[i] = contents[i].replace("::","");
						}
						out.print("<p>" + contents[i] + "</p>");
					}
					%>
				</div> 
				
			</div>
		</div>
	</div>
</c:forEach>