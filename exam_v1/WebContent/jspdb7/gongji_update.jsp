<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function submitForm(mode) {/* 쓰기누르면 쓰기창, 삭제 누르면 삭제창 */
		if (mode == "write") {
			fm.action = "gongji_write.jsp";
		} else if (mode == "delete") {
			fm.action = "gongji_delete.jsp"
		}
		fm.submit();
	}
</script>
<title></title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");//인코딩
	String id = request.getParameter("key");
	// 파라미터 받아오기
		NoticeService service = new NoticeService(); // 인스턴스 생성
	%>
	<form method=post name='fm'>
		<table width=650 border=1 cellspacing=0 cellpadding=5>
			<tr>
				<td><b>번호</b></td>
				<td><input type=text name=id size=70 maxlength=70 value=<%=service.selectOne(Integer.parseInt(id)).get(0).getId()%>
					readonly></td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><input type=text name=title size=70 maxlength=70
					value='<%=service.selectOne(Integer.parseInt(id)).get(0).getTitle()%>'></td>
			</tr>
			<tr>
				<td><b>일자</b></td>
				<td><%=service.selectOne(Integer.parseInt(id)).get(0).getDate()%></td>
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td><textarea style="width: 500px; height: 250px;" name=content
						cols=70 row=600><%=service.selectOne(Integer.parseInt(id)).get(0).getContent()%></textarea></td>
			</tr>
		</table>
		<table width=650>
			<tr>
				<td width=600></td>
				<td><input type=button value="취소"
					OnClick="location.href='gongji_list.jsp'"></td>
				<td><input type=button value="쓰기" OnClick="submitForm('write')"></td>
				<td><input type=button value="삭제"
					OnClick="submitForm('delete')"></td>
			</tr>
		</table>
	</form>
</body>
</html>
