<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page
	import="java.text.SimpleDateFormat, java.util.Date, java.util.Calendar"%>
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
		stmt.execute("drop table realresv"); // 테이블 삭제
		out.println("drop table realresv OK<br>");
	} catch (Exception e) {
		out.println("drop table realresv NOT OK<br>");
		out.println(e.toString());
	}
	stmt.execute(
			"create table realresv(name varchar(20), resv_date date not null, room int not null, addr varchar(100), telnum varchar(20), in_name varchar(20), comment text, write_date date, processing int, primary key(resv_date,room))DEFAULT CHARSET=utf8");
	//테이블 생성

	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String sql = "";
	for (int i = 0; i < 30; i++) {
		String date = sdf.format(cal.getTime());
	sql = "insert into realresv(resv_date, room) values ('"+ date +"', 1)";
	stmt.execute(sql);// 내용 삽입
	sql = "insert into realresv(resv_date, room) values ('"+ date +"', 2)";
	stmt.execute(sql);// 내용 삽입
	sql = "insert into realresv(resv_date, room) values ('"+ date +"', 3)";
	stmt.execute(sql);// 내용 삽입
		cal.add(cal.DATE, +1);
	}

	sql = "update realresv set name = '강진성', addr ='몰라', telnum = '010-1234-1234', in_name = '강진성', comment = 'test', write_date = date(now()) where resv_date = date(now()) and room = 1";
	stmt.execute(sql);// 내용 삽입
	sql = "update realresv set name = '백승규', addr ='몰라', telnum = '010-1234-1234', in_name = '백승규', comment = 'test', write_date = date(now()) where resv_date = '2020-08-15' and room = 1";
	stmt.execute(sql);// 내용 삽입

	stmt.close();
	conn.close();
	%>
</body>
</html>