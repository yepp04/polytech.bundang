<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");//인코딩	
	String id = request.getParameter("id");//파라미터 받아오기
	NoticeService service = new NoticeService();// 인스턴스 생성
		service.delete(Integer.parseInt(id));// 삭제
	%>
	<script>
		location.href = 'gongji_list.jsp';/* 리스트로 이동 */
	</script>
</body>
</html>