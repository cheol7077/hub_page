<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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