<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.text.SimpleDateFormat, java.util.Date, java.util.Calendar"%>
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
<script>
function submit(val, room) {
document.getElementsByName('date')[0].value = val;
document.getElementsByName('room')[0].value = room;
document.getElementById('form').submit();
} 
</script>
<title></title>
</head>
<body BACKGROUND="./image/bg.png">
	<center>
		<%
			ResvService resvService = new ResvService();

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String[][] resv_arr = new String[5][30];
		String kDayOfWeek = "";
		%>
		<table cellspacing=0>
			<tr>
				<td width=130 align=center>날짜</td>
				<td width=150 align=center>VIP룸</td>
				<td width=150 align=center>일반룸</td>
				<td width=150 align=center>합리적인룸</td>
			</tr>
		</table>
		<%
			for (int i = 0; i < 30; i++) {
			resv_arr[0][i] = sdf.format(cal.getTime());
			int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
			switch (dayOfWeek) {
				case 1 :
			kDayOfWeek = "일";
			break;
				case 2 :
			kDayOfWeek = "월";
			break;
				case 3 :
			kDayOfWeek = "화";
			break;
				case 4 :
			kDayOfWeek = "수";
			break;
				case 5 :
			kDayOfWeek = "목";
			break;
				case 6 :
			kDayOfWeek = "금";
			break;
				case 7 :
			kDayOfWeek = "토";
			break;
			}
			resv_arr[1][i] = kDayOfWeek;
			String resvName1 = resvService.selectOne(resv_arr[0][i], 1).get(0).getName();
			String resvName2 = resvService.selectOne(resv_arr[0][i], 2).get(0).getName();
			String resvName3 = resvService.selectOne(resv_arr[0][i], 3).get(0).getName();
		%>
		<form method=post id="form" action="./d_02.jsp">
		<input type="hidden" name="date">
			<input type="hidden" name="room">
			<table border=1 cellspacing=0>
				<tr>
					<td width=130 align=center> <%
 	if ("토".equals(kDayOfWeek) || "일".equals(kDayOfWeek)) {
 %> <font color="red"><%=resv_arr[0][i]%>(<%=kDayOfWeek%>)</font> <%
 	} else {
 %> <%=resv_arr[0][i]%>(<%=kDayOfWeek%>) <%
 	}
 %></td>
					<td width=150 align=center>
						<%
							if (resvName1 == null) {
						%> <a href="#" onclick="submit('<%=resv_arr[0][i]%>', 1)">예약가능</a> 
						<%
 	} else {
 %> <%=resvName1%> <%
 	}
 %>
					</td>
					<td width=150 align=center>
						<%
							if (resvName2 == null) {
						%> <a href="#" onclick="submit('<%=resv_arr[0][i]%>', 2)">예약가능</a> 
						<%
 	} else {
 %> <%=resvName2%> <%
 	}
 %>
					</td>
					<td width=150 align=center>
						<%
							if (resvName3 == null) {
						%> <a href="#" onclick="submit('<%=resv_arr[0][i]%>', 3)">예약가능</a>
						<%
							} else {
						%> <%=resvName3%> <%
 	}
 %>
					</td>
				</tr>
			</table>
		</form>
		<%
			cal.add(cal.DATE, +1);
			}
		%>
	</center>
</body>
</html>