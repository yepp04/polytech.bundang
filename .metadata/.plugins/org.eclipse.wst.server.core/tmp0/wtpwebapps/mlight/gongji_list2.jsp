<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
<style>
div.center { /*테이블 페이지 숫자 상대적 포지션으로 정렬*/
	width: 310px;
	text-align: center;
	bottom: 10px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="user-scalable=no, width=device-width" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- 부트스트랩 -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Cinzel&family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet">
<style>
</style>
<title></title>
</head>
<body BACKGROUND="./image/bg.png">
	<center>
		<h2 style="font-family: 'Cinzel', serif;">Review</h2>
		<table class="table table-bordered" style="width: 310px;"
			cellspacing=1 border=1>
			<tr>
				<td width=25><span
					style="display: inline-block; width: 100%; text-align: center;">번호</span></td>
				<td width=50><span
					style="display: inline-block; width: 100%; text-align: center;">제목</span></td>
				<td width=30><span
					style="display: inline-block; width: 100%; text-align: center;">파일</span></td>
				<td width=38><span
					style="display: inline-block; width: 100%; text-align: center;">조회수</span></td>
				<td width=47><span
					style="display: inline-block; width: 100%; text-align: center;">등록일</span></td>
			</tr>
			<%
				request.setCharacterEncoding("utf-8");//인코딩
			String cnt = request.getParameter("cnt"); //get방식으로 파라미터 받아오기, 몇개 출력
			String num = request.getParameter("num"); // get방식으로 파라미터 받아오기, 페이지번호
			String what = request.getParameter("what"); // post방식으로 파라미터 받아오기
			String search = request.getParameter("search"); // post방식으로 파라미터 받아오기

			if (cnt == null) {
				cnt = "10";
			}
			if (num == null) { // 페이지번호의 기본값은 1
				num = "1";
			}

			NoticeService4 service = new NoticeService4(); // 인스턴스 생성
			int total = 0;
			if (search != null) {
				for (Notice4 n : service.selectAll(what, search)) {
					total++;
				}
			} else {
				for (Notice4 n : service.selectAll()) {
					total++;
				}
			}
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
			if (search != null) {
				for (Notice4 n : service.selectAll(what, search)) { // 모든 글 검색 및 뿌리기
					if (LineCnt < start) {
				LineCnt++;
				continue;
					}

					if (LineCnt > end) {

				break;
					}
			%>
			<tr>
				<td width=25><span
					style="display: inline-block; width: 100%; text-align: center;"><%=n.getId()%></span></td>
				<td width=50><span><a
						href="gongji_view2.jsp?key=<%=n.getId()%>"><%=n.getTitle()%></a> </span></td>
				<td width=30>
					<%
						if (n.getFilename() != null) {
					%> <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"
					style="display: inline-block; width: 100%; text-align: center;"></span>
					<%
						}
					%>
				</td>
				<td width=38><span
					style="display: inline-block; width: 100%; text-align: center;"><%=n.getViewcnt()%></span></td>

				<td width=47><span
					style="display: inline-block; width: 100%; text-align: center;"><font size=0.5><%=n.getDate()%></font></span></td>
			</tr>
			<%
				LineCnt++;
			}
			} else {
			for (Notice4 n : service.selectAll()) { // 모든 글 검색 및 뿌리기
			if (LineCnt < start) { // 시작번호가 카운트보다 높으면 지나감
				LineCnt++;
				continue;
			}
			if (LineCnt > end) { // 끝번호보다 카운트가 높으면 멈춤
				break;
			}
			%>
			<tr>
				<td width=25><span
					style="display: inline-block; width: 100%; text-align: center;"><%=n.getId()%></span></td>
				<td width=50><span><a
						href="gongji_view2.jsp?key=<%=n.getId()%>"><%=n.getTitle()%></a> </span></td>
				<td width=30>
					<%
						if (n.getFilename() != null) {
					%> <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"
					style="display: inline-block; width: 100%; text-align: center;"></span>
					<%
						}
					%>
				</td>
				<td width=38><span
					style="display: inline-block; width: 100%; text-align: center;"><%=n.getViewcnt()%></span></td>

				<td width=47><span
					style="display: inline-block; width: 100%; text-align: center;"><font size=0.5><%=n.getDate()%></font></span></td>
			</tr>
			<%
				LineCnt++;
			}
			}
			%>

		</table>
		<table width=310>
			<tr>
				<td width=310>
					<%
						if (search != null) {
					%>
					<button type=button class="btn btn-default"
						Onclick="window.location='gongji_list2.jsp'">목록</button> <%
 	}
 %>
				</td>
				<td><button type=button class="btn btn-default"
						Onclick="window.location='gongji_insert2.jsp'">신규</button></td>
				<!-- 글쓰기 창으로 -->
			</tr>
		</table>

		<table width=200 border=0 cellspacing=0 cellpadding=0>
			<form method="post" action="gongji_list2.jsp"
				class="navbar-form navbar-left" role="search">
			<tr>
				<td width=200><div align=center>
						<select class="form-control" name=what>
							<option value="제목">제목
							<option value="내용">내용<br>
						</select>&nbsp;<input type="text" class="form-control" placeholder="Search"
							name="search" style="width: 200px;">
						<button type="submit" class="btn btn-default" name="submit">검색</button>
					</div></td>
			</tr>
			</form>
		</table>
		<div class="center">
			<!--div-->
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<%
						if (startPage - pageSize < 0) { // '<<' 누를 때 최소로 나오는 번호가 1일 수 있도록 마이너스가 안나오게
					%>
					<li><a href="./gongji_list2.jsp?num=1&cnt=<%=cntPT%>"
						aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
					<%
						} else {
					%>
					<li><a
						href="./gongji_list2.jsp?num=<%=startPage - pageSize%>&cnt=<%=cntPT%>"
						aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
					<%
						}
					for (int i = startPage; i < endPage; i++) { // 페이지번호 출력
					%>
					<li><a href="./gongji_list2.jsp?num=<%=i%>&cnt=<%=cntPT%>"><%=i%></a></li>
					<%
						}
					if (startPage + pageSize > pageCount) {
					%>
					<li><a
						href="./gongji_list2.jsp?num=<%=pageCount%>&cnt=<%=cntPT%>">&raquo;</a>
					<li>
						<%
							} else {
						%>
					
					<li><a
						href="./gongji_list2.jsp?num=<%=(startPage + pageSize)%>&cnt=<%=cntPT%>"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
					<%
						}
					%>
				</ul>
			</nav>
		</div>
	</center>
</body>
</html>