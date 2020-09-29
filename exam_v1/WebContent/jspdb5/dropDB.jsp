<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<html>
<head>
</head>
<body>
	<h1>테이블지우기 OK</h1>
	<%
		Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver"); // 드라이버를 불러온다(초기화)
		conn = DriverManager.getConnection("jdbc:mysql://192.168.23.97:3306/kopo04", "root", "rkdwlstjd");
		// 초기화된 드라이버를 드라이버매니저를 통해 겟커넥션 한다. mysql url주소/db주소, 아이디, 비번
		stmt = conn.createStatement(); // 연결된 데이터베이스로 SQL문을 보내기위한 SQLServerStatement 개체를 만든다

		//테이블 지우기
		stmt.execute("drop table examtable;");

		// 예외 처리
	} catch (ClassNotFoundException e) {
		out.println("error==>" + e + "<==<br>");
	} catch (SQLException e) {
		out.println("error==>" + e + "<==<br>");
	} finally {
		try {
			stmt.close();
			conn.close();
		} catch (Exception e) {
			out.println("error==>" + e + "<==<br>");
		}
	}
	%>
</body>
</html>