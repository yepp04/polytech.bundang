<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<center>
<%
session.invalidate();
out.println("<h2>로그아웃 되었습니다.<h2>");
//로그아웃 후 일반적으로는 홈으로 간다(여기서는 login_test.jsp)
out.println("<input type=button value='메인페이지' onclick=\"location.href='login_test.jsp'\">");
%>
</center>
</body>
</html>