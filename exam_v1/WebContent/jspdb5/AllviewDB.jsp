<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<html>
<body>
	<h1>조회</h1>
	<%
		Connection conn = null;// 변수 선언
	Statement stmt = null;// 변수 선언
	ResultSet rset = null;// 변수 선언
	try {
		Class.forName("com.mysql.cj.jdbc.Driver"); // 드라이버를 불러온다(초기화)
		conn = DriverManager.getConnection("jdbc:mysql://192.168.23.97:3306/kopo04", "root", "rkdwlstjd");
		// 초기화된 드라이버를 드라이버매니저를 통해 겟커넥션 한다. mysql url주소/db주소, 아이디, 비번
		stmt = conn.createStatement(); // 연결된 데이터베이스로 SQL문을 보내기위한 SQLServerStatement 개체를 만든다
		rset = stmt.executeQuery("select * from examtable;");
	%>
	<table cellspacing=1 width=600 border=1>
		<tr>
			<td width=50><p align=center>이름</p></td>
			<td width=50><p align=center>학번</p></td>
			<td width=50><p align=center>국어</p></td>
			<td width=50><p align=center>영어</p></td>
			<td width=50><p align=center>수학</p></td>
		</tr>
		<%while (rset.next()) { // 쿼리 읽어오기%>
		<tr>
			<td width=50><p align=center>
					<a href="./oneview.jsp?name=<%=rset.getString(1)%>&id=<%=rset.getInt(2)%>" target="main"><%=rset.getString(1)%></a></p></td>
			<!--이름, 파라미터 추가하여oneview로 들어갈 수 있는 링크 생성-->
			<td width=50><p align=center><%=Integer.toString(rset.getInt(2))%></p></td>
			<!--번호-->
			<td width=50><p align=center><%=Integer.toString(rset.getInt(3))%></p></td>
			<!--국어-->
			<td width=50><p align=center><%=Integer.toString(rset.getInt(4))%></p></td>
			<!--영어-->
			<td width=50><p align=center><%=Integer.toString(rset.getInt(5))%></p></td>
			<!--수학-->
		</tr>
		<%}%>
	</table>
	<%
		// 예외 처리
	} catch (ClassNotFoundException e) {
	out.println("error==>" + e + "<==<br>");
	} catch (SQLException e) {
	out.println("error==>" + e + "<==<br>");
	} finally {
	try {
		rset.close();
		stmt.close();
		conn.close();
	} catch (Exception e) {
		out.println("error==>" + e + "<==<br>");
	}
	}
	%>
</body>
</html>