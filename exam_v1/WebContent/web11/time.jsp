<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page
	import="java.text.SimpleDateFormat, java.util.Date, java.util.Calendar"%>
	<%
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
	String myTime = URLEncoder.encode(sdf.format(cal.getTime()), "UTF-8"); //쿠키에 저장할 값
	String myTime2 = sdf.format(cal.getTime()); //쿠키에 저장할 값
	
	
	Cookie[] cookies = request.getCookies(); // 쿠키들 모두 얻기, 배열값으로
if (cookies != null) {
	
for (int i = 0; i < cookies.length; i++) { // 배열길이만큼 for문 돌림
	Cookie thisCookie = cookies[i]; // 배열1개의 이름
	if ("time".equals(thisCookie.getName())) { // thisCookie가 name이라는 id이면
		out.println("최근 방문일은 ("+URLDecoder.decode(thisCookie.getValue(), "UTF-8")+") 입니다.<br>"); // 그 id의 값을 출력
	}
}
} else {
	out.println("최근 방문일은 ("+myTime2+") 입니다.<br>");
}
%>
	<%
 cookies = request.getCookies(); // 쿠키들 얻기
	if (cookies != null) {
		
for (int i = 0; i < cookies.length; i++) { // 배열길이만큼 for문 돌림
	Cookie thisCookie = cookies[i]; // 쿠키 1개 이름 설정
	if ("time".equals(thisCookie.getName())) { // id가 name인 쿠키가 있으면
		thisCookie.setMaxAge(0); // 유효기간 0으로 설정 -> 지워짐
		response.addCookie(thisCookie); // 쿠키를 세팅
	}
}
	}
%>
	<%
Cookie cookieName = new Cookie("time", myTime); // "name"이라는 id로 myName값 저장
cookieName.setMaxAge(-1); // 브라우저 켜있을 때까지 저장
response.addCookie(cookieName); // response 객체에 보내야 사용가능
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
</body>
</html>