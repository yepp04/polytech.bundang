<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// 세션 얻어오기
	String id = (String) session.getAttribute("session_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		out.println("세션값: " + id);
	%>
</body>
</html>