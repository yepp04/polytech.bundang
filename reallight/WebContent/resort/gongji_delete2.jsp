<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
	if (id == null) {
		int maxSize = 10 * 1024 * 1024; // 10메가 제한
		String savePath = application.getRealPath("./resort/upload"); // 경로지정
		String format = "UTF-8"; // 인코딩
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format, new DefaultFileRenamePolicy());
	id = multi.getParameter("id");//파라미터 받아오기
	NoticeService4 service = new NoticeService4();// 인스턴스 생성
		service.delete(Integer.parseInt(id));// 삭제	
	} else {
	NoticeService4 service = new NoticeService4();// 인스턴스 생성
		service.delete(Integer.parseInt(id));// 삭제			
	}
			 
	%>
	<script>
		location.href = 'gongji_list2.jsp';/* 리스트로 이동 */
	</script>
</body>
</html>