<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page import="kopo.Repo.*,kopo.RIO.*,kopo.service.*,kopo.SIO.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 Insert</title>
</head>
<body>
	<h3>데이터 Insert</h3>
	<hr>
	<%
	ExamService examService = new ExamServiceImpl();
	examService.allsetDB();
	%>
	
</body>
</html>