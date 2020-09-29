<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page
	import="java.text.SimpleDateFormat, java.util.Date, java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8;" />
<meta name="viewport" content="user-scalable=no, width=device-width" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<link href="https://fonts.googleapis.com/css2?family=Cinzel&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

		<!-- CSS here -->
            <link rel="stylesheet" href="assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
            <link rel="stylesheet" href="assets/css/gijgo.css">
            <link rel="stylesheet" href="assets/css/slicknav.css">
            <link rel="stylesheet" href="assets/css/animate.min.css">
            <link rel="stylesheet" href="assets/css/magnific-popup.css">
            <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="assets/css/themify-icons.css">
            <link rel="stylesheet" href="assets/css/slick.css">
            <link rel="stylesheet" href="assets/css/nice-select.css">
            <link rel="stylesheet" href="assets/css/style.css">
            <link rel="stylesheet" href="assets/css/responsive.css">

<script type="text/javascript">
	var orientationEvent;
	var uAgent = navigator.userAgent.toLowerCase();
	var mobilePhones = 'android';
	if (uAgent.indexOf(mobilePhones) != -1) {
		orientationEvent = "resize"; // 안드로이드는 resize로 들어옴	
	} else {
		orientationEvent = "orientationchange"; // 아이폰은 이렇게 들어옴
	}
	window.addEventListener(orientationEvent, function() {
		// alert("회전했어요");
		location.href('#');
	}, false);

	var prevScreen = 0;
	var sv_prevScreen = 0;
	
	function prevShow() {
		ScreenShow(prevScreen);
	}

	var muCnt = 5; // 서브메뉴
	var scCnt = 15; // 화면

	function fncShow(pos) {
		var i = 0;
		for (i = 0; i < scCnt; i++) {
			var obj = document.getElementById("s" + i);
			obj.style.display = 'none';
		}
		for (i = 0; i < muCnt; i++) {
			var obj = document.getElementById("menu" + i);
			var obj2 = document.getElementById("m" + i);

			if (i == pos) {
				obj.style.display = '';
				obj2.style.background = "#fff5f5";
			} else {
				obj.style.display = 'none';
				obj2.style.background = "#ffffff";
			}
		}
	}

	var scCnt = 15;
	var ScrObj;

	var timer1;

	function ScrAnimation() {
		var offset = -50;

		if (parseInt(ScrObj.style.left) > 10) {
			ScrObj.style.left = parseInt(ScrObj.style.left) + offset + "px";
			timer1 = setTimeout("ScrAnimation()", 1);
		} else {
			ScrObj.style.left = 5;
			clearTimeout(timer1);
		}
	}
	
	function ScreenShow(pos) {
		var i = 0;
		// 모든 메뉴 페이지는 막는다.
		for (i = 0; i < muCnt; i++) {
			var obj = document.getElementById("menu" + i);
			obj.style.display = 'none';
		}

		for (i = 0; i < scCnt; i++) {
			var obj = document.getElementById("s" + i);
			if (i == pos) {
				prevScreen = sv_prevScreen;
				sv_prevScreen = i;
				obj.style.display = '';
				//obj.style.position = "relative";
				obj.style.top = 35;
				obj.style.left = screen.width;
				obj.style.height = screen.height - 120;
				ScrObj = obj;
				ScrAnimation();
			} else {
				obj.style.display = 'none';
			}
		}
	}
</script>
<style type="text/css">
li {
	text-align: left;
	vertical-align: middle;
	margin: 2;
	padding: 10;
	height: 30;
	background-color: #aaaa00;
	border: 2px;
	solid: red;
	font-size: 30px;
}

