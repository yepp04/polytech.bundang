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
	<h3>테이블 삭제.</h3>
	<%
		try {
			ExamRepo.dropDB();
		} catch(Exception e) {
	        out.println("테이블 드랍 중 에러발생."+e);
	    }
	%>
	
</body>
</html>