<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page
	import="java.text.SimpleDateFormat, java.util.Date, java.util.Calendar"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Hotel</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">
<link
	href="https://fonts.googleapis.com/css2?family=Cinzel&family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet">
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
<title>Welcome to Real Light Resort.</title>
</head>
<body BACKGROUND="./image/bg.png">
	<!-- slider Area Start-->
	<div class="slider-area ">
		<!-- Mobile Menu -->
		<div class="slider-active dot-style">
			<div
				class="single-slider  hero-overly slider-height d-flex align-items-center"
				data-background="assets/img/hero/h1_hero.jpg">
				<div class="container">
					<div class="row justify-content-center text-center">
						<div class="col-xl-9">
							<div class="h1-slider-caption">
								<h1 data-animation="fadeInUp" data-delay=".4s">
									Real Light<br>in the city
								</h1>
								<h3 data-animation="fadeInDown" data-delay=".4s">Hotel &
									Resort</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div
				class="single-slider  hero-overly slider-height d-flex align-items-center"
				data-background="./image/3.jpg">
				<div class="container">
					<div class="row justify-content-center text-center">
						<div class="col-xl-9">
							<div class="h1-slider-caption">
								<h1 data-animation="fadeInUp" data-delay=".4s">
									Real Light<br>in the city
								</h1>
								<h3 data-animation="fadeInDown" data-delay=".4s">Hotel &
									Resort</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div
				class="single-slider  hero-overly slider-height d-flex align-items-center"
				data-background="assets/img/hero/h1_hero.jpg">
				<div class="container">
					<div class="row justify-content-center text-center">
						<div class="col-xl-9">
							<div class="h1-slider-caption">
								<h1 data-animation="fadeInUp" data-delay=".4s">
									Real Light<br>in the city
								</h1>
								<h3 data-animation="fadeInDown" data-delay=".4s">Hotel &
									Resort</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- slider Area End-->


	<%
		Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
	String myTime = URLEncoder.encode(sdf.format(cal.getTime()), "UTF-8"); //쿠키에 저장할 값
	String myTime2 = sdf.format(cal.getTime()); //쿠키에 저장할 값

	Cookie[] cookies = request.getCookies(); // 쿠키들 모두 얻기, 배열값으로
	if (cookies != null) {

		for (int i = 0; i < cookies.length; i++) { // 배열길이만큼 for문 돌림
			Cookie thisCookie = cookies[i]; // 배열1개의 이름
			if ("time".equals(thisCookie.getName())) { // thisCookie가 name이라는 id이면
	%><span style="font-family: 'Noto Serif KR', serif; font-size: 0.5em;">최근
		방문일은 <%=URLDecoder.decode(thisCookie.getValue(), "UTF-8")%> 입니다.<br>
		<%
			// 그 id의 값을 출력
		}
		}
		} else {
		%><span style="font-family: 'Noto Serif KR', serif; font-size: 0.5em;">최근
			방문일은 (<%=myTime2%>) 입니다.
	</span><br>
		<%
			}
		%> <%
 	cookies = request.getCookies(); // 쿠키들 얻기
 if (cookies != null) {

 	for (int i = 0; i < cookies.length; i++) { // 배열길이만큼 for문 돌림
 		Cookie thisCookie = cookies[i]; // 쿠키 1개 이름 설정
 		if ("time".equals(thisCookie.getName())) { // id가 name인 쿠키가 있으면
 	thisCookie.setMaxAge(0); // 유효기간 0으로 설정 -> 지워짐
 	response.addCookie(thisCookie); // 쿠키를 세팅
 		}
 	}
 }
 %> <%
 	Cookie cookieName = new Cookie("time", myTime); // "name"이라는 id로 myName값 저장
 cookieName.setMaxAge(-1); // 브라우저 켜있을 때까지 저장
 response.addCookie(cookieName); // response 객체에 보내야 사용가능
 %> <!-- JS here --> <!-- All JS Custom Plugins Link Here here --> <script
			src="./assets/js/vendor/modernizr-3.5.0.min.js"></script> <!-- Jquery, Popper, Bootstrap -->
		<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script> <script
			src="./assets/js/popper.min.js"></script> <script
			src="./assets/js/bootstrap.min.js"></script> <!-- Jquery Mobile Menu -->
		<script src="./assets/js/jquery.slicknav.min.js"></script> <!-- Jquery Slick , Owl-Carousel Plugins -->
		<script src="./assets/js/owl.carousel.min.js"></script> <script
			src="./assets/js/slick.min.js"></script> <!-- Date Picker --> <script
			src="./assets/js/gijgo.min.js"></script> <!-- One Page, Animated-HeadLin -->
		<script src="./assets/js/wow.min.js"></script> <script
			src="./assets/js/animated.headline.js"></script> <script
			src="./assets/js/jquery.magnific-popup.js"></script> <!-- Scrollup, nice-select, sticky -->
		<script src="./assets/js/jquery.scrollUp.min.js"></script> <script
			src="./assets/js/jquery.nice-select.min.js"></script> <script
			src="./assets/js/jquery.sticky.js"></script> <!-- contact js --> <script
			src="./assets/js/contact.js"></script> <script
			src="./assets/js/jquery.form.js"></script> <script
			src="./assets/js/jquery.validate.min.js"></script> <script
			src="./assets/js/mail-script.js"></script> <script
			src="./assets/js/jquery.ajaxchimp.min.js"></script> <!-- Jquery Plugins, main Jquery -->
		<script src="./assets/js/plugins.js"></script> <script
			src="./assets/js/main.js"></script>
</body>
</html>