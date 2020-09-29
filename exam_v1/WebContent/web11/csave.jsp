<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String myName = "Kang"; // 쿠키에 저장할 값
Cookie cookieName = new Cookie("name", myName); // "name"이라는 id로 myName값 저장
cookieName.setMaxAge(-1); // 브라우저 켜있을 때까지 저장
response.addCookie(cookieName); // response 객체에 보내야 사용가능
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 저장</title>
</head>
<body>
JSP 쿠키사용
</body>
</html>