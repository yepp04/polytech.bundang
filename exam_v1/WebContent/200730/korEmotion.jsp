<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");//인코딩
	String submit = request.getParameter("submit"); // 파라미터 받아오기
	%>

	<h1>리뷰 입력</h1>
	<form method="post">
		<input type="text" name="input" style="width: 300px; height: 200px">
		<button type="submit" onclick="loadDoc()" name="submit">실행</button>
		<h1>결과</h1>
		<p id="print"></p>

	</form>
	<script>
		function loadDoc() {
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					//document.getElementById("print").innerHTML = this.responseText;
					var response = JSON.parse(this.responseText);
					document.getElementById("print").innerHTML = response.result;
				}
			};
			xhttp.open("GET", "http://localhost:8000/moviereview?review=<%=submit%>
		",
					false);
			xhttp.setRequestHeader("X-Custom-Header", "testvalue");
			xhttp.send();
			//xhttp.open("POST", "http://ipinfo.io/json", false);
			//xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			//xhttp.send("fname=Henry&lname=Ford");
		}
	</script>
</body>
</html>