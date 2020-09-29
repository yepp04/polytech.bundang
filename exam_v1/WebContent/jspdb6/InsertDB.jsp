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
	<h1>성적입력추가완료</h1>

	<%
		request.setCharacterEncoding("utf-8"); // 파라미터 보낼 때 깨지지 않도록 인코딩
	String name = request.getParameter("name");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	%><!--파라미터 받아옴-->
	<%
		if (name.equals("") || kor.equals("") || eng.equals("") || mat.equals("")) {
	%><script>
		alert("공백을 입력하셨습니다")
		window.location = "./InputForm1.html";
	</script>
	<%
		} else {
	StudentService studentService = new StudentService();
	try {
		Student student = new Student(name, 0, Integer.parseInt(kor), Integer.parseInt(eng), Integer.parseInt(mat));
		studentService.create(student);
	%>
	<form method="post" action="InputForm1.html" align=center>
		<input type="submit" value="뒤로가기" name="back">
	</form>
	<table border=1 cellspacing=0>
		<tr align=center>
			<td width=100>이름</td>
			<td width=400><form>
					<input type="text" value=<%=name%> name="name" readonly>
				</form></td>
		</tr>
		<tr align=center>
			<td width=100>학번</td>
			<td width=400><form>
					<input type="text"
						value=<%=studentService.selectAll().get(studentService.selectAll().size() - 1).getStudentId()%>
						name="id" readonly><!--DB 제일 마지막에 있는 번호 구해오기-->
				</form></td>
		</tr>
		<tr align=center>
			<td width=100>국어</td>
			<td width=400><form>
					<input type="text"
						value=<%=studentService.selectAll().get(studentService.selectAll().size() - 1).getKor()%>
						name="kor" readonly><!--DB 제일 마지막에 있는 점수 구해오기-->
				</form></td>
		</tr>
		<tr align=center>
			<td width=100>영어</td>
			<td width=400><form>
					<input type="text"
						value=<%=studentService.selectAll().get(studentService.selectAll().size() - 1).getEng()%>
						name="eng" readonly><!--DB 제일 마지막에 있는 점수 구해오기-->
				</form></td>
		</tr>
		<tr align=center>
			<td width=100>수학</td>
			<td width=400><form>
					<input type="text"
						value=<%=studentService.selectAll().get(studentService.selectAll().size() - 1).getMat()%>
						name="mat" readonly><!--DB 제일 마지막에 있는 점수 구해오기-->
				</form></td>
		</tr>
	</table>
	<%
		// 예외 처리
	} catch (SQLException e) {
	out.println("error==>" + e + "<==<br>");
	} catch (NumberFormatException e) {
		%><script>
		alert("잘못 입력하셨습니다");
		window.location = "./InputForm1.html";
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