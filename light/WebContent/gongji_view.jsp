<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<%
String loginOK = null;
loginOK = (String)session.getAttribute("login_ok"); //login_ok의 세션을 받아온다
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
	<link href="https://fonts.googleapis.com/css2?family=Cinzel&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<title></title>
</head>
<body BACKGROUND="./image/bg.png">
<center>
		<h2 style="font-family: 'Cinzel', serif;">Notice</h2>
	<%
	request.setCharacterEncoding("utf-8");//인코딩
	String id = request.getParameter("key"); // 파라미터 받아오기
		NoticeService3 service = new NoticeService3(); // 인스턴스 생성
	%>
	<form method=post name='fm'>
		<table class="table table-bordered" style="width:650px;"border=1 cellspacing=0 cellpadding=5>
			<tr>
				<td><b>번호</b></td>
				<td><%=service.selectOne(Integer.parseInt(id)).get(0).getId()%></td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><%=service.selectOne(Integer.parseInt(id)).get(0).getTitle()%></td>
			</tr>
			<tr>
				<td><b>일자</b></td>
				<td><%=service.selectOne(Integer.parseInt(id)).get(0).getDate()%></td>
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td><%=service.selectOne(Integer.parseInt(id)).get(0).getContent()%></td>
			</tr>
		</table>
		<table width=650>
			<tr>
				<td width=600></td>
				<td><button type=button class="btn btn-default"
					OnClick="location.href='gongji_list.jsp'">목록</button></td>
					<%if (loginOK != null) {
						%>
				<td><button type=button class="btn btn-default"
					OnClick="location.href='gongji_update.jsp?key=<%=id%>'">수정</button></td><!-- id를 get으로 보냄 -->						
						<%
					}
					%>
			</tr>
		</table>
	</form>
	</center>
</body>
</html>