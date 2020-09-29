<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
/* UI Object 가로 */
.h_graph .g_term {
	position: absolute;
	top: 0;
	left: -50px;
	width: 40px;
	font-weight: bold;
	color: red;
	line-height: 20px;
	text-align: right;
}

.h_graph .g_bar {
	display: inline-block;
	position: relative;
	height: 20px;
	border: 1px solid #ccc;
	border-left: 0;
	font-size: 1.2em;
	background: red;
}

.h_graph .g_bar span {
	position: absolute;
	top: 0;
	right: -50px;
	width: 40px;
	line-height: 20px;
}
/* //UI Object */
</style>
</head>
<body>
	<table border=1 cellspacing=0 style="border-color: blue;">
		<tr style="font-size: 2em;">
			<td width=150 align=center><a href="./A_01_H.jsp"
				style="color: black; text-decoration: none">후보등록</a></td>
			<td width=150 align=center><a href="./B_01_H.jsp"
				style="color: black; text-decoration: none">투표</a></td>
			<td width=150 align=center style="background-color: yellow;"><a
				href="./C_01_H.jsp" style="color: black; text-decoration: none">개표결과</a></td>
		</tr>
	</table>
	<p style="font-size: 1.2em;">후보별 득표율</p>
	<table border=1 cellspacing=0>
		<tr>
			<td width=150><span class="g_term"><a href="./C_02_H.jsp" style="color: black; font-size: 1.2em;">1 김일돌</a></span></td>
			<td class="h_graph" width=400><span class="g_bar" style="width: 10%"><span>102(10%)</span></span></td>
		</tr>
		<tr>
			<td><span class="g_term">2 김이돌</span></td>
			<td class="h_graph"><span class="g_bar" style="width: 20%"><span>204(20%)</span></span></td>
		</tr>
		<tr>
			<td><span class="g_term">3 김삼돌</span></td>
			<td class="h_graph"><span class="g_bar" style="width: 30%"><span>306(30%)</span></span></td>
		</tr>
		<tr>
			<td><span class="g_term">2 김사돌</span></td>
			<td class="h_graph"><span class="g_bar" style="width: 50%"><span>204(50%)</span></span></td>
		</tr>
		<tr>
			<td><span class="g_term">2 김오돌</span></td>
			<td class="h_graph"><span class="g_bar" style="width: 90%"><span>204(90%)</span></span></td>
		</tr>
	</table>
</body>
</html>