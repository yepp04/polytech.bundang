/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.37
 * Generated at: 2020-08-20 06:55:17 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.URLEncoder;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;

public final class main_005fm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.net.URLEncoder");
    _jspx_imports_classes.add("java.util.Calendar");
    _jspx_imports_classes.add("java.net.URLDecoder");
    _jspx_imports_classes.add("java.util.Date");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html class=\"no-js\" lang=\"zxx\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\r\n");
      out.write("<title>Hotel</title>\r\n");
      out.write("<meta name=\"description\" content=\"\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("\r\n");
      out.write("<link rel=\"manifest\" href=\"site.webmanifest\">\r\n");
      out.write("<link rel=\"shortcut icon\" type=\"image/x-icon\"\r\n");
      out.write("\thref=\"assets/img/favicon.ico\">\r\n");
      out.write("<link\r\n");
      out.write("\thref=\"https://fonts.googleapis.com/css2?family=Cinzel&family=Noto+Serif+KR:wght@200&display=swap\"\r\n");
      out.write("\trel=\"stylesheet\">\r\n");
      out.write("<!-- CSS here -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/bootstrap.min.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/owl.carousel.min.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/gijgo.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/slicknav.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/animate.min.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/magnific-popup.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/fontawesome-all.min.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/themify-icons.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/slick.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/nice-select.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/style.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/responsive.css\">\r\n");
      out.write("<title>Welcome to Real Light Resort.</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body BACKGROUND=\"./image/bg.png\">\r\n");
      out.write("\t<!-- slider Area Start-->\r\n");
      out.write("\t<div class=\"slider-area \">\r\n");
      out.write("\t\t<!-- Mobile Menu -->\r\n");
      out.write("\t\t<div class=\"slider-active dot-style\">\r\n");
      out.write("\t\t\t<div\r\n");
      out.write("\t\t\t\tclass=\"single-slider  hero-overly slider-height d-flex align-items-center\"\r\n");
      out.write("\t\t\t\tdata-background=\"assets/img/hero/h1_hero.jpg\">\r\n");
      out.write("\t\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t\t<div class=\"row justify-content-center text-center\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-xl-9\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"h1-slider-caption\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<h1 data-animation=\"fadeInUp\" data-delay=\".4s\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\tReal Light<br>in the city\r\n");
      out.write("\t\t\t\t\t\t\t\t</h1>\r\n");
      out.write("\t\t\t\t\t\t\t\t<h3 data-animation=\"fadeInDown\" data-delay=\".4s\">Hotel &\r\n");
      out.write("\t\t\t\t\t\t\t\t\tResort</h3>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div\r\n");
      out.write("\t\t\t\tclass=\"single-slider  hero-overly slider-height d-flex align-items-center\"\r\n");
      out.write("\t\t\t\tdata-background=\"./image/3.jpg\">\r\n");
      out.write("\t\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t\t<div class=\"row justify-content-center text-center\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-xl-9\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"h1-slider-caption\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<h1 data-animation=\"fadeInUp\" data-delay=\".4s\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\tReal Light<br>in the city\r\n");
      out.write("\t\t\t\t\t\t\t\t</h1>\r\n");
      out.write("\t\t\t\t\t\t\t\t<h3 data-animation=\"fadeInDown\" data-delay=\".4s\">Hotel &\r\n");
      out.write("\t\t\t\t\t\t\t\t\tResort</h3>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div\r\n");
      out.write("\t\t\t\tclass=\"single-slider  hero-overly slider-height d-flex align-items-center\"\r\n");
      out.write("\t\t\t\tdata-background=\"assets/img/hero/h1_hero.jpg\">\r\n");
      out.write("\t\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t\t<div class=\"row justify-content-center text-center\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-xl-9\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"h1-slider-caption\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<h1 data-animation=\"fadeInUp\" data-delay=\".4s\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\tReal Light<br>in the city\r\n");
      out.write("\t\t\t\t\t\t\t\t</h1>\r\n");
      out.write("\t\t\t\t\t\t\t\t<h3 data-animation=\"fadeInDown\" data-delay=\".4s\">Hotel &\r\n");
      out.write("\t\t\t\t\t\t\t\t\tResort</h3>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- slider Area End-->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t");

		Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
	String myTime = URLEncoder.encode(sdf.format(cal.getTime()), "UTF-8"); //쿠키에 저장할 값
	String myTime2 = sdf.format(cal.getTime()); //쿠키에 저장할 값

	Cookie[] cookies = request.getCookies(); // 쿠키들 모두 얻기, 배열값으로
	if (cookies != null) {

		for (int i = 0; i < cookies.length; i++) { // 배열길이만큼 for문 돌림
			Cookie thisCookie = cookies[i]; // 배열1개의 이름
			if ("time".equals(thisCookie.getName())) { // thisCookie가 name이라는 id이면
	
      out.write("<span style=\"font-family: 'Noto Serif KR', serif; font-size: 0.5em;\">최근\r\n");
      out.write("\t\t방문일은 ");
      out.print(URLDecoder.decode(thisCookie.getValue(), "UTF-8"));
      out.write(" 입니다.<br>\r\n");
      out.write("\t\t");

			// 그 id의 값을 출력
		}
		}
		} else {
		
      out.write("<span style=\"font-family: 'Noto Serif KR', serif; font-size: 0.5em;\">최근\r\n");
      out.write("\t\t\t방문일은 (");
      out.print(myTime2);
      out.write(") 입니다.\r\n");
      out.write("\t</span><br>\r\n");
      out.write("\t\t");

			}
		
      out.write(' ');

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
 
      out.write(' ');

 	Cookie cookieName = new Cookie("time", myTime); // "name"이라는 id로 myName값 저장
 cookieName.setMaxAge(-1); // 브라우저 켜있을 때까지 저장
 response.addCookie(cookieName); // response 객체에 보내야 사용가능
 
      out.write(" <!-- JS here --> <!-- All JS Custom Plugins Link Here here --> <script\r\n");
      out.write("\t\t\tsrc=\"./assets/js/vendor/modernizr-3.5.0.min.js\"></script> <!-- Jquery, Popper, Bootstrap -->\r\n");
      out.write("\t\t<script src=\"./assets/js/vendor/jquery-1.12.4.min.js\"></script> <script\r\n");
      out.write("\t\t\tsrc=\"./assets/js/popper.min.js\"></script> <script\r\n");
      out.write("\t\t\tsrc=\"./assets/js/bootstrap.min.js\"></script> <!-- Jquery Mobile Menu -->\r\n");
      out.write("\t\t<script src=\"./assets/js/jquery.slicknav.min.js\"></script> <!-- Jquery Slick , Owl-Carousel Plugins -->\r\n");
      out.write("\t\t<script src=\"./assets/js/owl.carousel.min.js\"></script> <script\r\n");
      out.write("\t\t\tsrc=\"./assets/js/slick.min.js\"></script> <!-- Date Picker --> <script\r\n");
      out.write("\t\t\tsrc=\"./assets/js/gijgo.min.js\"></script> <!-- One Page, Animated-HeadLin -->\r\n");
      out.write("\t\t<script src=\"./assets/js/wow.min.js\"></script> <script\r\n");
      out.write("\t\t\tsrc=\"./assets/js/animated.headline.js\"></script> <script\r\n");
      out.write("\t\t\tsrc=\"./assets/js/jquery.magnific-popup.js\"></script> <!-- Scrollup, nice-select, sticky -->\r\n");
      out.write("\t\t<script src=\"./assets/js/jquery.scrollUp.min.js\"></script> <script\r\n");
      out.write("\t\t\tsrc=\"./assets/js/jquery.nice-select.min.js\"></script> <script\r\n");
      out.write("\t\t\tsrc=\"./assets/js/jquery.sticky.js\"></script> <!-- contact js --> <script\r\n");
      out.write("\t\t\tsrc=\"./assets/js/contact.js\"></script> <script\r\n");
      out.write("\t\t\tsrc=\"./assets/js/jquery.form.js\"></script> <script\r\n");
      out.write("\t\t\tsrc=\"./assets/js/jquery.validate.min.js\"></script> <script\r\n");
      out.write("\t\t\tsrc=\"./assets/js/mail-script.js\"></script> <script\r\n");
      out.write("\t\t\tsrc=\"./assets/js/jquery.ajaxchimp.min.js\"></script> <!-- Jquery Plugins, main Jquery -->\r\n");
      out.write("\t\t<script src=\"./assets/js/plugins.js\"></script> <script\r\n");
      out.write("\t\t\tsrc=\"./assets/js/main.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
