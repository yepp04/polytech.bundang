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
		request.setCharacterEncoding("utf-8"); // 인코딩
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	//파라미터 받아오기
	if (id.equals("") || name.equals("")) {
	%>
	<script>
		alert("공백을 입력하셨습니다.")
		window.location = "./A_01.jsp";
	</script>
	<%
		} else {
	if (id.matches("^[0-9]*$")) {
		Vote vote = new Vote(Integer.parseInt(id), name);
		VoteService service = new VoteService();
		service.create(vote);
	} else {
	%>
	<script>
		alert("잘못 입력하셨습니다.")
		window.location = "./A_01.jsp";
	</script>
	<%
		}
	}
	%>
	<p>후보등록 결과 : 후보가 추가 되었습니다.</p>
</body>
</html>