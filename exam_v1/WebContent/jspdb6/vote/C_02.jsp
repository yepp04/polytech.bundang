<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
/* 가로 그래프 */
.h_graph .g_term {
	position: absolute;
	top: 0;
	left: -50px;
	width: 40px;
	font-weight: bold;
	color: red;
	line-height: 20px;
	text-align: right
}

.h_graph .g_bar {
	display: inline-block;
	position: relative;
	height: 20px;
	border: 1px solid #ccc;
	border-left: 0;
	background: red
}

.h_graph .g_bar span {
	position: absolute;
	top: 0;
	right: -50px;
	width: 40px;
	line-height: 20px
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
	<%
		request.setCharacterEncoding("utf-8"); // 인코딩
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	// 파라미터 받아오기
	VoteService service = new VoteService();
	%>
	<p><%=id%>.
		<%=name%>
		후보 득표성향 분석
	</p>
	<table border=1 cellspacing=0>
		<%
			for (int i = 1; i < 10; i++) {
		%>
		<tr>
			<td width=150><span class="g_term"><%=i * 10%>대</span></td>
			<td class="h_graph" width=400><span class="g_bar"
				style="width: <%=(int) (((double) service.selectOne(Integer.parseInt(id), i) / service.sumOne(Integer.parseInt(id))) * 100)%>%">
				<!-- 퍼센트 구하기 -->
					<span><%=service.selectOne(Integer.parseInt(id), i)%>(<%=(int) (((double) service.selectOne(Integer.parseInt(id), i) / service.sumOne(Integer.parseInt(id))) * 100)%>%)</span>
			</span></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>