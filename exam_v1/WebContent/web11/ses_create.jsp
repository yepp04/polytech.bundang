<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//세션 생성
	session.setAttribute("session_id", "kang");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		out.println("세션 생성 완료");
	%>
</body>
</html>