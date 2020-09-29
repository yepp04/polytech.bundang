<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- 부트스트랩 -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Cinzel&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
</head>
<body BACKGROUND="./image/bg.png">
	<%
		String jump = "adm_allview.jsp"; // jump값 선언
	%>
	<center>
		<h2 style="font-family: 'Cinzel', serif;">Admin Login</h2>
		<form method="post" action="adm_loginck.jsp">
		  <div class="form-group">
    <label class="sr-only" for="exampleInputEmail1"></label>
    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="ID" name="id" style="width:300px;">
  </div>
  <div class="form-group">
    <label class="sr-only" for="exampleInputPassword1"></label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="passwd" style="width:300px;">
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
			<input type="hidden" name="jump" value="<%=jump%>">
		</form>
	</center>
</body>
</html>