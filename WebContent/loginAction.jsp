<%@page import="dao.CustomerDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("userid");
	String password = request.getParameter("password");
	
	//id는 'admin'이고 password 'jcpdev' 라고 가정하고 합니다.
	//if(id.equals("admin") && password.equals("jcpdev")){ // -> db에서 확인하도록 변경예정입니다.
	Map<String,String> map = new HashMap<>();
	map.put("email",id);
	map.put("password",password);
	CustomerDao dao = CustomerDao.getInstance();
	if(dao.login(map) != null){
		//로그인 정보 일치
		//session 객체에 로그인 id 저장
		session.setAttribute("uid", id);
	
	   out.print("<script>");
       	out.print("alert('로그인 되었습니다.');");
       	out.print("location.href='home.jsp';"); //home.jsp로 url 이동
       out.print("</script>");
		//response.sendRedirect("home.jsp");
	}else{
		//로그인 정보 불일치
	   out.print("<script>");
       	out.print("alert('로그인 정보가 올바르지 않습니다.');");
       	out.print("location.href='loginView.jsp';"); //home.jsp로 url 이동
       out.print("</script>");
		
		//response.sendRedirect("loginView.jsp");
	}

%>