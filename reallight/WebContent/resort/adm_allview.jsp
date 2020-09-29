<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.text.SimpleDateFormat, java.util.Date, java.util.Calendar"%>
<%@ page import="service.*,domain.*,java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<%
	//////세션을 체크해서 없다면 로그인창으로 보낸다. 그리고 로그인이 되면 자기 자신에게 와야 하므로
////// 자기 자신의 url을 써줘야 한다 login_test.jsp
String loginOK = null;
String jumpURL = "adm_login.jsp?jump=adm_allview.jsp";

loginOK = (String)session.getAttribute("login_ok"); //login_ok의 세션을 받아온다
if (loginOK == null) { // loginOK가 null이면
	response.sendRedirect(jumpURL); // 로그인 페이지로 돌아간다
	return;
}
if (!loginOK.equals("yes")) { // loginOK가 yes가 아니면
	response.sendRedirect(jumpURL); // 로그인 페이지로 돌아간다
	return;
}
%>
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
		<form method=post id="form" action="./adm_oneview.jsp">
		<input type="hidden" name="date">
			<input type="hidden" name="room">
			<input type="hidden" name="writeDate" value=<%=sdf.format(cal.getTime())%>>
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
						%> <a href="#" style="color: hotpink" onclick="submit('<%=resv_arr[0][i]%>', 1)">예약가능</a> 
						<%
 	} else {
 %> <a href="#" onclick="submit('<%=resv_arr[0][i]%>', 1)"><%=resvName1%></a> <%
 	}
 %>
					</td>
					<td width=150 align=center>
						<%
							if (resvName2 == null) {
						%> <a href="#" style="color: hotpink" onclick="submit('<%=resv_arr[0][i]%>', 2)">예약가능</a> 
						<%
 	} else {
 %> <a href="#" onclick="submit('<%=resv_arr[0][i]%>', 2)"><%=resvName2%></a> <%
 	}
 %>
					</td>
					<td width=150 align=center>
						<%
							if (resvName3 == null) {
						%> <a href="#" style="color: hotpink" onclick="submit('<%=resv_arr[0][i]%>', 3)">예약가능</a>
						<%
							} else {
						%> <a href="#" onclick="submit('<%=resv_arr[0][i]%>', 3)"><%=resvName3%></a> <%
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