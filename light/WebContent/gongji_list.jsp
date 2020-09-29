<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<%
	String loginOK = null;
loginOK = (String) session.getAttribute("login_ok"); //login_ok의 세션을 받아온다
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- 부트스트랩 -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Cinzel&family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet">
<style>
</style>
<title></title>
</head>
<body BACKGROUND="./image/bg.png">
	<center>
		<h2 style="font-family: 'Cinzel', serif;">Notice</h2>
		<table class="table table-bordered" style="width: 600px;" cellspacing=1 border=1>
			<tr>
				<td width=50><span
					style="display: inline-block; width: 100%; text-align: center;">번호</span></td>
				<td width=500><span
					style="display: inline-block; width: 100%; text-align: center;">제목</span></td>
				<td width=100><span
					style="display: inline-block; width: 100%; text-align: center;">등록일</span></td>
			</tr>
			<%
				NoticeService3 service = new NoticeService3(); // 인스턴스 생성
			for (Notice3 n : service.selectAll()) { // 모든 글 검색 및 뿌리기
			%>
			<tr>
				<td width=50><span
					style="display: inline-block; width: 100%; text-align: center;"><%=n.getId()%></span></td>
				<td width=500><span><a
						href="gongji_view.jsp?key=<%=n.getId()%>"><%=n.getTitle()%></a> </span></td>
				<td width=100><span
					style="display: inline-block; width: 100%; text-align: center;"><%=n.getDate()%></span></td>
			</tr>
			<%
				}
			%>
		</table>
		<table width=650 cellpadding=0>
			<tr>
				<td width=570></td>
				<%
					if (loginOK != null) {
				%>
				<td><button type=button class="btn btn-default"
						Onclick="window.location='gongji_insert.jsp'">신규</button></td>
				<!-- 글쓰기 창으로 -->
				<%
					}
				%>
			</tr>
		</table>
	</center>
</body>
</html>