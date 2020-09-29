<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form method=post name='form'>
		<table width=650 border=1 cellspacing=0 cellpadding=5>
			<tr>
				<td><b>번호</b></td>
				<td>1</td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td>공지사항1</td>
			</tr>
			<tr>
				<td><b>일자</b></td>
				<td>2018-01-14</td>
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td>공지사항내용1</td>
			</tr>
		</table>
		<table width=650>
		<tr>
		<td width=600></td>
		<td><input type=button value="목록" OnClick="location.href='gongji_list_H.jsp'"></td> <!-- 목록으로 이동 -->
		<td><input type=button value="수정" OnClick="location.href='gongji_update_H.jsp?key=1'"></td><!-- 수정창으로 이동 -->
		</tr>
		</table>
	</form>
</body>
</html>