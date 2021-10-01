<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); //세션 무효화(끊기)
	 out.print("<script>");
    	out.print("alert('로그아웃 되었습니다.');");
    	out.print("location.href='home.jsp';"); //home.jsp로 url 이동
    out.print("</script>");
	
	//response.sendRedirect("home.jsp");

 %>