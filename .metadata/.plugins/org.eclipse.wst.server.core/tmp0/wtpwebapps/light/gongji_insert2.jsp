<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="./static/js/jquery-3.5.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Cinzel&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<!-- 부트스트랩 -->
<!-- 섬머노트 -->
<link href="./static/css/summernote/summernote-bs4.css"
	rel="stylesheet">
<script src="./static/js/summernote/summernote-bs4.js"></script>
<script src="./static/js/summernote/lang/summernote-ko-KR.js"></script>
<script>
	function sendFile(file, editor) {
		// 파일 전송을 위한 폼생성
		data = new FormData();
		data.append("file", file);
		$.ajax({ // ajax를 통해 파일 업로드 처리
			data : data,
			type : "POST",
			url : "./upload",
			cache : false,
			contentType : false,
			processData : false,
			success : function(data) { // 처리가 성공할 경우
				// 에디터에 이미지 출력
				$(editor).summernote('insertImage', data.url);
			}
		});
	}

	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			minHeight : 250, // 최소 높이
			maxHeight : 500, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			// 이미지를 업로드할 경우 이벤트를 발생
			callbacks : {
			onImageUpload : function(files) {
				sendFile(files[0], this);
				}
			}
		});
	});
</script>
<title></title>
</head>
<body BACKGROUND="./image/bg.png">
	<center>
	<h2 style="font-family: 'Cinzel', serif;">Review</h2>
		<%
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		// 심플데이트포맷으로 날짜 형태 지정 
		Date currentTime = new Date(); // 현재 날짜 불러오기
		String mTime = mSimpleDateFormat.format(currentTime); // 포맷씌워서 저장
		%>
		<form method=post name="form" enctype="multipart/form-data">
			<table class="table table-bordered" style="width:650px;" border=1 cellspacing=0 cellpadding=5>
				<tr>
					<td><b>번호</b></td>
					<td>신규(insert)</td>
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
					<td><b>파일</b></td>
					<td><input type="file" name="filename"></td>
				</tr>
								<tr>
					<td><b>이미지</b></td>
					<td><input type="file" name="imagename"></td>
				</tr>
			</table>
			<table width=650>
				<tr>
					<td width=600></td>
					<td><button type=button class="btn btn-default"
							OnClick="location.href='gongji_list2.jsp'">취소</button></td>
					<!-- 취소창으로 -->
					<td><button type=submit class="btn btn-default"
							OnClick="javascript: form.action='./gongji_write2.jsp';">쓰기</button></td>
					<!-- 쓰기창으로 -->
				</tr>
			</table>
		</form>
	</center>
</body>
</html>