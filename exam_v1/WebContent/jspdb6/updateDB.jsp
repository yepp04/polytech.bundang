<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#change {
	background: yellow;/*id change 노란색으로 바꾸기*/
}
</style>
<title></title>
</head>
<body>
	<h1>레코드 수정</h1>
	<%
		request.setCharacterEncoding("utf-8");//인코딩
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	// 파라미터 받아오기
	if (name.equals("") || kor.equals("") || eng.equals("") || mat.equals("")) {
	%><script>
	alert("공백을 입력하셨습니다")
	window.location = "./InputForm2.html";
</script>
	<%
		} else {
	StudentService service = new StudentService();
	try {
		Student student = new Student(name, Integer.parseInt(id), Integer.parseInt(kor), Integer.parseInt(eng),
		Integer.parseInt(mat));
		service.update(student);
	%>
	<table cellspacing=1 width=600 border=1 cellpadding=0>
		<tr>
			<td width=50><p align=center>이름</p></td>
			<td width=50><p align=center>학번</p></td>
			<td width=50><p align=center>국어</p></td>
			<td width=50><p align=center>영어</p></td>
			<td width=50><p align=center>수학</p></td>
		</tr>
		<%
			for (Student s : service.selectAll()) { // 모든 값을 검색
			if (s.getStudentId() == Integer.parseInt(id)) { // 검색한 아이디가 같으면
		%>
		<tr id="change"><!--테이블 한 줄 노란색으로 바꾸기-->
			<td width=50><p align=center>
					<a href="../jspdb5/oneview.jsp?name=<%=s.getName()%>" target="main"><%=s.getName()%>
				</p></td><!--get으로 파라미터 보내기-->
			<td width=50><p align=center><%=s.getStudentId()%></p></td>
			<td width=50><p align=center><%=s.getKor()%></p></td>
			<td width=50><p align=center><%=s.getEng()%></p></td>
			<td width=50><p align=center><%=s.getMat()%></p></td>
		</tr>
		<%
			} else {
		%>
		<tr>
			<td width=50><p align=center>
					<a href="../jspdb5/oneview.jsp?name=<%=s.getName()%>" target="main"><%=s.getName()%>
				</p></td><!--get으로 파라미터 보내기-->
			<td width=50><p align=center><%=s.getStudentId()%></p></td>
			<td width=50><p align=center><%=s.getKor()%></p></td>
			<td width=50><p align=center><%=s.getEng()%></p></td>
			<td width=50><p align=center><%=s.getMat()%></p></td>
		</tr>
		<%
			}
		}
		%>
	</table>
	<%
		// 예외 처리
	} catch (SQLException e) {
	out.println("error==>" + e + "<==<br>");
	} catch (NumberFormatException e) {
	%><script>
			alert("잘못 입력하셨습니다");
			window.location = "./InputForm2.html";
		</script>
	<%
		} finally {
	try {
	} catch (Exception e) {
		out.println("error==>" + e + "<==<br>");
	}
	}
	}
	%>


</body>
</html>