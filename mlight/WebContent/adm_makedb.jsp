<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.net.*,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>Make table</h1>
	<%
		Class.forName("com.mysql.cj.jdbc.Driver"); // 드라이버를 불러온다(초기화)
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.97:3306/kopo04", "root", "rkdwlstjd");
	// 초기화된 드라이버를 드라이버매니저를 통해 겟커넥션 한다. mysql url주소/db주소, 아이디, 비번
	Statement stmt = conn.createStatement(); // 연결된 데이터베이스로 SQL문을 보내기위한 SQLServerStatement 개체를 만든다
	try {
		stmt.execute("drop table adminfo"); // 테이블 삭제
		out.println("drop table adminfo OK<br>");
	} catch (Exception e) {
		out.println("drop table adminfo NOT OK<br>");
		out.println(e.toString());
	}
	stmt.execute("create table adminfo(id varchar(20) primary key not null, pass varchar(20)) DEFAULT CHARSET=utf8");
	//테이블 생성

	String sql = "";
	sql = "insert into adminfo(id, pass) values ('admin','0830')";
	stmt.execute(sql);// 내용 삽입

	stmt.close();
	conn.close();
	%>
</body>
</html>