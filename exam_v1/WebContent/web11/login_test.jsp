<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.text.*"%>
<%@page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<%
	//////세션을 체크해서 없다면 로그인창으로 보낸다. 그리고 로그인이 되면 자기 자신에게 와야 하므로
////// 자기 자신의 url을 써줘야 한다 login_test.jsp
String loginOK = null;
String jumpURL = "login.jsp?jump=login_test.jsp";

loginOK = (String)session.getAttribute("login_ok"); //login_ok의 세션을 받아온다
if (loginOK == null) { // loginOK가 null이면
	response.sendRedirect(jumpURL); // 로그인 페이지로 돌아간다
	return;
}
if (!loginOK.equals("yes")) { // loginOK가 yes가 아니면
	response.sendRedirect(jumpURL); // 로그인 페이지로 돌아간다
	return;
}
%>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<center>
<h1> 로그인 오케이 </h1>
<br>
<br>
<a href="logout.jsp">로그아웃</a>
</center>
</body>
</html>