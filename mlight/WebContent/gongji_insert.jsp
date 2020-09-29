<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="user-scalable=no, width=device-width" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
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
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	// 심플데이트포맷으로 날짜 형태 지정 
	Date currentTime = new Date(); // 현재 날짜 불러오기
	String mTime = mSimpleDateFormat.format(currentTime); // 포맷씌워서 저장
	%>
	<form method=post name="form">
		<table class="table table-bordered" style="width:650px;" border=1 cellspacing=0 cellpadding=5>
			<tr>
				<td><b>번호</b></td>
				<td>신규(insert)</td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><input type=text name=title size=76 maxlength=76></td>
			</tr>
			<tr>
				<td><b>일자</b></td><!-- 계산한 오늘 날짜를 삽입 -->
				<td><%=mTime%><input type=hidden name=date value=<%=mTime%>></td>
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td><textarea style="width: 570px; height: 250px;" name=content
						cols=70 row=600></textarea></td>
			</tr>
		</table>
		<table width=650>
			<tr>
				<td width=600></td>
				<td><button type=button class="btn btn-default"
					OnClick="location.href='gongji_list.jsp'">취소</button></td><!-- 취소창으로 -->
				<td><button type=submit class="btn btn-default"
					OnClick="javascript: form.action='./gongji_write.jsp';">쓰기</button></td><!-- 쓰기창으로 -->
			</tr>
		</table>
	</form>
	</center>
</body>
</html>