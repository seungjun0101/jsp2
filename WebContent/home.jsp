<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
</head>
<body>
	<a href="community/listAction.jsp">커뮤니티 게시판</a>
	<c:if test="${sessionScope.uid == null }">
		<a href="loginView.jsp">로그인</a>
	</c:if>
	<c:if test="${sessionScope.uid != null }">
		<!--로그인된 상태  -->
		<a href="logout.jsp">로그아웃</a>
	</c:if>
</body>
</html>