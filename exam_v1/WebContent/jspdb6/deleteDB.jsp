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
	<h1>레코드 삭제</h1>
	<%
		String name = request.getParameter("name");
	String id = request.getParameter("id");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	// 파라미터 받아오기
	StudentService service = new StudentService(); // 서비스 인스턴스
	Student student = new Student(name, Integer.parseInt(id), Integer.parseInt(kor), Integer.parseInt(eng),
			Integer.parseInt(mat)); // 학생 인스턴스
	service.delete(Integer.parseInt(id));//지운다
	%>
	<table cellspacing=1 width=600 border=1 cellpadding=0>
		<tr>
			<td width=50><p align=center>이름</p></td>
			<td width=50><p align=center>학번</p></td>
			<td width=50><p align=center>국어</p></td>
			<td width=50><p align=center>영어</p></td>
			<td width=50><p align=center>수학</p></td>
		</tr>
		<%
			for (Student s : service.selectAll()) { // 모든 학생을 검색
		%>
		<tr>
			<td width=50><p align=center>
					<a href="../jspdb5/oneview.jsp?name=<%=s.getName()%>" target="main"><%=s.getName()%><!-- get방식으로 파라미터 보냄 -->
				</p></td>
			<td width=50><p align=center><%=s.getStudentId()%></p></td>
			<td width=50><p align=center><%=s.getKor()%></p></td>
			<td width=50><p align=center><%=s.getEng()%></p></td>
			<td width=50><p align=center><%=s.getMat()%></p></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>
</body>
</html>