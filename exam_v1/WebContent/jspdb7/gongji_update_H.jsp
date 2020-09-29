<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function submitForm(mode) {/* 쓰기 누르면 쓰기창으로 */
		if (mode == "write") {
			fm.action = "gongji_write.jsp";
		} else if (mode == "delete") {/* 삭제 누르면 삭제창으로 */
			fm.action = "gongji_delete.jsp"
		}
		fm.submit();
	}
</script>
<title></title>
</head>
<body>
	<form method=post name='fm'>
		<table width=650 border=1 cellspacing=0 cellpadding=5>
			<tr>
				<td><b>번호</b></td>
				<td><input type=text name=id size=70 maxlength=70 value=1
					readonly></td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><input type=text name=title size=70 maxlength=70
					value="공지사항1" readonly></td>
			</tr>
			<tr>
				<td><b>일자</b></td>
				<td>2018-01-14</td>
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td><textarea style="width: 500px; height: 250px;" name=content
						cols=70 row=600>공지사항내용1</textarea></td>
			</tr>
		</table>
		<table width=650>
			<tr>
				<td width=600></td>
				<td><input type=button value="취소"
					OnClick="location.href='gongji_list_H.jsp'"></td><!-- 취소창으로 -->
				<td><input type=button value="쓰기" OnClick="submitForm('write')"></td>
				<td><input type=button value="삭제"
					OnClick="submitForm('delete')"></td>
			</tr>
		</table>
	</form>
</body>
</html>
