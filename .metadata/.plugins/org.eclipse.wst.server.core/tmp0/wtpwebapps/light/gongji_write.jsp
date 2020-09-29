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
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String date = request.getParameter("date");
	String content = request.getParameter("content");
	//파라미터 받아오기
	NoticeService3 service = new NoticeService3(); // 인스턴스 생성
	if (id != null) { // id값이 null이 아니면
		Notice3 notice = new Notice3(title, Integer.parseInt(id), content); // 인스턴스 생성
		service.update(notice); // 글 수정하기
	} else {// id값이 null 이면
		Notice3 notice = new Notice3(title, date, content);//인스턴스 생성
		service.create(notice);// 글쓰기
	}
	%>
	<script>
		location.href = 'gongji_list.jsp'; /* 리스트로 이동 */
	</script>
</body>
</html>