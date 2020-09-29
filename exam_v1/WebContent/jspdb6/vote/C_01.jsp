<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>/*가로 그래프 스타일*/
.h_graph .g_term {
	position: absolute;
	top: 0;
	left: -50px;
	width: 40px;
	font-weight: bold;
	color: red;
	line-height: 20px;
	text-align: right;
}
.h_graph .g_bar {
	display: inline-block;
	position: relative;
	height: 20px;
	border: 1px solid #ccc;
	border-left: 0;
	font-size: 1.2em;
	background: red;
}
.h_graph .g_bar span {
	position: absolute;
	top: 0;
	right: -50px;
	width: 40px;
	line-height: 20px;
}
</style>
</head>
<body>
	<table border=1 cellspacing=0 style="border-color: blue;">
		<tr style="font-size: 2em;">
			<td width=150 align=center><a href="./A_01.jsp"
				style="color: black; text-decoration: none">후보등록</a></td>
			<td width=150 align=center><a href="./B_01.jsp"
				style="color: black; text-decoration: none">투표</a></td>
			<td width=150 align=center style="background-color: yellow;"><a
				href="./C_01.jsp" style="color: black; text-decoration: none">개표결과</a></td>
		</tr>
	</table>
	<p style="font-size: 1.2em;">후보별 득표율</p>
	<table border=1 cellspacing=0>
		<%VoteService service = new VoteService(); // 인스턴스 생성
		for (Vote v : service.selectAll()) { // 전체 후보 검색 %>
		<tr>
			<td width=150><span class="g_term"><a
					href="./C_02.jsp?id=<%=v.getId()%>&name=<%=v.getName()%>"
					style="color: black; font-size: 1.2em;"><%=v.getId()%> <%=v.getName()%></a></span></td>
			<td class="h_graph" width=400><span class="g_bar"
				style="width: <%=(int) ((double) service.sumOne(v.getId()) / service.sumAll() * 100)%>%">
				<!-- 투표 퍼센트 구하기 -->
				<span><%=service.sumOne(v.getId())%>(<%=(int) ((double) service.sumOne(v.getId()) / service.sumAll() * 100)%>%)</span></span></td>
		</tr>
		<%}%>
	</table>
</body>
</html>
