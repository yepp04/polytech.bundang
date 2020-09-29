<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 지우기</title>
</head>
<body>
<%
Cookie[] cookies = request.getCookies(); // 쿠키들 얻기
for (int i = 0; i < cookies.length; i++) { // 배열길이만큼 for문 돌림
	Cookie thisCookie = cookies[i]; // 쿠키 1개 이름 설정
	if ("name".equals(thisCookie.getName())) { // id가 name인 쿠키가 있으면
		thisCookie.setMaxAge(0); // 유효기간 0으로 설정 -> 지워짐
		response.addCookie(thisCookie); // 쿠키를 세팅
	}
}
%>
</body>
</html>