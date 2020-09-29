<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="service.*,domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- 부트스트랩 -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script src="../static/js/jquery-3.5.1.min.js"></script>
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
			var reg3 = /^[a-zA-Zㄱ-힣]*$/;
			var nameLen    = name.length;
			if(nameLen < 2){//글자수가 0이면
				$("#errMsg_01").show();
				$("#errMsg_01").text("이름은 2글자 이상 써주세요"); //출력
				event.preventDefault();
			} else if (!reg3.test(name)) {
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
			
			var processing   = $("#processing").val();//name은 #name의 값
			var processingLen    = processing.length;
			var reg2 = /^[1-3]*$/;
			if(processingLen < 1){//글자수가 0이면
				$("#errMsg_06").show();
				$("#errMsg_06").text("비어있음"); //출력
				event.preventDefault();
			} else if (!reg2.test(processing)) {
				$("#errMsg_06").show();
				$("#errMsg_06").text("잘못된 입력"); //출력
				event.preventDefault();
				} else {//아니면
				$("#errMsg_06").hide();//숨김
			}
			
			var date   = $("#date2").val();//name은 #name의 값
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

<script type="text/javascript">
	function submitForm(mode) {/* 쓰기누르면 쓰기창, 삭제 누르면 삭제창 */
		if (mode == "write") {
			fm.action = "adm_update.jsp";
		} else if (mode == "delete") {
			fm.action = "adm_delete.jsp"
		}
		fm.submit();
	}
</script>

</head>
<body BACKGROUND="./image/bg.png">

	<%
	
	ResvService resvService = new ResvService();
		request.setCharacterEncoding("utf-8");//인코딩	
	String date = request.getParameter("date");
	String sRoom = request.getParameter("room");
	int room = 0;
	if (sRoom != null) {
		room = Integer.parseInt(sRoom);
	}
	String writeDate = request.getParameter("writeDate");
	
	String name = "";
	if (resvService.selectOne(date, room).get(0).getName() != null) {
	name = resvService.selectOne(date, room).get(0).getName();		
	}
	String addr = "";
	if (resvService.selectOne(date, room).get(0).getAddr() != null) {
	addr = resvService.selectOne(date, room).get(0).getAddr();		
	}
	String tel = "";
	if (resvService.selectOne(date, room).get(0).getTelnum() != null) {
	tel = resvService.selectOne(date, room).get(0).getTelnum();		
	}
	String inname = "";
	if (resvService.selectOne(date, room).get(0).getIn_name() != null) {
	inname = resvService.selectOne(date, room).get(0).getIn_name();		
	}
	String comment = "";
	if (resvService.selectOne(date, room).get(0).getComment() != null) {
	comment = resvService.selectOne(date, room).get(0).getComment();		
	}
	int processing = 0;
	if (resvService.selectOne(date, room).get(0).getProcessing() != 0) {
	processing = resvService.selectOne(date, room).get(0).getProcessing();		
	}
	%>

	<center>
		<form method=post name="fm">
			<table cellspacing=1 border=1>
				<tr>
					<td width=100 align=center>Name</td>
					<td width=500><input type="text" name="name" id="name" value="<%=name%>"><span
						class="error" id="errMsg_01" style="font-size: 1em"></span></td>
				</tr>
				<tr>
					<td width=100 align=center>Date</td>
					<td width=500>
						<%
							if (date != null) {
						%> <%=date%><input type=hidden name="date" value="<%=date%>">
						<%
							} 
						%>→ <input type="date" name="date2" id="date2"><span
						class="error" id="errMsg_05" style="font-size: 1em"></span> <%

 %>
					</td>
				</tr>
				<tr>
					<td width=100 align=center>Room</td>
					<td width=500>
						<%
							if (sRoom != null) {
							if (room == 1) {
						%> VIP <input type=hidden name="room" value=1><%
 	} else if (room == 2) {
 %> Normal <input type=hidden name="room" value=2><%
 	} else if (room == 3) {
 %> Reasonable <input type=hidden name="room" value=3><%
 	}
 }
 %>→ <select name=room2 id=room2>
							<option value=1>VIP
							<option value=2>Normal
							<option value=3>Reasonable
					</select> <%
 	
 %>
					</td>
				</tr>
				<tr>
					<td width=100 align=center>Address</td>
					<td width=500><input type="text" name="addr" id="addr"
						style="width: 400px" value=<%=addr%>><span class="error" id="errMsg_04"
						style="font-size: 1em"></span></td>
				</tr>
				<tr>
					<td width=100 align=center>Tel</td>
					<td width=500><input type="search" name="tel" id="tel" value=<%=tel%>>ex) 010-0000-0000 <span
						class="error" id="errMsg_03" style="font-size: 1em"></span></td>
				</tr>
				<tr>
					<td width=100 align=center>Depositor</td>
					<td width=500><input type="text" name="inname" id="inname" value=<%=inname%>><span
						class="error" id="errMsg_02" style="font-size: 1em"></span></td>
				</tr>
				<tr>
					<td width=100 align=center>Comment</td>
					<td width=500><input type="text" name="comment"
						style="width: 400px" value=<%=comment%>></td>
				</tr>
				<tr>
					<td width=100 align=center>Reception</td>
					<td width=500><input type="text" name="writeDate"
					 value=<%=writeDate%> readonly></td>
				</tr>
				<tr>
					<td width=100 align=center>Processing</td>
					<td width=500><input type="text" name="processing" id="processing"
					<%
					 if (resvService.selectOne(date, room).get(0).getProcessing() != 0) {
					 %>value="<%=processing%>"
						<% 
					 }
					 %>
						style="width: 400px" placeholder="1:예약완료, 2:입금완료, 3:환불요청"><span
						class="error" id="errMsg_06" style="font-size: 1em"></span></td>
				</tr>
				<tr>
					<td colspan=2 align=center><input type=button value="AdminPage"
						id=admin OnClick="location.href='adm_allview.jsp'">&nbsp;<input type=submit value="Modify"
						id=submit OnClick="submitForm('write')">&nbsp;<input type=submit value="Delete"
						OnClick="submitForm('delete')"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>