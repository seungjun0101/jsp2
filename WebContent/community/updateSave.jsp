<%@page import="dto.Freeboard"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//수정 버튼 -> 내용 변경 -> 저장 버튼 으로 실행됩니다.
	request.setCharacterEncoding("UTF-8");
	/*insertView에서 form method가 post니까 지금 들어온 request에 대해서 인코딩을 어떻게해야하는지   */
	int pageNo = Integer.parseInt(request.getParameter("page"));
	int idx = Integer.parseInt(request.getParameter("idx"));
	String subject = request.getParameter("subject");
//	String name = request.getParameter("name");
//	String password = request.getParameter("password");
	String content = request.getParameter("content");
//	String ip = request.getRemoteAddr(); // ip 받기
	
	Freeboard dto = new Freeboard();
//	dto.setIp(ip);
//	dto.setName(name);
//	dto.setPassword(password);
	dto.setIdx(idx);
	dto.setSubject(subject);
	dto.setContent(content);
	//out.print(dto); //테스트
	
	FreeboardDao dao = FreeboardDao.getInstance();
	dao.update(dto);
//	response.sendRedirect("updateAction.jsp?update=&idx="+idx); //insert 하고 다시 updateAction으로 돌아간다
	response.sendRedirect("detailAction.jsp?update=&idx="+idx+"&page="+pageNo); //insert 하고 다시 updateAction으로 돌아간다
%>



