<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 값 검사</title>
</head>
<body>
<%
Cookie[] cookies = request.getCookies(); // 쿠키들 모두 얻기, 배열값으로
for (int i = 0; i < cookies.length; i++) { // 배열길이만큼 for문 돌림
	Cookie thisCookie = cookies[i]; // 배열1개의 이름
	if ("name".equals(thisCookie.getName())) { // thisCookie가 name이라는 id이면
		out.println("이름:"+ thisCookie.getValue()+"<br>"); // 그 id의 값을 출력
	}
}
%>
</body>
</html>