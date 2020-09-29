<%@ page language="java" contentType="text/html; charset=UTF-8"
	 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page import="java.io.*, java.util.*"%>
<%@ page import="kopo.RIO.*"%>
<html>
<head>
<title>Home</title>
</head>
<body>

	이름 : ${name} <br> 
	주소 : ${addr} <br>

	<hr>
	<table cellspacing=1 width=600 border=1>
		<c:choose>
			<c:when test="${empty exam}"> 
				<tr>
					<td colspan=3>exam 없다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td width=50><p align=center>${exam.name}</p></td>
					<td width=50><p align=center>${exam.studentId}</p></td>
					<td width=50><p align=center>${exam.kor}</p></td>
					<td width=50><p align=center>${exam.eng}</p></td>
					<td width=50><p align=center>${exam.mat}</p></td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>

	<hr>
	<table cellspacing=1 width=600 border=1>
		<c:choose>
			<c:when test="${empty exams}">
				<tr>
					<td colspan=3>exams 없다</td>
				</tr>
			</c:when>
			<c:otherwise>
			<c:forEach items="${exams}" var="e">
			<tr>
				<td width=50><p align=center>${e.name}</p></td>
				<td width=50><p align=center>${e.studentId}</p></td>
				<td width=50><p align=center>${e.kor}</p></td>
				<td width=50><p align=center>${e.eng}</p></td>
				<td width=50><p align=center>${e.mat}</p></td>
			</tr>
			</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
<hr><hr>
아래는 Scriptlet방식 (spring에서는 잘 사용하지 않음)<br>
<hr>
<%
	String name = (String) request.getAttribute("name");
	String addr = (String) request.getAttribute("addr");
	out.println("이름 :"+name+"<br>");
	out.println("주소 :"+addr+"<br>");
%>
<hr>
<%
	ExamRIO exam = (ExamRIO) request.getAttribute("exam");
%>
	<table cellspacing=1 width=600 border=1>
		<tr>
			<td width=50><p align=center><%=exam.getName()%></p></td>
			<td width=50><p align=center><%=exam.getStudentId()%></p></td>
			<td width=50><p align=center><%=exam.getKor()%></p></td>
			<td width=50><p align=center><%=exam.getEng()%></p></td>
			<td width=50><p align=center><%=exam.getMat()%></p></td>
		</tr>
	</table>
<hr>
<%
	List<ExamRIO> exams = (List<ExamRIO>) request.getAttribute("exams");
%>
<table cellspacing=1 width=600 border=1>
<%

	for (int i = 0; i < exams.size(); i++) {
		%>
		<tr>
		<td width=50><p align=center><%=exams.get(i).getName()%></p></td>
		<td width=50><p align=center><%=exams.get(i).getStudentId()%></p></td>
		<td width=50><p align=center><%=exams.get(i).getKor()%></p></td>
		<td width=50><p align=center><%=exams.get(i).getEng()%></p></td>
		<td width=50><p align=center><%=exams.get(i).getMat()%></p></td>
		</tr>
		<%
	}
%>
</table>
</body>
</html>