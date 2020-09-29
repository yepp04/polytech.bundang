<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	// 심플데이트포맷으로 날짜 형태 지정 
	Date currentTime = new Date(); // 현재 날짜 불러오기
	String mTime = mSimpleDateFormat.format(currentTime); // 포맷씌워서 저장
	%>
	<form method=post name="form">
		<table width=650 border=1 cellspacing=0 cellpadding=5>
			<tr>
				<td><b>번호</b></td>
				<td>신규(insert)</td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><input type=text name=title size=70 maxlength=70></td>
			</tr>
			<tr>
				<td><b>일자</b></td><!-- 계산한 오늘 날짜를 삽입 -->
				<td><%=mTime%><input type=hidden name=date value=<%=mTime%>></td>
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td><textarea style="width: 500px; height: 250px;" name=content
						cols=70 row=600></textarea></td>
			</tr>
		</table>
		<table width=650>
			<tr>
				<td width=600></td>
				<td><input type=button value="취소"
					OnClick="location.href='gongji_list.jsp'"></td><!-- 취소창으로 -->
				<td><input type=submit value="쓰기"
					OnClick="javascript: form.action='./gongji_write.jsp';" /></td><!-- 쓰기창으로 -->
			</tr>
		</table>
	</form>
</body>
</html>