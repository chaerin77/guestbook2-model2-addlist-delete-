<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	int no = (int)request.getAttribute("number");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/guestbook2/gbc" method="get">
		비밀번호<input type="password" name="pw" value="">
		<button type="submit">확인</button><br>
		<a href="/guestbook2/gbc?action=addList">메인으로 돌아가기</a><br>
		<input type="hidden" name="no" value="<%=no%>">
		<input type="hidden" name="action" value="delete">
	</form>
</body>
</html>