<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<%
String loginOK = null;
loginOK = (String)session.getAttribute("login_ok"); //login_ok의 세션을 받아온다
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- 부트스트랩 -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Cinzel&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script type="text/javascript">
	function submitForm(mode) {/* 쓰기누르면 쓰기창, 삭제 누르면 삭제창 */
		if (mode == "reinsert") {
			fm.action = "gongji_reinsert.jsp";
		} else if (mode == "delete") {
			fm.action = "gongji_delete2.jsp"
		}
		fm.submit();
	}
</script>
<title></title>
</head>

<body BACKGROUND="./image/bg.png">
	<center>
	<h2 style="font-family: 'Cinzel', serif;">Review</h2>
		<%
			request.setCharacterEncoding("utf-8");//인코딩
		String id = request.getParameter("key"); // 파라미터 받아오기
		NoticeService4 service = new NoticeService4(); // 인스턴스 생성
		service.updateViewcnt(Integer.parseInt(id)); // 조회수 증가
		int sId = service.selectOne(Integer.parseInt(id)).get(0).getId();
		String sTitle = service.selectOne(Integer.parseInt(id)).get(0).getTitle();
		String sDate = service.selectOne(Integer.parseInt(id)).get(0).getDate();
		int sViewcnt = service.selectOne(Integer.parseInt(id)).get(0).getViewcnt();
		String sContent = service.selectOne(Integer.parseInt(id)).get(0).getContent();
		int sRootid = service.selectOne(Integer.parseInt(id)).get(0).getRootid();
		int sRelevel = service.selectOne(Integer.parseInt(id)).get(0).getRelevel();
		int sRecnt = service.selectOne(Integer.parseInt(id)).get(0).getRecnt();
		String sFilename = service.selectOne(Integer.parseInt(id)).get(0).getFilename();
		String sImagename = service.selectOne(Integer.parseInt(id)).get(0).getImagename();
		%>
		<form method=post name='fm'>
			<table class="table table-bordered" style="width:650px;" border=1 cellspacing=0 cellpadding=5>
				<tr>
					<td><b>번호</b></td>
					<td><%=sId%> <input type="hidden" name="id" value=<%=sId%>></td>
				</tr>
				<tr>
					<td width=150><b>제목</b></td>
					<td><%=sTitle%></td>
				</tr>
				<tr>
					<td width=150><b>일자</b></td>
					<td><%=sDate%></td>
				</tr>
				<tr>
					<td width=150><b>조회수</b></td>
					<td><%=sViewcnt%></td>
				</tr>
				<tr>
					<td width=150><b>내용</b></td>
					<td>
						<%
							if (sImagename != null) {
						%> <img src="./upload/<%=sImagename%>" width=400 height=350>
						<%
							}
						%> <%=sContent%> <input type="hidden" name="rootid"
						value=<%=sRootid%>> <input type="hidden" name="relevel"
						value=<%=sRelevel%>> <input type="hidden" name="recnt"
						value=<%=sRecnt%>>
					</td>
					<!-- 내용, 그리고 히든으로 파라미터값 다 보냄 -->
				</tr>
				<%
					if (sFilename != null && sImagename != null) {
				%>
				<tr>
					<th>첨부파일</th>
					<td><a href="upload/<%=sFilename%>" download><%=sFilename%></a></td>
				</tr>
				<tr>
					<th>첨부그림</th>
					<td><%=sImagename%></td>
				</tr>
				<%
					} else if (sFilename != null && sImagename == null) {
				%>
				<tr>
					<th>첨부파일</th>
					<td><a href="upload/<%=sFilename%>" download><%=sFilename%></a></td>
				</tr>
				<%
					} else if (sFilename == null && sImagename != null) {
				%>
				<tr>
					<th>첨부그림</th>
					<td><%=sImagename%></td>
				</tr>
				<%
					}
				if (sId != sRootid) { // 만약에 루트아이디랑 아이디랑 다르면 댓글이다
				%>
				<tr>
					<td><b>원글</b></td>
					<td><%=sRootid%></td>
				</tr>
				<tr>
					<td><b>댓글수준</b></td>
					<td><span><%=sRelevel%><span
							style="display: inline-block; width: 80%; text-align: center;">댓글
								내 순서<input type="text" name="order" size=3 value=<%=sRecnt%>
								readonly>
						</span></span></td>
				</tr>
				<%
					}
				%>
			</table>
			<table width=650>
				<tr>
					<td width=600></td>
					<td><button type=button class="btn btn-default"
							OnClick="location.href='gongji_list2.jsp'">목록</button></td>
											<%if (loginOK != null) {
						%>
					<td><button type=button class="btn btn-default"
							OnClick="location.href='gongji_update2.jsp?key=<%=id%>'">수정</button></td>
					<!-- id를 get으로 보냄 -->
					<td><button type=button class="btn btn-default"
							OnClick="submitForm('delete')">삭제</button></td>	
					<td><button type=button class="btn btn-default"
							OnClick="submitForm('reinsert')">댓글</button></td>
						<%
					}
					%>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>