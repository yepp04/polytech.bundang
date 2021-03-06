/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.37
 * Generated at: 2020-08-19 00:45:12 UTC
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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public final class gongji_005fwrite2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("com.oreilly.servlet.multipart.DefaultFileRenamePolicy");
    _jspx_imports_classes.add("com.oreilly.servlet.MultipartRequest");
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
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title></title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t");

		request.setCharacterEncoding("utf-8");//인코딩

	int maxSize = 10 * 1024 * 1024; // 10메가 제한
	String savePath = application.getRealPath("./upload"); // 경로지정
	String format = "UTF-8"; // 인코딩
	byte[] buf = new byte[1024];
	MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format, new DefaultFileRenamePolicy());
	String filename = multi.getFilesystemName("filename");
	String imagename = multi.getFilesystemName("imagename");
	// 파일 넣는 소스, 파일 이름 받아오기
	String id = multi.getParameter("id");
	String title = multi.getParameter("title");
	String date = multi.getParameter("date");
	String content = multi.getParameter("content");
	String rootid = multi.getParameter("rootid");
	String relevel = multi.getParameter("relevel");
	String recnt = multi.getParameter("recnt");
	String insert = multi.getParameter("insert");
	String file = multi.getParameter("file");
	String image = multi.getParameter("image");
	//파라미터 받아오기(파일 넣는 것 때문에 다 멀티로 받음)
	NoticeService4 service = new NoticeService4(); // 인스턴스 생성
	if (id != null) { // id값이 null이 아니면
		if (file == null && image == null) {
			Notice4 notice = new Notice4(Integer.parseInt(id), title, content, filename, imagename); // 인스턴스 생성
			service.update(notice); // 글 수정하기		
		} else if (file == null && image != null) {
			Notice4 notice = new Notice4(Integer.parseInt(id), title, content, filename, image); // 인스턴스 생성
			service.update(notice); // 글 수정하기
		} else if (file != null && image == null) {
			Notice4 notice = new Notice4(Integer.parseInt(id), title, content, file, imagename); // 인스턴스 생성
			service.update(notice); // 글 수정하기
		} else {
			Notice4 notice = new Notice4(Integer.parseInt(id), title, content, file, image); // 인스턴스 생성
			service.update(notice); // 글 수정하기						
		}

	} else if (relevel != null || recnt != null) {// id값이 null 이면
		if (insert.equals("INSERT")) { // 댓글입력 받아올 때
			title = ">[Re]" + title; // 댓글이라고 표시
			String bar = "";
			for (int i = 0; i < Integer.parseInt(relevel); i++) {
		bar = "-" + bar;// relevel에 따라서 바가 한개씩 늘어남
			}
			title = bar + title;
		}
		title = title + "[New]"; // 새로 쓴 글은 뉴가 붙음
		int maxRecnt = service.selectRecnt(Integer.parseInt(rootid)); // 최대 높은 recnt 구함
		if (Integer.parseInt(recnt) != maxRecnt) { // 만약에 지금 recnt가 최고로 높지 않으면
			service.updateRecnt(Integer.parseInt(rootid), Integer.parseInt(recnt)); // 지금 recnt보다 높은 애들 전부 1씩 올림 
			maxRecnt = Integer.parseInt(recnt) + 1; // 그리고 지금 파라미터로 받아온 recnt값을 1더함
		} else {//recnt가 최고로 높으면
			maxRecnt = maxRecnt + 1; // 최대 높은 recnt에서 1 더함
		}
		if (file == null && image == null) {
			Notice4 notice = new Notice4(title, date, content, Integer.parseInt(rootid), Integer.parseInt(relevel),
			maxRecnt, 0, filename, imagename);
			service.create(notice); // 글쓰기	
		} else if (file == null && image != null) {
			Notice4 notice = new Notice4(title, date, content, Integer.parseInt(rootid), Integer.parseInt(relevel),
			maxRecnt, 0, filename, image);
			service.create(notice); // 글쓰기
		} else if (file != null && image == null) {
			Notice4 notice = new Notice4(title, date, content, Integer.parseInt(rootid), Integer.parseInt(relevel),
			maxRecnt, 0, file, imagename);
			service.create(notice); // 글쓰기	
		} else {
			Notice4 notice = new Notice4(title, date, content, Integer.parseInt(rootid), Integer.parseInt(relevel),
			maxRecnt, 0, file, image);
			service.create(notice); // 글쓰기
		}

	} else {
		title = title + "[New]";// 새로 쓴 글은 뉴가 붙음 
		Notice4 notice = new Notice4(title, date, content, 0, filename, imagename);//인스턴스 생성
		service.create(notice);// 글쓰기						
	}
	
      out.write("\r\n");
      out.write("\t<script>\r\n");
      out.write("\t\tlocation.href = 'gongji_list2.jsp'; /* 리스트로 이동 */\r\n");
      out.write("\t</script>\r\n");
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
