<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="member.vo.*"%>
<%
	MemberVO mv = (MemberVO) request.getAttribute("member");

	if (mv != null) {
%>
중복!
<%
	} else {
%>
가능!
<%
	}
%>