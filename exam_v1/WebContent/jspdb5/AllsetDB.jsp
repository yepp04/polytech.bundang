<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<html>
<head>
</head>
<body>
	<h1>실습데이터 입력</h1>
	<%
		Connection conn = null; // 변수 선언
	Statement stmt = null; // 변수 선언
	try {
		Class.forName("com.mysql.cj.jdbc.Driver"); // 드라이버를 불러온다(초기화)
		conn = DriverManager.getConnection("jdbc:mysql://192.168.23.97:3306/kopo04", "root", "rkdwlstjd");
		// 초기화된 드라이버를 드라이버매니저를 통해 겟커넥션 한다. mysql url주소/db주소, 아이디, 비번
		stmt = conn.createStatement(); // 연결된 데이터베이스로 SQL문을 보내기위한 SQLServerStatement 개체를 만든다

		// 데이터베이스 입력
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values (\"나연\", 209901, 95, 100, 95);");
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values (\"정연\", 209902, 95, 95, 95);");
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values (\"모모\", 209903, 100, 100, 100);");
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values (\"사나\", 209904, 100, 95, 90);");
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values (\"지효\", 209905, 80, 100, 70);");
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values (\"미나\", 209906, 100, 100, 70);");
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values (\"다현\", 209907, 70, 70, 70);");
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values (\"채영\", 209908, 80, 75, 72);");
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values (\"쯔위\", 209909, 78, 79, 82);");

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