<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<style>
div.relative { /*테이블 페이지 숫자 상대적 포지션으로 정렬*/
	position: relative;
	width: 600px;
	left: 220px;
	bottom: 10px;
}
</style>
</head>
<!--문서정의 닫기-->
<body>
	<!--내용 입력-->
	<h3>와이파이</h3>
	<%
		BufferedReader br = null; // 버퍼리더 변수 생성
	try {
		String filePath = application.getRealPath("wifi/file/전국무료와이파이표준데이터.txt");
		// 파일 경로 받아오기
		br = new BufferedReader(new FileReader(filePath)); // 버퍼리더 생성
		String readtxt;
		if ((readtxt = br.readLine()) == null) {
			out.println("빈 파일입니다");
			return;
		}

		double lat = 37.3860521; //위도
		double lng = 127.1214038; //경도

		String cnt = request.getParameter("cnt"); //get방식으로 파라미터 받아오기, 몇개 출력
		String num = request.getParameter("num"); // get방식으로 파라미터 받아오기, 페이지번호

		if (cnt == null) {
			cnt = "10";
		}
		if (num == null) { // 페이지번호의 기본값은 1
			num = "1";
		}

		int total = 14828; // 파일 총 개수
		int pageSize = 10; // 제일 아래 나열된 페이지 번호 개수
		int LineCnt = 1; // 시작 번호
		int cntPT = Integer.parseInt(cnt);// 변수에 값을 인트로 변환해서 넣는다
		int pageNum = Integer.parseInt(num); // 변수에 값을 인트로 변환해서 넣는다
		int start = (pageNum - 1) * cntPT + 1; // 만약 10개씩 본다면 1, 11, 21, 순
		int end = pageNum * cntPT; // 만약 10개씩 본다면 10 20 30 순
		int pageCount = total / cntPT + (total % cntPT == 0 ? 0 : 1);
		// 몇페이지까지 나오는지 계산
		int startPage = ((int) (pageNum / pageSize) - (pageNum % pageSize == 0 ? 1 : 0)) * pageSize + 1;
		// 시작하는 페이지번호
		int endPage = startPage + pageSize; // 끝나는 페이지 번호
		if (endPage > pageCount) {// 만약 끝나는 페이지가 마지막 페이지보다 크다면
			endPage = pageCount + 1; // 마지막 페이지와 같게 만듬
		}
	%>
	<p>
	<table border=1 cellspacing=0>
		<tr>
			<td align=center>번호</td>
			<td align=center>주소</td>
			<td align=center>위도</td>
			<td align=center>경도</td>
			<td align=center>거리</td>
		</tr>
		<%
			while ((readtxt = br.readLine()) != null) {
			if (LineCnt < start) {
				LineCnt++;
				continue;
			}
			if (LineCnt > end)
				break;
			String[] field = readtxt.split("\t");
			double dist = Math
			.sqrt(Math.pow(Double.parseDouble(field[12]) - lat, 2) + Math.pow(Double.parseDouble(field[13]) - lng, 2));
		%>
		<tr>
			<td align=center><%=LineCnt%></td>
			<td align=center width=400><%=field[9]%></td>
			<td align=center><%=field[12]%></td>
			<td align=center><%=field[13]%></td>
			<td align=center><%=dist%></td>
		</tr>
		<%
			LineCnt++;
		}
		%>
	</table>
	<div class="relative">
		<br>
		<!--div-->

		<%
			if (startPage - pageSize < 0) { // '<<' 누를 때 최소로 나오는 번호가 1일 수 있도록 마이너스가 안나오게
		%>
		<a href="./wifi3.jsp?num=1&cnt=<%=cntPT%>">&laquo;</a>
		<%
			} else {
		%>
		<a href="./wifi3.jsp?num=<%=startPage - pageSize%>&cnt=<%=cntPT%>">&laquo;</a>
		<%
			}
		for (int i = startPage; i < endPage; i++) { // 페이지번호 출력
		%>
		<a href="./wifi3.jsp?num=<%=i%>&cnt=<%=cntPT%>"><%=i%></a>
		<%
			}
		if (startPage + pageSize > pageCount) {
		%>
		<a href="./wifi3.jsp?num=<%=pageCount%>&cnt=<%=cntPT%>">&raquo;</a>

		<%
			} else {
		%>
		<a href="./wifi3.jsp?num=<%=(startPage + pageSize)%>&cnt=<%=cntPT%>">&raquo;</a>

		<%
			}
		} catch (FileNotFoundException e) {
		out.println("error==>" + e + "<==<br>");
		} catch (IOException e) {
		out.println("error==>" + e + "<==<br>");
		} finally {
		try {
		br.close();
		} catch (Exception e) {
		out.println("error==>" + e + "<==<br>");
		}
		}
		%>
	</div>
</body>
<!--내용닫기-->
</html>
<!--끝-->