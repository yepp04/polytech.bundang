<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<table border=1 cellspacing=0 style="border-color: blue;">
		<tr style="font-size: 2em;">
			<td width=150 align=center style="background-color: yellow;"><a
				href="./A_01.jsp" style="color: black; text-decoration: none">후보등록</a></td>
			<td width=150 align=center><a href="./B_01.jsp"
				style="color: black; text-decoration: none">투표</a></td>
			<td width=150 align=center><a href="./C_01.jsp"
				style="color: black; text-decoration: none">개표결과</a></td>
		</tr>
	</table>
	<%
	request.setCharacterEncoding("utf-8");//인코딩
		String id = request.getParameter("id");
	VoteService service = new VoteService();
	service.delete(Integer.parseInt(id));
	// 파라미터 받아오기
	%>
	<p>후보등록 결과 : 후보가 삭제 되었습니다.</p>
</body>
</html>