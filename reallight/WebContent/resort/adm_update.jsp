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
	String name = request.getParameter("name");
	String date = request.getParameter("date"); // 원래꺼
	String date2 = request.getParameter("date2"); // 바꿀꺼
	String room = request.getParameter("room"); // 원래꺼
	String room2 = request.getParameter("room2"); // 바꿀꺼
	String addr = request.getParameter("addr"); // 바꿀꺼
	String tel = request.getParameter("tel"); // 바꿀꺼
	String inname = request.getParameter("inname"); // 바꿀꺼
	String comment = request.getParameter("comment");
	String writeDate = request.getParameter("writeDate");	
	String processing = request.getParameter("processing");	
	//파라미터 받아오기
	ResvService service = new ResvService(); // 인스턴스 생성
	
	Resv resv = new Resv(name, date2, Integer.parseInt(room2), addr, tel, inname, comment, writeDate, Integer.parseInt(processing)); // 인스턴스 생성
	
	if (service.selectOne(date2, Integer.parseInt(room2)).get(0).getName() == null) {
	service.delete(date, Integer.parseInt(room));
	service.update(date, Integer.parseInt(room));
	service.delete(date2, Integer.parseInt(room2));
	service.update(resv); // 글 수정하기		
	} else {
		%>
		<script>
		alert("이미 예약된 방입니다.");
		location.href = 'adm_allview.jsp';
		</script>
		<%
	}
	
	%>
	<script>
		location.href = 'adm_allview.jsp'; /* 리스트로 이동 */
	</script>
</body>
</html>