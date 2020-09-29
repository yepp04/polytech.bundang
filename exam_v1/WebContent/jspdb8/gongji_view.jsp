<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
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
<script type="text/javascript">
	function submitForm(mode) {/* 쓰기누르면 쓰기창, 삭제 누르면 삭제창 */
		if (mode == "reinsert") {
			fm.action = "gongji_reinsert.jsp";
		} else if (mode == "delete") {
			fm.action = "gongji_delete.jsp"
		}
		fm.submit();
	}
</script>
<title></title>
</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");//인코딩
	String id = request.getParameter("key"); // 파라미터 받아오기
	NoticeService2 service = new NoticeService2(); // 인스턴스 생성
	service.updateViewcnt(Integer.parseInt(id)); // 조회수 증가
	%>
	<form method=post name='fm'>
		<table width=650 border=1 cellspacing=0 cellpadding=5>
			<tr>
				<td><b>번호</b></td>
				<td><%=service.selectOne(Integer.parseInt(id)).get(0).getId()%>
					<input type="hidden" name="id"
					value=<%=service.selectOne(Integer.parseInt(id)).get(0).getId()%>></td>
			</tr>
			<tr>
				<td width=150><b>제목</b></td>
				<td><%=service.selectOne(Integer.parseInt(id)).get(0).getTitle()%></td>
			</tr>
			<tr>
				<td width=150><b>일자</b></td>
				<td><%=service.selectOne(Integer.parseInt(id)).get(0).getDate()%></td>
			</tr>
			<tr>
				<td width=150><b>조회수</b></td>
				<td><%=service.selectOne(Integer.parseInt(id)).get(0).getViewcnt()%></td>
			</tr>
			<tr>
				<td width=150><b>내용</b></td>
				<td><%=service.selectOne(Integer.parseInt(id)).get(0).getContent()%>
					<input type="hidden" name="rootid"
					value=<%=service.selectOne(Integer.parseInt(id)).get(0).getRootid()%>>
					<input type="hidden" name="relevel"
					value=<%=service.selectOne(Integer.parseInt(id)).get(0).getRelevel()%>>
					<input type="hidden" name="recnt"
					value=<%=service.selectOne(Integer.parseInt(id)).get(0).getRecnt()%>></td>
				<!-- 내용, 그리고 히든으로 파라미터값 다 보냄 -->
			</tr>
			<%
				if (service.selectOne(Integer.parseInt(id)).get(0).getFilename() != null) {
			%>
			<tr>
				<th>첨부파일</th>
				<td><a
					href="upload/<%=service.selectOne(Integer.parseInt(id)).get(0).getFilename()%>"
					download><%=service.selectOne(Integer.parseInt(id)).get(0).getFilename()%></a></td>
			</tr>
			<%
				}
			if (service.selectOne(Integer.parseInt(id)).get(0).getId() != service.selectOne(Integer.parseInt(id)).get(0)
					.getRootid()) { // 만약에 루트아이디랑 아이디랑 다르면 댓글이다
			%>
			<tr>
				<td><b>원글</b></td>
				<td><%=service.selectOne(Integer.parseInt(id)).get(0).getRootid()%></td>
			</tr>
			<tr>
				<td><b>댓글수준</b></td>
				<td><span><%=service.selectOne(Integer.parseInt(id)).get(0).getRelevel()%><span
						style="display: inline-block; width: 80%; text-align: center;">댓글
							내 순서<input type="text" name="order" size=3
							value=<%=service.selectOne(Integer.parseInt(id)).get(0).getRecnt()%>
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
					OnClick="location.href='gongji_list.jsp'">목록</button></td>
				<td><button type=button class="btn btn-default"
					OnClick="location.href='gongji_update.jsp?key=<%=id%>'">수정</button></td>
				<!-- id를 get으로 보냄 -->
				<td><button type=button class="btn btn-default"
					OnClick="submitForm('delete')">삭제</button></td>
				<td><button type=button class="btn btn-default"
					OnClick="submitForm('reinsert')">댓글</button></td>
			</tr>
		</table>
	</form>
</body>
</html>