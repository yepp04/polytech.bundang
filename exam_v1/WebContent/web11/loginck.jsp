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
request.setCharacterEncoding("utf-8");

String jump = request.getParameter("jump"); // 파라미터로 jump값 받아옴
String id = request.getParameter("id"); // 파라미터로 id값 받아옴
String pass = request.getParameter("passwd"); // 파라미터로 pw값 받아옴
// 여기에서 엉뚱한 값을 체크해야 하는데 생략함

boolean bPassChk = false; // 기본적으로 패스워드 체크는 false로

// 아이디, 패스워드 체크
if (id.replaceAll(" ", "").equals("admin") && pass.replaceAll(" ", "").equals("admin")) {
	// id가 admin이고, pw가 admin이면
	bPassChk=true; // 패스워드 체크 true
} else { // 틀리면
	bPassChk=false; // false
}

// 패스워드 체크가 끝나면, 세션을 기록하고 점프한다.
if (bPassChk) {
	session.setAttribute("login_ok", "yes"); // login_ok값은 yes를 넘김
	session.setAttribute("login_id", id); // login_id의 값은 id를 넘김
	response.sendRedirect(jump); // 로그인체크 이후 돌아갈 곳
} else { // 패스워드 틀렸을 때 출력
	out.println("<h2>아이디 또는 패스워드 오류</h2>");
	out.println("<input type=button value='로그인' Onclick=\"location.href='login.jsp?jump="+jump+"'\">");
}
%>
</center>
</body>
</html>