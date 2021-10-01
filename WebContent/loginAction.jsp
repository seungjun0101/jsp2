<%@page import="dto.SessionDto"%>
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
	SessionDto user = dao.login(map);
	if(user != null){
		//로그인 정보 일치
		//session 객체에 로그인 id 저장
//		session.setAttribute("uid", id);
		session.setAttribute("user", user);
	
	  /*  out.print("<script>");
       	out.print("alert('로그인 되었습니다.');");
       	out.print("location.href='home.jsp';"); //home.jsp로 url 이동
       out.print("</script>"); */
       
       request.setAttribute("message", "로그인 되었습니다.");
       request.setAttribute("url", "home.jsp");
       pageContext.include("error/alert.jsp"); 
       //			ㄴpageContext.forward는 페이지 이동, 이하코드가 길행이 안됩니다
       //			ㄴinclude는 ()안에 해당페이지가  *이 자리에 포함*, 이하 아래의 코드가 실행됩니다.
		//response.sendRedirect("home.jsp");
	}else{
		//로그인 정보 불일치
	
       request.setAttribute("message", "로그인 정보가 올바르지 않습니다.");
       request.setAttribute("url", "loginView.jsp");
       pageContext.include("error/alert.jsp");
       	
		//response.sendRedirect("loginView.jsp");
	}

%>