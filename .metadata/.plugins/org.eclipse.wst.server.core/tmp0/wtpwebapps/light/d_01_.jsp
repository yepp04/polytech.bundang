<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.text.SimpleDateFormat, java.util.Date, java.util.Calendar"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<%
	// JSP Calendar:--
// Created by Jason Benassi
// jbenassi@lime-light.com
// http://www.wakeboardutah.com
// 7-2002
%>
<%
	// Global Vars
int action = 0; // incoming request for moving calendar up(1) down(0) for month
int currYear = 0; // if it is not retrieved from incoming URL (month=) then it is set to current year
int currMonth = 0; // same as year
int currYear2 = 0; // if it is not retrieved from incoming URL (month=) then it is set to current year
int currMonth2 = 0; // same as year
String boxSize = "130"; // how big to make the box for the calendar

//build 2 calendars

Calendar c = Calendar.getInstance();
Calendar cal = Calendar.getInstance();
Calendar ca = Calendar.getInstance();
Calendar ca2 = Calendar.getInstance();

if (request.getParameter("action") == null) // Check to see if we should set the year and month to the current
{
	currMonth = c.get(c.MONTH);
	currYear = c.get(c.YEAR);
	currMonth2 = c.get(c.MONTH);
	currYear2 = c.get(c.YEAR);
	cal.set(currYear, currMonth, 1);
	ca.set(currYear2, currMonth2, 1);
}

else {
	if (!(request.getParameter("action") == null)) // Hove the calendar up or down in this if block
	{
		currMonth = Integer.parseInt(request.getParameter("month"));
		currMonth2 = Integer.parseInt(request.getParameter("month"));
		currYear = Integer.parseInt(request.getParameter("year"));
		currYear2 = Integer.parseInt(request.getParameter("year"));

		if (Integer.parseInt(request.getParameter("action")) == 1) {
	cal.set(currYear, currMonth, 1);
	ca.set(currYear2, currMonth2, 1);
	cal.add(cal.MONTH, 1);
	ca.add(ca.MONTH, 1);
	currMonth = cal.get(cal.MONTH);
	currYear = cal.get(cal.YEAR);
	currMonth2 = ca.get(ca.MONTH);
	currYear2 = ca.get(ca.YEAR);
		} else {
	cal.set(currYear, currMonth, 1);
	ca.set(currYear2, currMonth2, 1);
	cal.add(cal.MONTH, -1);
	ca.add(ca.MONTH, -1);
	currMonth = cal.get(cal.MONTH);
	currYear = cal.get(cal.YEAR);
	currMonth2 = ca.get(ca.MONTH);
	currYear2 = ca.get(ca.YEAR);
		}
	}
}
%>

<%!public boolean isDate(int m, int d, int y) // This method is used to check for a VALID date
	{
		m -= 1;
		Calendar c = Calendar.getInstance();
		c.setLenient(false);

		try {
			c.set(y, m, d);
			Date dt = c.getTime();
		} catch (IllegalArgumentException e) {
			return false;

		}
		return true;
	}%>
<%!public String getDateName(int monthNumber) // This method is used to quickly return the proper name of a month
	{
		String strReturn = "";
		switch (monthNumber) {
			case 0 :
				strReturn = "January";
				break;
			case 1 :
				strReturn = "February";
				break;
			case 2 :
				strReturn = "March";
				break;
			case 3 :
				strReturn = "April";
				break;
			case 4 :
				strReturn = "May";
				break;
			case 5 :
				strReturn = "June";
				break;
			case 6 :
				strReturn = "July";
				break;
			case 7 :
				strReturn = "August";
				break;
			case 8 :
				strReturn = "September";
				break;
			case 9 :
				strReturn = "October";
				break;
			case 10 :
				strReturn = "November";
				break;
			case 11 :
				strReturn = "December";
				break;
		}
		return strReturn;
	}%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">
<!-- Place favicon.ico in the root directory -->
<style type="text/css">
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}
</style>
<script>
	function submit(val, room) {
		document.getElementsByName('date')[0].value = val;
		document.getElementsByName('room')[0].value = room;
		document.getElementById('form').submit();
	}
</script>
<!-- CSS here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/gijgo.css">
<link rel="stylesheet" href="assets/css/slicknav.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<link
	href="https://fonts.googleapis.com/css2?family=Cinzel&family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet">
