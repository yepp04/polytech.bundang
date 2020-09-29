<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
</style>
<title></title>
</head>
<body>
	<table cellspacing=1 width=600 border=1>
		<tr>
			<td width=50><span
				style="display: inline-block; width: 100%; text-align: center;">번호</span></td>
			<td width=500><span
				style="display: inline-block; width: 100%; text-align: center;">제목</span></td>
			<td width=100><span
				style="display: inline-block; width: 100%; text-align: center;">등록일</span></td>
		</tr>
		<%
			NoticeService service = new NoticeService(); // 인스턴스 생성
		for (Notice n : service.selectAll()) { // 모든 글 검색 및 뿌리기
		%>
		<tr>
			<td width=50><span
				style="display: inline-block; width: 100%; text-align: center;"><%=n.getId()%></span></td>
			<td width=500><span><a
					href="gongji_view.jsp?key=<%=n.getId()%>"><%=n.getTitle()%></a>
			</span></td>
			<td width=100><span
				style="display: inline-block; width: 100%; text-align: center;"><%=n.getDate()%></span></td>
		</tr>
		<%
			}
		%>
	</table>
	<table width=650>
		<tr>
			<td width=550></td>
			<td><input type=button value="신규"
				Onclick="window.location='gongji_insert.jsp'"></td> <!-- 글쓰기 창으로 -->
		</tr>
	</table>
</body>
</html>