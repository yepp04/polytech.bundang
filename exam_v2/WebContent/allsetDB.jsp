<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page import="kopo.Repo.*,kopo.RIO.*" %>
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
		try {
			ExamRepo.save(new ExamRIO("나연",209901,95,100,95));
			ExamRepo.save(new ExamRIO("정연",209902,95,95,95));
			ExamRepo.save(new ExamRIO("모모",209903,100,100,100));
			ExamRepo.save(new ExamRIO("사나",209904,100,95,90));
			ExamRepo.save(new ExamRIO("지효",209905,80,100,70));
			ExamRepo.save(new ExamRIO("미나",209906,100,100,70));
			ExamRepo.save(new ExamRIO("다현",209907,70,70,70));
			ExamRepo.save(new ExamRIO("채영",209908,100,90,80));
			ExamRepo.save(new ExamRIO("쯔위",209909,80,100,90));
		} catch(Exception e) {
	        out.println("테이블 생성중 에러발생."+e);
	    }
	%>
	
</body>
</html>