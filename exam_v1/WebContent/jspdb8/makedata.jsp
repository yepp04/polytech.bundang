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
		stmt.execute("drop table gongji"); // 테이블 삭제
		out.println("drop table gongji OK<br>");
	} catch (Exception e) {
		out.println("drop table gongji NOT OK<br>");
		out.println(e.toString());
	}

	stmt.execute(
			"create table gongji(id int not null primary key auto_increment, title varchar(70), date date, content text)DEFAULT CHARSET=utf8");
	//테이블 생성

	String sql = "";
	sql = "alter table gongji add rootid int;";
	stmt.execute(sql);// 내용 삽입
	sql = "alter table gongji add relevel int;";
	stmt.execute(sql);// 내용 삽입
	sql = "alter table gongji add recnt int;";
	stmt.execute(sql);// 내용 삽입
	sql = "alter table gongji add viewcnt int;";
	stmt.execute(sql);// 내용 삽입
	sql = "alter table gongji add filename varchar(255);";
	stmt.execute(sql);// 내용 삽입
	sql = "insert into gongji(title, date, content, rootid, viewcnt) values('공지사항1',date(now()),'공지사항내용1', 1, 0)";
	stmt.execute(sql);// 내용 삽입
	sql = "insert into gongji(title, date, content, rootid, viewcnt) values('공지사항2',date(now()),'공지사항내용2', 2, 0)";
	stmt.execute(sql);// 내용 삽입
	sql = "insert into gongji(title, date, content, rootid, viewcnt) values('공지사항3',date(now()),'공지사항내용3', 3, 0)";
	stmt.execute(sql);// 내용 삽입
	sql = "insert into gongji(title, date, content, rootid, viewcnt) values('공지사항4',date(now()),'공지사항내용4', 4, 0)";
	stmt.execute(sql);// 내용 삽입
	sql = "insert into gongji(title, date, content, rootid, viewcnt) values('공지사항5',date(now()),'공지사항내용5', 5, 0)";
	stmt.execute(sql);// 내용 삽입
	
	stmt.close();
	conn.close();
	%>
</body>
</html>