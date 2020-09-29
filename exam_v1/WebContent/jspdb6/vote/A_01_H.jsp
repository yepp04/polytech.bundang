<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<table border=1 cellspacing=0 style="border-color: blue;">
		<tr style="font-size: 2em;">
			<td width=150 align=center style="background-color: yellow;"><a
				href="./A_01_H.jsp" style="color: black; text-decoration: none">후보등록</a></td>
			<td width=150 align=center><a href="./B_01_H.jsp"
				style="color: black; text-decoration: none">투표</a></td>
			<td width=150 align=center><a href="./C_01_H.jsp"
				style="color: black; text-decoration: none">개표결과</a></td>
		</tr>
	</table>
	<table border=1 cellspacing=0 style="font-size: 1.3em;">
		<tr>
			<form method="post" action="A_02_H.jsp" name="form">
				<td width=600><div style="float: left;">기호번호 :
						1&nbsp;&nbsp;&nbsp;&nbsp;후보명 : 김일돌</div>
					<div style="float: right;">
						<input type="submit"
							style="width: 100px; font-size: 1em; background-color: #00CC99"
							value="삭제" name="delete" align=right>
					</div></td>

			</form>
		</tr>
		<tr>
			<form method="post" action="A_03_H.jsp" name="form">
			<td width=600><div style="float: left;">
					기호번호 : <input type="text" name="num" border=1
						style="width: 25px; border-color: #00CC99;"> 후보명 : <input
						type="text" name="name" border=1
						style="width: 100px; border-color: #00CC99;">
				</div>
				<div style="float: right;">
					<input type="submit"
						style="width: 100px; font-size: 1em; background-color: #00CC99"
						value="추가" name="add" align=right>
				</div></td>
			</form>
		</tr>
	</table>

</body>
</html>