<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="../static/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".error").hide();//기본적으로 error클래스는 숨긴다
		$("#modify").click( function(event){//modify가 클릭했을 때
			var name   = $("#name").val();//name은 #name의 값
			var nameLen    = name.length;
			if(nameLen < 1){//글자수가 0이면
				$("#errMsg_01").show();
				$("#errMsg_01").text("비어있음"); //출력
				event.preventDefault();
			}
			else{//아니면
				$("#errMsg_01").hide();//숨김
			}
			// 국어
			var kor  = $("#kor").val();
			var korLen   = kor.length;
			var c;
			var flag = 0;
			var nKor = 0;
			if(korLen < 1){
				$("#errMsg_02").show();
				$("#errMsg_02").text("비어있음");
				event.preventDefault();
			}
			else{
				$("#errMsg_02").hide();
			}
			for(var i=0; i < korLen; i++){
				c = kor.charAt(i).charCodeAt(0); // c는 글자의 숫자값
				if( c < 48 || c > 57 ){ // 이 범위는 문자를 나타냄
					$("#errMsg_02").show();
					$("#errMsg_02").text("숫자만 입력");
					event.preventDefault();
					flag = 1; // 문자일 때 flag를 1로 바꿈
					break;
				}
				else{
					$("#errMsg_02").hide();
				}
			}
			if( flag == 0 ){// 문자가 아닐 때
				nKor = parseInt( kor );
				if( nKor < -1 || nKor > 100 ){ // 숫자 범위
					$("#errMsg_02").show();
					$("#errMsg_02").text("0 ~ 100");
					event.preventDefault()
				}
			}
			//영어
			var eng  = $("#eng").val();
			var engLen   = eng.length;
			var c;
			var flag = 0;
			var nEng = 0;
			if(engLen < 1){
				$("#errMsg_03").show();
				$("#errMsg_03").text("비어있음");
				event.preventDefault();
			}
			else{
				$("#errMsg_03").hide();
			}
			for(var i=0; i < engLen; i++){
				c = eng.charAt(i).charCodeAt(0);// c는 글자의 숫자값
				if( c < 48 || c > 57 ){// 이 범위는 문자를 나타냄
					$("#errMsg_03").show();
					$("#errMsg_03").text("숫자만 입력");
					event.preventDefault();
					flag = 1;// 문자일 때 flag를 1로 바꿈
					break;
				}
				else{
					$("#errMsg_03").hide();
				}
			}
			if( flag == 0 ){// 문자가 아닐 때
				nEng = parseInt( eng );
				if( nEng < -1 || nEng > 100 ){// 숫자 범위
					$("#errMsg_03").show();
					$("#errMsg_03").text("0 ~ 100");
					event.preventDefault()
				}
			}
			//수학
			var mat  = $("#mat").val();
			var matLen   = mat.length;
			var c;
			var flag = 0;
			var nMat = 0;
			if(matLen < 1){
				$("#errMsg_04").show();
				$("#errMsg_04").text("비어있음");
				event.preventDefault();
			}
			else{
				$("#errMsg_04").hide();
			}
			for(var i=0; i < matLen; i++){
				c = mat.charAt(i).charCodeAt(0);// c는 글자의 숫자값
				if( c < 48 || c > 57 ){// 이 범위는 문자를 나타냄
					$("#errMsg_04").show();
					$("#errMsg_04").text("숫자만 입력");
					event.preventDefault();
					flag = 1;// 문자일 때 flag를 1로 바꿈
					break;
				}
				else{
					$("#errMsg_04").hide();
				}
			}
			if( flag == 0 ){// 문자가 아닐 때
				nMat = parseInt( mat );
				if( nMat < -1 || nMat > 100 ){// 숫자 범위
					$("#errMsg_04").show();
					$("#errMsg_04").text("0 ~ 100");
					event.preventDefault()
				}
			}
		} );
	});
</script>
<style>
.error {
	color: red;
}
</style>
</head>
<body>
	<h1>성적 조회후 정정/삭제</h1>
	<%
		String id = request.getParameter("search");
	StudentService studentService = new StudentService();
	%>
	<form method="post" action="showREC.jsp">
		<p>
			&nbsp;&nbsp;조회할 학번&nbsp;&nbsp;&nbsp; <input type="search"
				name="search"> &nbsp;&nbsp;&nbsp;<input type="submit"
				value="조회">
		</p>

		<%
			try {

			if (Integer.parseInt(id) == studentService.selectOne(Integer.parseInt(id)).get(0).getStudentId()) {
				// 만약 파라미터 id값과 id를 검색해서 나온 값이 같다면
		%>
		<form method="post" name="form">
			<table border=1 cellspacing=0>
				<tr align=center>
					<td width=100>이름</td>
					<td width=400><input type="search"
						value=<%=studentService.selectOne(Integer.parseInt(id)).get(0).getName()%>
						name="name" id="name"> <!--id로 검색한 이름 값--> <span
						class="error" id="errMsg_01" style="font-size: 0.5em"></span></td>
				</tr>
				<tr align=center>
					<td width=100>학번</td>
					<td width=400><input type="search"
						value=<%=studentService.selectOne(Integer.parseInt(id)).get(0).getStudentId()%>
						name="id" readonly></td>
					<!--id로 검색한 id 값-->
				</tr>
				<tr align=center>
					<td width=100>국어</td>
					<td width=400><input type="text"
						value=<%=studentService.selectOne(Integer.parseInt(id)).get(0).getKor()%>
						name="kor" id="kor"> <!--id로 검색한 성적 값--> <span
						class="error" id="errMsg_02" style="font-size: 0.5em"></span></td>
				</tr>
				<tr align=center>
					<td width=100>영어</td>
					<td width=400><input type="text"
						value=<%=studentService.selectOne(Integer.parseInt(id)).get(0).getEng()%>
						name="eng" id="eng"> <!--id로 검색한 성적 값--> <span
						class="error" id="errMsg_03" style="font-size: 0.5em"></span></td>
				</tr>
				<tr align=center>
					<td width=100>수학</td>
					<td width=400><input type="text"
						value=<%=studentService.selectOne(Integer.parseInt(id)).get(0).getMat()%>
						name="mat" id="mat"> <!--id로 검색한 성적 값--> <span
						class="error" id="errMsg_04" style="font-size: 0.5em"></span></td>
				</tr>
			</table>
			<p align=center>
				<input type="submit" value="수정" id="modify"
					onclick="javascript: form.action='./updateDB.jsp';" />
					<!--클릭하면 updateDB창으로 이동-->
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="삭제"
					onclick="javascript: form.action='./deleteDB.jsp';" />
					<!--클릭하면 deleteDB창으로 이동-->
			</p>
		</form>
		<%
			}
			// 예외 처리
		} catch (IndexOutOfBoundsException | NumberFormatException e) {
		%>
		<table border=1 cellspacing=0>
			<tr align=center>
				<td width=100>이름</td>
				<td width=400><input type="search" value="해당학번없음" name="name"
					readonly></td>
			</tr>
			<tr align=center>
				<td width=100>학번</td>
				<td width=400><input type="search" value="" name="id" readonly></td>
			</tr>
			<tr align=center>
				<td width=100>국어</td>
				<td width=400><input type="search" value="" name="kor" readonly></td>
			</tr>
			<tr align=center>
				<td width=100>영어</td>
				<td width=400><input type="search" value="" name="eng" readonly></td>
			</tr>
			<tr align=center>
				<td width=100>수학</td>
				<td width=400><input type="search" value="" name="mat" readonly></td>
			</tr>
		</table>
		<%
			}
		%>

	</form>
</body>
</html>