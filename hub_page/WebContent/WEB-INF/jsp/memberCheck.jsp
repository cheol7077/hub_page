<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ page import="member.vo.*"%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%
	MemberVO mv = (MemberVO) request.getAttribute("member");

	if (mv != null) {
%>

          <span class="glyphicon glyphicon-remove" style="color:#FF0000;">���Ұ���</span> 

<%
	} else {
%>
          <span class="glyphicon glyphicon-ok" style="color:#0404B4;">��밡��</span> 

<%
	}
%>