ul {
	text-align: left;
	vertical-align: middle;
	margin: 2;
	padding: 10;
	height: 30;
	background-color: #bbaabb;
	border: 2px;
	solid: red;
	font-size: 30px;
}
</style>
<title>Welcome to Real Light Resort.</title>
</head>
<body BACKGROUND="./image/bg.png" onload='ScreenShow(0);' style="font-family: 'Cinzel', serif;">
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <strong>Real Light</b>
                </div>
            </div>
        </div>
    </div>
    
	<center>
		<div id="container"
			style="width: device-width; height: device-height;">
			<div id="header1"
				style="background-color: #ffffff; height: 60px; width: 15%; float: left;"
				onclick='prevShow();'>
				<center><img src="https://img.icons8.com/material/96/000000/back--v1.png" width=50px height=50px></center>
			</div>
			<div id="header2"
				style="background-color: #ffffff; height: 60px; width: 70%; float: left;" onclick='ScreenShow(0);'>
				<center style="margin: 10px">
					<img src="./image/reallightresort.png"
					width="100" height="40" border="0">
				</center>
			</div>
			<div id="header3"
				style="background-color: #ffffff; height: 60px; width: 15%; float: left;"
				onclick='ScreenShow(0);'>
				<center><img src="https://img.icons8.com/material-outlined/96/000000/home-page.png" width=40px height=40px></center>
			</div>

			<div id="menu0"
				style="background-color: #eeeeee; display: none; width: device-width;">
				<b>About</b>
				<li onclick='ScreenShow(0);'><b>Real Light</b></li>
				<li onclick='ScreenShow(1);'><b>VIP Room</b></li>
				<li onclick='ScreenShow(2);'><b>Normal Room</b></li>
				<li onclick='ScreenShow(3);'><b>Reasonable Room</b></li> <br>
			</div>
			<div id="menu1"
				style="background-color: #eeeeee; display: none; width: device-width;">
				<b>Contact</b>
				<li onclick='ScreenShow(4);'><b>Location</li>
				<li onclick='ScreenShow(5);'><b>By Public transport</li>
				<li onclick='ScreenShow(6);'><b>By Car</li> <br>
			</div>
			<div id="menu2"
				style="background-color: #eeeeee; display: none; width: device-width;">
				<b>Travel</b>
				<li onclick='ScreenShow(7);'><b style="font-family: 'Noto Serif KR', serif;">높아산</b></li>
				<li onclick='ScreenShow(8);'><b style="font-family: 'Noto Serif KR', serif;">조아해수욕장</b></li>
				<li onclick='ScreenShow(9);'><b style="font-family: 'Noto Serif KR', serif;">따끈온천</b></li> <br>
			</div>
			<div id="menu3"
				style="background-color: #eeeeee; display: none; width: device-width;">
				<b>Booking</b>
				<li onclick='ScreenShow(10);'><b>Reservation Status</b></li>
				<li onclick='ScreenShow(11);'><b>Reservation</b></li> <br>
			</div>
			<div id="menu4"
				style="background-color: #eeeeee; display: none; width: device-width;">
				<b>Notice</b>
				<li onclick='ScreenShow(12);'><b>Notice</b></li>
				<li onclick='ScreenShow(13);'><b>Review</b></li> <br>
			</div>

			<div id="s0"
				style="background-image: url(./image/bg.png); display: none; width: device-width;">
				<iframe src="main_m.jsp" frameborder="0" border="0"
					bordercolor="white" width=320px height=420px marginwidth="0"
					marginheight="0" scrolling="yes"></iframe></div>

			</div>
			<div id="s1"
				style="background-image: url(./image/bg.png); display: none; width: device-width;">
				<iframe src="a_01.html" frameborder="0" border="0"
					bordercolor="white" width=320px height=420px marginwidth="0"
					marginheight="0" scrolling="yes"></iframe></div>
			</div>
			<div id="s2"
				style="background-image: url(./image/bg.png); display: none; width: device-width;">
				<iframe src="a_02.html" frameborder="0" border="0"
					bordercolor="white" width=320px height=420px marginwidth="0"
					marginheight="0" scrolling="yes"></iframe></div>
			</div>
			<div id="s3"
				style="background-image: url(./image/bg.png); display: none; width: device-width;">
				<iframe src="a_03.html" frameborder="0" border="0"
					bordercolor="white" width=320px height=420px marginwidth="0"
					marginheight="0" scrolling="yes"></iframe></div>
			</div>
			<div id="s4"
				style="background-image: url(./image/bg.png); display: none;">
				<iframe src="b_01.html" frameborder="0" border="0"
					bordercolor="white" width=320px height=420px marginwidth="0"
					marginheight="0" scrolling="yes"></iframe></div>
			</div>
			<div id="s5"
				style="background-image: url(./image/bg.png); display: none;">
				<iframe src="b_02.html" frameborder="0" border="0"
					bordercolor="white" width=320px height=420px marginwidth="0"
					marginheight="0" scrolling="yes"></iframe></div>
			</div>
			<div id="s6"
				style="background-image: url(./image/bg.png); display: none;">
				<iframe src="b_03.html" frameborder="0" border="0"
					bordercolor="white" width=320px height=420px marginwidth="0"
					marginheight="0" scrolling="yes"></iframe></div>
			</div>
			<div id="s7"
				style="background-image: url(./image/bg.png); display: none;">
				<iframe src="c_01.html" frameborder="0" border="0"
					bordercolor="white" width=320px height=420px marginwidth="0"
					marginheight="0" scrolling="yes"></iframe></div>
			</div>
			<div id="s8"
				style="background-image: url(./image/bg.png); display: none;">
				<iframe src="c_02.html" frameborder="0" border="0"
					bordercolor="white" width=320px height=420px marginwidth="0"
					marginheight="0" scrolling="yes"></iframe></div>
			</div>
			<div id="s9"
				style="background-image: url(./image/bg.png); display: none;">
				<iframe src="c_03.html" frameborder="0" border="0"
					bordercolor="white" width=320px height=420px marginwidth="0"
					marginheight="0" scrolling="yes"></iframe></div>
			</div>
			<div id="s10"
				style="background-image: url(./image/bg.png); display: none;">
				<iframe src="d_01_m.jsp" frameborder="0" border="0"
					bordercolor="white" width=320px height=420px marginwidth="0"
					marginheight="0" scrolling="yes"></iframe>
			</div>
			<div id="s11"
				style="background-image: url(./image/bg.png); display: none;">
				<iframe src="d_02_m.jsp" frameborder="0" border="0"
					bordercolor="white" width=320px height=420px marginwidth="0"
					marginheight="0" scrolling="yes"></iframe>
			</div>
			<div id="s12"
				style="background-image: url(./image/bg.png); display: none;">
								<iframe src="gongji_list.jsp" frameborder="0" border="0"
					bordercolor="white" width=320px height=420px marginwidth="0"
					marginheight="0" scrolling="yes"></iframe></div>
			<div id="s13"
				style="background-image: url(./image/bg.png); display: none;">
								<iframe src="gongji_list2.jsp" frameborder="0" border="0"
					bordercolor="white" width=320px height=420px marginwidth="0"
					marginheight="0" scrolling="yes"></iframe></div>
			<div id="s14"
				style="background-image: url(./image/bg.png); display: none;">
				나 메뉴 4_3에 대한 화면</div>

			<div id="m0" onclick='fncShow(0);'
				style="position: absolute; bottom: 3px; position: absolute; left: 1%; background-color: #ffffff; height: 60px; width: 18%; float: left;">
				<center>
					<img src="https://img.icons8.com/dusk/64/000000/3-star-hotel.png" width=40px height=40px><br>
					<font size=2>About</font>
				</center>
			</div>
			<div id="m1" onclick='fncShow(1);'
				style="position: absolute; bottom: 3px; position: absolute; left: 21%; background-color: #ffffff; height: 60px; width: 18%; float: left;">
				<center>
					<img src="https://img.icons8.com/dusk/96/000000/worldwide-location.png" width=40px height=40px><br>
					<font size=2>Contact</font>
				</center>
			</div>
			<div id="m2" onclick='fncShow(2);'
				style="position: absolute; bottom: 3px; position: absolute; left: 41%; background-color: #ffffff; height: 60px; width: 18%; float: left;">
				<center>
					<img src="https://img.icons8.com/dusk/64/000000/passenger-with-baggage.png" width=40px height=40px><br>
					<font size=2>Travel</font>
				</center>
			</div>
			<div id="m3" onclick='fncShow(3);'
				style="position: absolute; bottom: 3px; position: absolute; left: 61%; background-color: #ffffff; height: 60px; width: 18%; float: left;">
				<center>
					<img src="https://img.icons8.com/dusk/64/000000/hotel-information.png" width=40px height=40px><br>
					<font size=2>Booking</font>
				</center>
			</div>
			<div id="m4" onclick='fncShow(4);'
				style="position: absolute; bottom: 3px; position: absolute; left: 81%; background-color: #ffffff; height: 60px; width: 18%; float: left;">
				<center>
					<img src="https://img.icons8.com/dusk/64/000000/survey.png" width=40px height=40px><br>
					<font size=2>Notice</font>
				</center>
			</div>
		</div>
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
        <script src="./assets/js/jquery.magnific-popup.js"></script>

		<!-- Scrollup, nice-select, sticky -->
        <script src="./assets/js/jquery.scrollUp.min.js"></script>
        <script src="./assets/js/jquery.nice-select.min.js"></script>
		<script src="./assets/js/jquery.sticky.js"></script>
        
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