</head>
<body BACKGROUND="./image/bg.png">

	<!-- Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<strong>Real Light</b>
				</div>
			</div>
		</div>
	</div>
	<!-- Preloader Start -->

	<table border='1' width='910' celpadding='0' cellspacing='0'
		align=center style="font-family: 'Noto Serif KR', serif;">
		<tr>
			<td width='172' align='right' valign='middle'><a
				href="d_01_.jsp?month=<%=currMonth%>&year=<%=currYear%>&action=0"><font
					size="2"><b>Previous Month</b></font></a></td>
			<td width='259' align='center' valign='middle'><b><%=getDateName(cal.get(cal.MONTH)) + " " + cal.get(cal.YEAR)%></b></td>
			<td width='170' align='left' valign='middle'><a
				href="d_01_.jsp?month=<%=currMonth%>&year=<%=currYear%>&action=1"><font
					size="2"><b>Next Month</b></font></a></td>
		</tr>
	</table>
	<form method=post id="form" action="./d_02.jsp"
		style="font-family: 'Noto Serif KR', serif;">
		<input type="hidden" name="date"> <input type="hidden"
			name="room">
		<table border="0" width="520" bordercolorlight="#C0C0C0"
			bordercolordark="#808080" style="border-collapse: collapse"
			bordercolor="#111111" cellpadding="0" cellspacing="0" align=center>
			<td width="100%">
				<table border="2" width="519" bordercolorlight="#C0C0C0"
					bordercolordark="#000000" style="border-collapse: collapse"
					bordercolor="#000000" cellpadding="0" cellspacing="0"
					bgcolor="#DFDCD8">
					<tr>
						<td width="<%=boxSize%>" align="center" nowrap
							bordercolor="#666666" bgcolor="#666666"><font color="red">Sun</font></td>
						<td width="<%=boxSize%>" align="center" nowrap
							bordercolor="#666666" bgcolor="#666666"><font
							color="#FFFFFF">Mon</font></td>
						<td width="<%=boxSize%>" align="center" nowrap
							bordercolor="#666666" bgcolor="#666666"><font
							color="#FFFFFF">Tues</font></td>
						<td width="<%=boxSize%>" align="center" nowrap
							bordercolor="#666666" bgcolor="#666666"><font
							color="#FFFFFF">Wed</font></td>
						<td width="<%=boxSize%>" align="center" nowrap
							bordercolor="#666666" bgcolor="#666666"><font
							color="#FFFFFF">Thurs</font></td>
						<td width="<%=boxSize%>" align="center" nowrap
							bordercolor="#666666" bgcolor="#666666"><font
							color="#FFFFFF">Fri</font></td>
						<td width="<%=boxSize%>" align="center" nowrap
							bordercolor="#666666" bgcolor="#666666"><font
							color="skyblue">Sat</font></td>
					</tr>
					<%
						//'Calendar loop
					ResvService resvService = new ResvService();
					int currDay;
					String todayColor;
					int count = 1;
					int dispDay = 1;
					int order = 0;
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String[][] resv_arr = new String[5][30];
					String resvName1 = "";
					String resvName2 = "";
					String resvName3 = "";

					for (int w = 1; w < 7; w++) {
					%>
					<tr>
						<%
							for (int d = 1; d < 8; d++) {

							if (!(count >= cal.get(c.DAY_OF_WEEK))) {
						%>
						<td width="<%=boxSize%>" height="<%=boxSize%>" valign="top"
							align="left">&nbsp;</td>
						<%
							count += 1;
						} else {
						if (isDate(currMonth + 1, dispDay, currYear)) // use the isDate method
						{
							if (dispDay == c.get(c.DAY_OF_MONTH) && c.get(c.MONTH) == cal.get(cal.MONTH) && c.get(c.YEAR) == cal.get(cal.YEAR)) // Here we check to see if the current day is today
							{
								todayColor = "#9ca1cd";
								order++;
							} else {
								todayColor = "#ffffff";
							}

							if (c.get(c.MONTH) == cal.get(cal.MONTH) && order > 0 && order < 31) {
						%>
						<td bgcolor="<%=todayColor%>" width="<%=boxSize%>" align="left"
							height="<%=boxSize%>" valign="top">
							<%
								if (d == 1) {
							%> <b style="color: red;"><%=dispDay%></b>
							<%
								} else if (d == 7) {
							%><b style="color: skyblue";><%=dispDay%></b> <%
 	} else {
 %> <b><%=dispDay%></b> <%
 	}
 %> <br> <br> <%
 	resv_arr[0][order - 1] = sdf.format(ca2.getTime());
 resvName1 = resvService.selectOne(resv_arr[0][order - 1], 1).get(0).getName();
 resvName2 = resvService.selectOne(resv_arr[0][order - 1], 2).get(0).getName();
 resvName3 = resvService.selectOne(resv_arr[0][order - 1], 3).get(0).getName();
 if (resvName1 == null) {
 %> <a href="#" onclick="submit('<%=resv_arr[0][order - 1]%>', 1)">&nbsp;VIP</a><br>
							<%
								} else {
							%> <font color="#a96800">&nbsp;<%=resvName1.replace(resvName1.substring(1, 2), "*")%></font><br>
							<%
								}

							if (resvName2 == null) {
							%> <a href="#" onclick="submit('<%=resv_arr[0][order - 1]%>', 2)">&nbsp;Normal</a><br>
							<%
								} else {
							%> <font color="#a96800">&nbsp;<%=resvName2.replace(resvName2.substring(1, 2), "*")%></font><br>
							<%
								}
							if (resvName3 == null) {
							%> <a href="#" onclick="submit('<%=resv_arr[0][order - 1]%>', 3)">&nbsp;Reasonable</a><br>
							<%
								} else {
							%> <font color="#a96800">&nbsp;<%=resvName3.replace(resvName3.substring(1, 2), "*")%></font><br>
							<%
								}
							order++;
							ca2.add(ca2.DATE, +1);
							} else if (c.get(c.MONTH) + 1 == cal.get(cal.MONTH)
									&& order < 30 - (c.getActualMaximum(c.DAY_OF_MONTH) - c.get(c.DAY_OF_MONTH) + 1)) {
							%>
						
						<td bgcolor="<%=todayColor%>" width="<%=boxSize%>" align="left"
							height="<%=boxSize%>" valign="top">
							<%
								if (d == 1) {
							%> <b style="color: red;"><%=dispDay%></b>
							<%
								} else if (d == 7) {
							%><b style="color: skyblue";><%=dispDay%></b> <%
 	} else {
 %> <b><%=dispDay%></b> <%
 	}
 %> <br> <br> <%
 	int order2 = order + (c.getActualMaximum(c.DAY_OF_MONTH) - c.get(c.DAY_OF_MONTH) + 1);
 resv_arr[0][order2] = sdf.format(ca.getTime());
 resvName1 = resvService.selectOne(resv_arr[0][order2], 1).get(0).getName();
 resvName2 = resvService.selectOne(resv_arr[0][order2], 2).get(0).getName();
 resvName3 = resvService.selectOne(resv_arr[0][order2], 3).get(0).getName();
 if (resvName1 == null) {
 %> <a href="#" onclick="submit('<%=resv_arr[0][order2]%>', 1)">&nbsp;VIP</a><br>
							<%
								} else {
							%> <font color="#a96800">&nbsp;<%=resvName1.replace(resvName1.substring(1, 2), "*")%></font><br>
							<%
								}
							if (resvName2 == null) {
							%> <a href="#" onclick="submit('<%=resv_arr[0][order2]%>', 1)">&nbsp;Normal</a><br>
							<%
								} else {
							%><font color="#a96800">&nbsp;<%=resvName2.replace(resvName2.substring(1, 2), "*")%></font><br>
							<%
								}
							if (resvName3 == null) {
							%> <a href="#" onclick="submit('<%=resv_arr[0][order2]%>', 1)">&nbsp;Reasonable</a><br>
							<%
								} else {
							%><font color="#a96800">&nbsp;<%=resvName1.replace(resvName1.substring(1, 2), "*")%></font><br>
							<%
								}
							%> <%
 	order++;
 ca.add(ca.DATE, +1);
 } else {
 %>
						
						<td bgcolor="<%=todayColor%>" width="<%=boxSize%>" align="left"
							height="<%=boxSize%>" valign="top">
							
														<%if (d == 1) {
								%> <b style="color:red;"><%=dispDay%></b><% 
							} else if (d == 7) {
								%><b style="color:skyblue";><%=dispDay%></b> <% 	
							} else {
								%> <b><%=dispDay%></b> <% 
							}
							%>
							
							
							<br>
							<%
								}
							count += 1;
							dispDay += 1;
							} else {
							%>
						<td width="<%=boxSize%>" align="left" height="<%=boxSize%>"
							valign="top">&nbsp;</td>
						<%
							}
						}

						}
						%>
					</tr>
					<%
						}
					%>
				</table>
				</form>
			</td>
		</table>

		<!-- JS here -->

		<!-- All JS Custom Plugins Link Here here -->
		<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>

		<!-- Jquery, Popper, Bootstrap -->
		<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
		<script src="./assets/js/popper.min.js"></script>
		<script src="./assets/js/bootstrap.min.js"></script>
		<!-- Jquery Mobile Menu -->
		<script src="./assets/js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
		<script src="./assets/js/owl.carousel.min.js"></script>
		<script src="./assets/js/slick.min.js"></script>
		<!-- Date Picker -->
		<script src="./assets/js/gijgo.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
		<script src="./assets/js/wow.min.js"></script>
		<script src="./assets/js/animated.headline.js"></script>

		<!-- Scrollup, nice-select, sticky -->
		<script src="./assets/js/jquery.scrollUp.min.js"></script>
		<script src="./assets/js/jquery.nice-select.min.js"></script>
		<script src="./assets/js/jquery.sticky.js"></script>
		<script src="./assets/js/jquery.magnific-popup.js"></script>

		<!-- contact js -->
		<script src="./assets/js/contact.js"></script>
		<script src="./assets/js/jquery.form.js"></script>
		<script src="./assets/js/jquery.validate.min.js"></script>
		<script src="./assets/js/mail-script.js"></script>
		<script src="./assets/js/jquery.ajaxchimp.min.js"></script>

		<!-- Jquery Plugins, main Jquery -->
		<script src="./assets/js/plugins.js"></script>
		<script src="./assets/js/main.js"></script>
</body>
</html>
