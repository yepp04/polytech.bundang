<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page import="kopo.Repo.*,kopo.RIO.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>조회</h3>
	<hr>
	<%
		int studentid = Integer.parseInt(request.getParameter("studentid"));
		
		try {
			ExamRIO exam = ExamRepo.getRecordById(studentid);
	%>	
	<table cellspacing=1 width=600 border=1>
	<tr>
		<td width=50><p align=center>이름</p></td>
		<td width=50><p align=center>학번</p></td>
		<td width=50><p align=center>국어</p></td>		
		<td width=50><p align=center>영어</p></td>		
		<td width=50><p align=center>수학</p></td>
	</tr>
	<%      
        out.println("<tr>");
        out.println("<td width=50><p align=center>"+exam.getName()+"</p></td>");
        out.println("<td width=50><p align=center>"+Integer.toString(exam.getStudentId())+"</p></td>");
        out.println("<td width=50><p align=center>"+Integer.toString(exam.getKor())+"</p></td>");
        out.println("<td width=50><p align=center>"+Integer.toString(exam.getEng())+"</p></td>");
        out.println("<td width=50><p align=center>"+Integer.toString(exam.getMat())+"</p></td>");
        out.println("<tr>");
	} catch(Exception e) {
        out.println("oneview중 에러발생."+e);
    }
	%>
</body>
</html>