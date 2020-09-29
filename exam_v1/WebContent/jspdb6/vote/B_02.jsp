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
			<td width=150 align=center><a href="./A_01.jsp"
				style="color: black; text-decoration: none">후보등록</a></td>
			<td width=150 align=center style="background-color: yellow;"><a
				href="./B_01.jsp" style="color: black; text-decoration: none">투표</a></td>
			<td width=150 align=center><a href="./C_01.jsp"
				style="color: black; text-decoration: none">개표결과</a></td>
		</tr>
	</table>
	<%
		request.setCharacterEncoding("utf-8"); // 인코딩
	String manId = request.getParameter("choiceName");
	String ageId = request.getParameter("choiceAge");
	VoteService service = new VoteService();
	// 파라미터 받아오기
	service.update(Integer.parseInt(manId), Integer.parseInt(ageId));
	//투표하기
	%>
	
	<p>투표 결과 : 투표하였습니다.</p>
</body>
</html>