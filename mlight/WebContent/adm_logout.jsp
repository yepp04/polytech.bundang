<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	//////세션을 체크해서 없다면 로그인창으로 보낸다. 그리고 로그인이 되면 자기 자신에게 와야 하므로
////// 자기 자신의 url을 써줘야 한다 login_test.jsp
String loginOK = null;
String jumpURL = "adm_login.jsp?jump=adm_allview.jsp";

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
<title></title>
</head>
<body BACKGROUND="./image/bg.png">
<center>
<%
session.invalidate();
out.println("<h2>로그아웃 되었습니다.<h2>");
//로그아웃 후 일반적으로는 홈으로 간다(여기서는 login_test.jsp)
out.println("<input type=button value='메인페이지' onclick=\"location.href='main.jsp'\">");
%>
</center>
</body>
</html>