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
	String date = request.getParameter("date");
	String sRoom = request.getParameter("room");
	int room = Integer.parseInt(sRoom);
	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");
	String inname = request.getParameter("inname");
	String comment = request.getParameter("comment");

	ResvService service = new ResvService();
	String aName = null;
	if (!"".equals(date)) {
		aName = service.selectOne(date, room).get(0).getName();
	}
	%><script>
		alert(aName);
	</script>
	<%
		if ("<!---".equals(name) || "".equals(name) || "#".equals(name) || "--".equals(name) || "/*".equals(name)
			|| "*/".equals(name) || ";%00".equals(name)) {
	%>
	<script>
		alert("이름을 다시 입력하세요.")
		location.href = 'd_01_m.jsp'; /* 예약현황으로 이동 */
	</script>
	<%
		}

	if ("".equals(date)) {
	%>
	<script>
		alert("날짜를 다시 입력하세요.")
		location.href = 'd_01_m.jsp'; /* 예약현황으로 이동 */
	</script>
	<%
		}

	if (aName == null && !"<!---".equals(name) && !"".equals(date)) {
	Resv resv = new Resv(name, date, room, addr, tel, inname, comment);
	service.create(resv);
	} else {
	%>
	<script>
		alert("이미 예약된 방입니다.")
	</script>
	<%
		}
	%>
	<script>
		location.href = 'd_01_m.jsp'; /* 예약현황으로 이동 */
	</script>
</body>
</html>