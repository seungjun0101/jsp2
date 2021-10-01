<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
    request.setAttribute("message", "로그아웃 되었습니다.");
    request.setAttribute("url", "home.jsp");
    pageContext.include("error/alert.jsp");
	//response.sendRedirect("home.jsp");
	session.invalidate(); //세션 무효화(끊기) 
//session.invalidate() 전후에 session 값 변경 확인해보세요. 
//개발자도구 JSESSIONID 변경됩니다. -> request 객체도 새로 생성됩니다.
 %>