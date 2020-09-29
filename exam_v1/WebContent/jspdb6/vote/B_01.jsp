<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<table border=1 cellspacing=0 style="border-color: blue;">
		<tr style="font-size: 2em;">
			<td width=150 align=center><a href="./A_01.jsp"
				style="color: black; text-decoration: none">후보등록</a></td>
			<td width=150 align=center style="background-color: yellow;"><a
				href="./B_01.jsp" style="color: black; text-decoration: none">투표</a></td>
			<td width=150 align=center><a href="./C_01.jsp"
				style="color: black; text-decoration: none">개표결과</a></td>
		</tr>
	</table>
	<%
		VoteService service = new VoteService();// 인스턴스 생성
	%>
	<table border=1 cellspacing=0 style="font-size: 1.3em;">
		<tr>
			<form method="post" action="B_02.jsp">
				<td width=600><div width=150 style="float: left;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select
							style="font-size: 1em;" name=choiceName>
							<%
								for (Vote v : service.selectAll()) {//후보 전체 검색
							%>
							<option value=<%=v.getId()%>><%=v.getId()%>  <%=v.getName()%>
							<!-- 검색에 따라 옵션 추가, 후보 투표-->
								<%
								}
							%>
							
						</select>
					</div>
					<div width=150 style="float: left;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select
							style="font-size: 1em;" name=choiceAge> <!-- 투표하는 사람이 몇살 인지 -->
							<option value=1>10대
							<option value=2>20대
							<option value=3>30대
							<option value=4>40대
							<option value=5>50대
							<option value=6>60대
							<option value=7>70대
							<option value=8>80대
							<option value=9>90대
						</select>
					</div>
					<div width=150 style="float: right;">
						<input type="submit"
							style="width: 100px; font-size: 1em; background-color: #00CC99"
							value="투표하기" name="vote">
					</div></td>
			</form>
		</tr>
	</table>
</body>
</html>