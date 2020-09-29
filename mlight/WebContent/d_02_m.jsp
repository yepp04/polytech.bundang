<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<%@ page
	import="java.text.SimpleDateFormat, java.util.Date, java.util.Calendar"%>
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
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- 부트스트랩 -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script src="./static/js/jquery-3.5.1.min.js"></script>
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
	<link href="https://fonts.googleapis.com/css2?family=Cinzel&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<title></title>
<script type="text/javascript">
$("#name").bind("keyup",function(){

	 var re = /[~!@\#$%^&*\()\=+_']/gi; 

	 var temp=$("#name").val();

	 if(re.test(temp)){ //특수문자가 포함되면 삭제하여 값으로 다시셋팅

	 $("#name").val(temp.replace(re,"")); } });
</script>

<script type="text/javascript">
	$(document).ready(function(){
		$(".error").hide();//기본적으로 error클래스는 숨긴다
		$("#submit").click( function(event){//add가 클릭했을 때
			var name   = $("#name").val();//name은 #name의 값
			var reg = /^[a-zA-Zㄱ-힣0-9]*$/;
			var reg2 = /^[a-zA-Zㄱ-힣]*$/;			
			var nameLen    = name.length;
			if(nameLen < 2){//글자수가 0이면
				$("#errMsg_01").show();
				$("#errMsg_01").text("이름은 2글자 이상 써주세요"); //출력
				event.preventDefault();
			} else if (!reg2.test(name)) {
				$("#errMsg_01").show();
				$("#errMsg_01").text("잘못된 이름"); //출력
				event.preventDefault();
			} else {//아니면
				$("#errMsg_01").hide();//숨김
			}
			
			var inname   = $("#inname").val();//name은 #name의 값
			var innameLen    = inname.length;
			if(innameLen < 1){//글자수가 0이면
				$("#errMsg_02").show();
				$("#errMsg_02").text("비어있음"); //출력
				event.preventDefault();
			} else if (!reg.test(inname)) {
				$("#errMsg_02").show();
				$("#errMsg_02").text("잘못된 이름"); //출력
				event.preventDefault();
				} else {//아니면
				$("#errMsg_02").hide();//숨김
			}
			
			var tel   = $("#tel").val();//name은 #name의 값
			var telreg = /^\d{2,3}-\d{3,4}-\d{4}$/;
			var telLen    = tel.length;
			if(telLen < 1){//글자수가 0이면
				$("#errMsg_03").show();
				$("#errMsg_03").text("비어있음"); //출력
				event.preventDefault();
			} else if (!telreg.test(tel)) {
				$("#errMsg_03").show();
				$("#errMsg_03").text("잘못된 입력"); //출력
				event.preventDefault();
				} else {//아니면
				$("#errMsg_03").hide();//숨김
			}
			
			var addr   = $("#addr").val();//name은 #name의 값
			var addrLen    = addr.length;
			if(addrLen < 1){//글자수가 0이면
				$("#errMsg_04").show();
				$("#errMsg_04").text("비어있음"); //출력
				event.preventDefault();
			} else if (!reg.test(addr)) {
				$("#errMsg_04").show();
				$("#errMsg_04").text("잘못된 입력"); //출력
				event.preventDefault();
				} else {//아니면
				$("#errMsg_04").hide();//숨김
			}
			
			var date   = $("#date").val();//name은 #name의 값
			var dateLen    = date.length;
			if(dateLen < 1){//글자수가 0이면
				$("#errMsg_05").show();
				$("#errMsg_05").text("비어있음"); //출력
				event.preventDefault();
				} else {//아니면
				$("#errMsg_05").hide();//숨김
			}
		});
	});
</script>
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


	<%
	Calendar c = Calendar.getInstance();
	Calendar cal = Calendar.getInstance();
	cal.add(cal.DATE, +29);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String now = sdf.format(c.getTime());
	String after = sdf.format(cal.getTime());
	
		request.setCharacterEncoding("utf-8");//인코딩	
	String date = request.getParameter("date");
	String sRoom = request.getParameter("room");
	
	int room = 0;
	if (sRoom != null) {
		room = Integer.parseInt(sRoom);
	}
	%>

	<center>
		<form method=post name=form action="./d_02_write.jsp" style="font-family: 'Cinzel', serif;">
			<table cellspacing=1 border=1>
				<tr>
					<td width=100 align=center>Name</td>
					<td width=350><input type="text" name="name" id="name" style="font-family: 'Noto Serif KR', serif; width:90px;"><span
						class="error" id="errMsg_01" style="font-size: 1em" style="font-family: 'Noto Serif KR', serif;"></span></td>
				</tr>
				<tr>
					<td width=100 align=center>Date</td>
					<td width=350>
						<%
							if (date != null) {
						%> <input type="text" value=<%=date%> name="date" width:100px; readonly>
						<%
							} else {
						%> <input type="date" name="date" id="date" min="<%=now%>" max="<%=after%>" style="font-family: 'Noto Serif KR', serif; width:100px;"><span
						class="error" id="errMsg_05" style="font-size: 1em" style="font-family: 'Noto Serif KR', serif;"></span> <%
 	}
 %>
					</td>
				</tr>
				<tr>
					<td width=100 align=center>Room</td>
					<td width=350>
						<%
							if (sRoom != null) {
							if (room == 1) {
						%> VIP<input type=hidden name="room" value=1> <%
 	} else if (room == 2) {
 %> Normal<input type=hidden name="room" value=2> <%
 	} else if (room == 3) {
 %> Reasonable<input type=hidden name="room" value=3> <%
 	}

 } else {
 %> <select name=room id=room>
							<option value=1>VIP
							<option value=2>Normal
							<option value=3>Reasonable
					</select> <%
 	}
 %>
					</td>
				</tr>
				<tr>
					<td width=100 align=center>Address</td>
					<td width=350><input type="text" name="addr" id="addr"
						style="width: 350px; font-family: 'Noto Serif KR', serif; width:90px;"><span class="error" id="errMsg_04"
						style="font-size: 1em"></span></td>
				</tr>
				<tr>
					<td width=100 align=center>Tel</td>
					<td width=350><input type="search" name="tel" id="tel" style="font-family: 'Noto Serif KR', serif; width:90px;">ex)
						010-0000-0000 <span class="error" id="errMsg_03"
						style="font-size: 1em; font-family: 'Noto Serif KR', serif;"></span></td>
				</tr>
				<tr>
					<td width=100 align=center>Depositor</td>
					<td width=350><input type="text" name="inname" id="inname" style="font-family: 'Noto Serif KR', serif; width:90px;"><span
						class="error" id="errMsg_02" style="font-size: 1em; font-family: 'Noto Serif KR', serif;"></span></td>
				</tr>
				<tr>
					<td width=100 align=center>Comment</td>
					<td width=350><input type="text" name="comment"
						style="width: 350px; font-family: 'Noto Serif KR', serif; width:90px;"></td>
				</tr>
				<tr>
					<td colspan=2 align=center><button type=submit class="btn btn-default"
						id=submit>Submit</button></td>
				</tr>
			</table>
		</form>
	</center>
	
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