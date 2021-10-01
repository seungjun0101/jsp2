<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day10 로그인</title>
<style type="text/css">
div {
   width: 200px;
   height: 200px;
   background-color: #888;color:white;
   padding: 50px;
   margin: 100px auto;
}
input{    padding: 7px;
		margin: 15px auto; }
input[type=text],input[type=password]{
   border-radius: 4px; border: 2px solid #ccc;
}
input[type=submit], input[type=button] {
   padding: 7px 15px;
   margin: 7px 10px;
   background: #c69;
   color: white;
   border: none;
   cursor: pointer;
   width:35%;
}
</style>
</head>
<body>
<div>
	<form action="loginAction.jsp" method = "post">
		<input type="text" name="userid" placeholder="아이디(이메일) 입력하세요.">
		<input type="password" name="password" placeholder="비밀번호 입력하세요">
		<input type="submit" value="Login">
		<input type="button" value="HOME" onclick="location.href='home.jsp'">
	</form>
</div>
</body>
</html>























