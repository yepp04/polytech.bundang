<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
</style>
<title></title>
</head>
<body>
	<table cellspacing=1 width=600 border=1><!-- 테이블 생성 -->
		<tr>
			<td width=50><span style="display: inline-block;  width: 100%; text-align:center;">번호</span></td>
			<td width=500><span style="display: inline-block;  width: 100%; text-align:center;">제목</span></td>
			<td width=100><span style="display: inline-block;  width: 100%; text-align:center;">등록일</span></td>
		</tr>
		<tr>
			<td width=50><span style="display: inline-block;  width: 100%; text-align:center;">1</span></td>
			<td width=500><span style="display: inline-block;  width: 100%; text-align:center;">
					<a href="gongji_view_H.jsp?key=1">공지사항1</a>
				</span></td>
			<td width=100><span style="display: inline-block;  width: 100%; text-align:center;">2018-01-14</span></td>
		</tr>
		<tr>
			<td width=50><span style="display: inline-block;  width: 100%; text-align:center;">2</span></td>
			<td width=500><span style="display: inline-block;  width: 100%; text-align:center;">
					<a href="gongji_view_H.jsp?key=2">공지사항2</a>
				</span></td>
			<td width=100><span style="display: inline-block;  width: 100%; text-align:center;">2018-01-15</span></td>
		</tr>
	</table>
	<table width=650>
		<tr>
			<td width=550></td>
			<td><input type=button value="신규" OnClick="window.location='gongji_insert_H.jsp'"></td><!-- 글쓰기 창으로 이동 -->
		</tr>
	</table>
</body>
</html>