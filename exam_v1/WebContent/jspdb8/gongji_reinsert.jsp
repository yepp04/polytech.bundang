<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
	href="../static/css/summernote/summernote-bs4.css"
	rel="stylesheet">
<script
	src="../static/js/summernote/summernote-bs4.js"></script>
<script src="../static/js/summernote/lang/summernote-ko-KR.js"></script>
<script>
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			minHeight : 250, // 최소 높이
			maxHeight : 500, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
		/*  placeholder: '최대 2048자까지 쓸 수 있습니다'*///placeholder 설정
		});
	});
</script>
<title></title>
</head>
<body>
	<%
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	// 심플데이트포맷으로 날짜 형태 지정 
	Date currentTime = new Date(); // 현재 날짜 불러오기
	String mTime = mSimpleDateFormat.format(currentTime); // 포맷씌워서 저장

	request.setCharacterEncoding("utf-8");//인코딩
	String rootid = request.getParameter("rootid");
	String level = request.getParameter("relevel");
	String cnt = request.getParameter("recnt");
	int relevel = Integer.parseInt(level) + 1;
	int recnt = Integer.parseInt(cnt);
	// 파라미터 받아오기
	%>
	<form method=post name="form" enctype="multipart/form-data">
		<table width=700 border=1 cellspacing=0 cellpadding=5>
			<tr>
				<td><b>번호</b></td>
				<td><span>댓글<span><input type=text name="insert"
							size=10 maxlength=10 value="INSERT" readonly></span></span></td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><input type=text name=title size=70 maxlength=70></td>
			</tr>
			<tr>
				<td><b>일자</b></td>
				<!-- 계산한 오늘 날짜를 삽입 -->
				<td><%=mTime%><input type=hidden name=date value=<%=mTime%>></td>
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td><textarea name=content id="summernote"></textarea></td>
			</tr>
			<tr>
				<td><b>원글</b></td>
				<td><input type=text name=rootid size=10 maxlength=10
					value=<%=Integer.parseInt(rootid)%> readonly></td>
			</tr>
			<tr>
				<td><b>댓글수준</b></td>
				<td><span><input type=text name=relevel size=10
						maxlength=10 value=<%=relevel%> readonly><span
						style="display: inline-block; width: 70%; text-align: center;">댓글내
							순서 &nbsp;<input type=text size=3 maxlength=3 value=<%=recnt + 1%>
							readonly><input type=hidden name=recnt size=3 maxlength=3
							value=<%=recnt%>>
					</span></span></td>
			</tr>
			<tr>
				<td><b>파일</b></td>
				<td><input type="file" name="filename"></td>
			</tr>
		</table>
		<table width=700>
			<tr>
				<td width=600></td>
				<td><button type=button value="취소" class="btn btn-default"
					OnClick="location.href='gongji_list.jsp'">취소</button></td>
				<!-- 취소창으로 -->
				<td><button type=submit value="쓰기" class="btn btn-default"
					OnClick="javascript: form.action='./gongji_write.jsp';">쓰기</button></td>
				<!-- 쓰기창으로 -->
			</tr>
		</table>
	</form>
</body>
</html>