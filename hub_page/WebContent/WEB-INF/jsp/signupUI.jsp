<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="input" method="post" action="signup.do">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="userID" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td>비밀번호 재입력</td>
				<td><input type="password" id="passwordCheck" /></td>
			</tr>
		</table>
		<input type="submit" value="입력완료" />
	</form>
</body>
</html>