/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.37
 * Generated at: 2020-08-20 02:25:00 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.sql.*;
import java.io.*;
import service.*;
import domain.*;
import java.util.List;

public final class gongji_005fview_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("java.io");
    _jspx_imports_packages.add("service");
    _jspx_imports_packages.add("domain");
    _jspx_imports_packages.add("javax.sql");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.List");
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

String loginOK = null;
loginOK = (String)session.getAttribute("login_ok"); //login_ok의 세션을 받아온다

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("<meta name=\"viewport\" content=\"user-scalable=no, width=device-width\" />\r\n");
      out.write("<meta name=\"apple-mobile-web-app-capable\" content=\"yes\" />\r\n");
      out.write("<meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\" />\r\n");
      out.write("<meta http-equiv=\"Cache-Control\" content=\"no-cache\" />\r\n");
      out.write("<meta http-equiv=\"Expires\" content=\"0\" />\r\n");
      out.write("<meta http-equiv=\"Pragma\" content=\"no-cache\" />\r\n");
      out.write("<script\r\n");
      out.write("\tsrc=\"http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js\"></script>\r\n");
      out.write("<!-- 부트스트랩 -->\r\n");
      out.write("<link\r\n");
      out.write("\thref=\"http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css\"\r\n");
      out.write("\trel=\"stylesheet\">\r\n");
      out.write("\t<link href=\"https://fonts.googleapis.com/css2?family=Cinzel&family=Noto+Serif+KR:wght@200&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("<title></title>\r\n");
      out.write("</head>\r\n");
      out.write("<body BACKGROUND=\"./image/bg.png\">\r\n");
      out.write("<center>\r\n");
      out.write("\t\t<h2 style=\"font-family: 'Cinzel', serif;\">Notice</h2>\r\n");
      out.write("\t");

	request.setCharacterEncoding("utf-8");//인코딩
	String id = request.getParameter("key"); // 파라미터 받아오기
		NoticeService3 service = new NoticeService3(); // 인스턴스 생성
	
      out.write("\r\n");
      out.write("\t<form method=post name='fm'>\r\n");
      out.write("\t\t<table class=\"table table-bordered\" style=\"width:320px;\"border=1 cellspacing=0 cellpadding=5>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td><b>번호</b></td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(service.selectOne(Integer.parseInt(id)).get(0).getId());
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td><b>제목</b></td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(service.selectOne(Integer.parseInt(id)).get(0).getTitle());
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td><b>일자</b></td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(service.selectOne(Integer.parseInt(id)).get(0).getDate());
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td><b>내용</b></td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(service.selectOne(Integer.parseInt(id)).get(0).getContent());
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t<table width=320>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td width=320></td>\r\n");
      out.write("\t\t\t\t<td><button type=button class=\"btn btn-default\"\r\n");
      out.write("\t\t\t\t\tOnClick=\"location.href='gongji_list.jsp'\">목록</button></td>\r\n");
      out.write("\t\t\t\t\t");
if (loginOK != null) {
						
      out.write("\r\n");
      out.write("\t\t\t\t<td><button type=button class=\"btn btn-default\"\r\n");
      out.write("\t\t\t\t\tOnClick=\"location.href='gongji_update.jsp?key=");
      out.print(id);
      out.write("'\">수정</button></td><!-- id를 get으로 보냄 -->\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t");

					}
					
      out.write("\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</form>\r\n");
      out.write("\t</center>\r\n");
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
