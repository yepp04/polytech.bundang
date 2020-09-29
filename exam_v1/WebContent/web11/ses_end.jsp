<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
	//세션 파괴
		session.invalidate();
	out.println("세션정보 파괴");
	%>
</body>
</html>