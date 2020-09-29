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
	<%
	request.setCharacterEncoding("utf-8");//인코딩
	String id = request.getParameter("key"); // 파라미터 받아오기
		NoticeService service = new NoticeService(); // 인스턴스 생성
	%>
	<form method=post name='fm'>
		<table width=650 border=1 cellspacing=0 cellpadding=5>
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
				<td><input type=button value="목록"
					OnClick="location.href='gongji_list.jsp'"></td>
				<td><input type=button value="수정"
					OnClick="location.href='gongji_update.jsp?key=<%=id%>'"></td><!-- id를 get으로 보냄 -->
			</tr>
		</table>
	</form>
</body>
</html>