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

	String date = request.getParameter("date"); // 원래꺼

	String room = request.getParameter("room"); // 원래꺼
	//파라미터 받아오기
	ResvService service = new ResvService(); // 인스턴스 생성
	
	service.delete(date, Integer.parseInt(room));
	service.update(date, Integer.parseInt(room));
	%>
	<script>
		location.href = 'adm_allview.jsp'; /* 리스트로 이동 */
	</script>
</body>
</html>