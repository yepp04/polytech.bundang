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
				<td>신규(insert)</td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><input type=text name=title size=70 maxlength=70></td>
			</tr>
			<tr>
				<td><b>일자</b></td>
				<td>2020-07-14</td>
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td><textarea style="width: 500px; height: 250px;" name=content
						cols=70 row=600></textarea></td>
			</tr>
		</table>
		<table width=650>
			<tr>
				<td width=600></td>
				<td><input type=button value="취소"
					OnClick="location.href='gongji_list_H.jsp'"></td><!-- 취소창으로 이동 -->
				<td><input type=button value="쓰기" OnClick="javascript: form.action='./gongji_write.jsp';" /></td>
				<!-- 쓰기 창으로 이동 -->
			</tr>
		</table>
	</form>
</body>
</html>