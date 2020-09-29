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
	<!-- 위쪽 고정 테이블 -->
	<%
		VoteService service = new VoteService();//인스턴스 생성
	%>
	<table border=1 cellspacing=0 style="font-size: 1.3em;">
		<%
			for (Vote v : service.selectAll()) {// 모든 후보 검색
		%>
		<tr>
			<form method="post" action="A_02.jsp" name="form">
				<td width=600><div style="float: left;">
						기호번호 :
						<%=v.getId()%>&nbsp;&nbsp;&nbsp;&nbsp;후보명 :
						<%=v.getName()%></div>
					<div style="float: right;">
						<input type="hidden" name="id" value=<%=v.getId()%>>
						<!-- id값 hidden으로 파라미터 넘기기 -->
						<input type="submit"
							style="width: 100px; font-size: 1em; background-color: #00CC99"
							value="삭제" name="delete" align=right>
					</div></td>
			</form>
		</tr>
		<%
			}
		%>
		<tr>
			<form method="post" action="A_03.jsp" name="form">
				<td width=600><div style="float: left;">
						기호번호 : <input type="text" name="id" border=1
							style="width: 25px; border-color: #00CC99;"> 후보명 : <input
							type="text" name="name" border=1
							style="width: 100px; border-color: #00CC99;">
					</div>
					<div style="float: right;">
						<input type="submit"
							style="width: 100px; font-size: 1em; background-color: #00CC99"
							value="추가" name="add" align=right>
					</div></td>
			</form>
		</tr>
	</table>

</body>
</html>