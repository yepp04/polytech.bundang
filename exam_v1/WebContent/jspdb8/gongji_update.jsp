<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../static/js/jquery-3.5.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="../static/js/summernote/lang/summernote-ko-KR.js"></script>
<script type="text/javascript">
	function submitForm(mode) {/* 쓰기누르면 쓰기창, 삭제 누르면 삭제창 */
		if (mode == "write") {
			fm.action = "gongji_write.jsp";
		} else if (mode == "delete") {
			fm.action = "gongji_delete.jsp"
		}
		fm.submit();
	}
</script>
<script>
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			minHeight : 250, // 최소 높이
			maxHeight : 500, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
		});
	});
</script>
<title></title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");//인코딩
	String id = request.getParameter("key");
	// 파라미터 받아오기
	NoticeService2 service = new NoticeService2(); // 인스턴스 생성
	%>
	<form method=post name='fm' enctype="multipart/form-data">
		<table width=700 border=1 cellspacing=0 cellpadding=5>
			<tr>
				<td><b>번호</b></td>
				<td><input type=text name=id size=70 maxlength=70
					value=<%=service.selectOne(Integer.parseInt(id)).get(0).getId()%>
					readonly></td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><input type=text name=title size=70 maxlength=70
					value='<%=service.selectOne(Integer.parseInt(id)).get(0).getTitle()%>'></td>
			</tr>
			<tr>
				<td><b>일자</b></td>
				<td><%=service.selectOne(Integer.parseInt(id)).get(0).getDate()%></td>
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td><textarea name=content id="summernote"><%=service.selectOne(Integer.parseInt(id)).get(0).getContent()%></textarea><br></td>
			</tr>
			<%
				if (service.selectOne(Integer.parseInt(id)).get(0).getFilename() != null) {
			%>
			<tr>
				<th>첨부파일</th>
				<td><%=service.selectOne(Integer.parseInt(id)).get(0).getFilename()%><input
					type=hidden name=file
					value=<%=service.selectOne(Integer.parseInt(id)).get(0).getFilename()%>></td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td><b>파일</b></td>
				<td><input type="file" name="filename"></td>
			</tr>
			<%
				}
			%>
		</table>
		<table width=700>
			<tr>
				<td width=700></td>
				<td><button type=button value="취소" class="btn btn-default"
						OnClick="location.href='gongji_list.jsp'">취소</button></td>
				<td><button type=button value="쓰기" class="btn btn-default"
						OnClick="submitForm('write')">쓰기</button></td>
				<td><button type=button value="삭제" class="btn btn-default"
						OnClick="submitForm('delete')">삭제</button></td>
			</tr>
		</table>
	</form>
</body>
</html>
