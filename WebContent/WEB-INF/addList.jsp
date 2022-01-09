<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javaex.vo.GuestbookVo" %>
<%@ page import="java.util.List" %>

<%
	List<GuestbookVo> gvo = (List<GuestbookVo>)request.getAttribute("gVo");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- table1 입력 폼 -->
	<form action="/guestbook2/gbc" method="get"> <!-- 내가 이 작업 시킬녀석의 주소 잘 쓰기 -->
		<table border="1" width="500px"> 
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value=""></td> <!-- name=" " 컨트롤러의 add에서 받을 파라미터값의 이름 -->
				<td>비밀번호</td>
				<td><input type="password" name="pw" value=""></td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea name="content" cols="66" rows="5"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<button type="submit">글작성</button>
				</td>
			</tr>
		</table>
		<input type="hidden" name="action" value="add">
	</form>
	
	
	 <!-- table2 리스트 목록 -->
	<%for(int i=0; i<gvo.size(); i++) {
	%> 
	 
		<form action="/guestbook2/gbc" method="get">
			<table border="1" width="500px"> 
				<tr>
					<td><%=gvo.get(i).getNo()%></td>
					<td><%=gvo.get(i).getName()%></td>
					<td><%=gvo.get(i).getRegDate()%></td>
					<td><a href="/guestbook2/gbc?action=deleteForm&no=<%=gvo.get(i).getNo()%>">삭제</a></td>
				</tr>
				<tr>
					<td colspan="4">
						<%=gvo.get(i).getContent()%>
					</td>
				</tr>
			</table>
			<input type="hidden" name="action" value="deleteForm">
		</form>
	<%
	}
	%>	
</body>
</html>