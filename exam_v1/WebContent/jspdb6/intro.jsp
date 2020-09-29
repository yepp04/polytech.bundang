<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.net.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>JSP Database 실습1</h1>

	<%
	FileReader fl = null;
	FileWriter fl2 = null;
		try {
		String data ="0";
		int cnt = 0;
		String filePath = application.getRealPath("/jspdb6/home/cnt.txt");//JSP에서 경로구해오는 법
		fl = new FileReader(filePath);
		StringBuffer sb = new StringBuffer();
		int ch = 0;
		while ((ch = fl.read()) != -1) {// 한 단어씩 읽어온다
			sb.append((char) ch);// 이어서 더한다
		}
		data = sb.toString().trim().replace("\n", "");//끝에 띄어쓰기와 개행을 없앤다


		cnt = Integer.parseInt(data);// 방문자수
		cnt++; // 방문했을 때 1 더하기
		data = Integer.toString(cnt);
		out.println("<br><br>현재 홈페이지 방문조회수는 [" + data + "] 입니다<br>");

		fl2 = new FileWriter(filePath, false);
		fl2.write(data);//더한 방문자수를 다시 입력

		// 예외 처리
	} catch (IOException | NumberFormatException e) {
		out.println("error==>" + e + "<==<br>");
	} finally {
		try{
			fl.close();
			fl2.close();
		} catch (Exception e) {
			out.println("error==>" + e + "<==<br>");
		}
	}
	%>
</body>
<!--내용닫기-->
</html>
<!--끝-->