<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");//인코딩

	int maxSize = 10 * 1024 * 1024; // 10메가 제한
	String savePath = application.getRealPath("./jspdb8/upload"); // 경로지정
	String format = "UTF-8"; // 인코딩
	byte[] buf = new byte[1024];
	MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format, new DefaultFileRenamePolicy());
	String filename = multi.getFilesystemName("filename");
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
	//파라미터 받아오기(파일 넣는 것 때문에 다 멀티로 받음)
	NoticeService2 service = new NoticeService2(); // 인스턴스 생성
	if (id != null) { // id값이 null이 아니면
		if (file == null) {
			Notice2 notice = new Notice2(Integer.parseInt(id), title, content, filename); // 인스턴스 생성
			service.update(notice); // 글 수정하기			
		} else {
			Notice2 notice = new Notice2(Integer.parseInt(id), title, content, file); // 인스턴스 생성
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
		if (file == null) {
			Notice2 notice = new Notice2(title, date, content, Integer.parseInt(rootid), Integer.parseInt(relevel),
			maxRecnt, 0, filename);
			service.create(notice); // 글쓰기			
		} else {
			Notice2 notice = new Notice2(title, date, content, Integer.parseInt(rootid), Integer.parseInt(relevel),
			maxRecnt, 0, file);
			service.create(notice); // 글쓰기
		}

	} else {
		title = title + "[New]";// 새로 쓴 글은 뉴가 붙음 
		Notice2 notice = new Notice2(title, date, content, 0, filename);//인스턴스 생성
		service.create(notice);// 글쓰기						
	}
	%>
	<script>
		location.href = 'gongji_list.jsp'; /* 리스트로 이동 */
	</script>
</body>
</html>