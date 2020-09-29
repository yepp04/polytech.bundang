<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.net.*"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>JSP Database 실습1</h1>

	<%
		Connection conn = null; // 변수 선언
	Statement stmt = null; // 변수 선언
	ResultSet rset = null;// 변수 선언
	try {
		Class.forName("com.mysql.cj.jdbc.Driver"); // 드라이버를 불러온다(초기화)
		conn = DriverManager.getConnection("jdbc:mysql://192.168.23.97:3306/kopo04", "root", "rkdwlstjd");
		// 초기화된 드라이버를 드라이버매니저를 통해 겟커넥션 한다. mysql url주소/db주소, 아이디, 비번
		stmt = conn.createStatement(); // 연결된 데이터베이스로 SQL문을 보내기위한 SQLServerStatement 개체를 만든다

		// 데이터베이스 입력
		rset = stmt.executeQuery("select * from counter;");
		int beforeCount = 0;
		int afterCount = 0;
		while (rset.next()) {
			beforeCount = rset.getInt(1); //원래 방문자수
			afterCount = beforeCount + 1; // 1 더한거
		}
		out.println("<br><br>현재 홈페이지 방문조회수는 [" + afterCount + "] 입니다<br>");
		stmt.execute("update counter set counter ="+afterCount+" where counter = "+beforeCount);
		
		// 예외 처리
	} catch (ClassNotFoundException e) {
		out.println("error==>" + e + "<==<br>");
	} catch (SQLException e) {
		out.println("error==>" + e + "<==<br>");
	} catch (NullPointerException e) {
		out.println("error==>" + e + "<==<br>");
	} finally {
		try {
			stmt.close();
			conn.close();
			rset.close();
		} catch (Exception e) {
			out.println("error==>" + e + "<==<br>");
		}
	}
	%>
</body>
<!--내용닫기-->
</html>
<!--끝-->