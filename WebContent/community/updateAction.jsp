<%@page import="dto.Freeboard"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pageNo = Integer.parseInt(request.getParameter("page"));
	FreeboardDao dao = FreeboardDao.getInstance();
	Freeboard dto = dao.getOne(idx);
	
//	out.print(dto);
	request.setAttribute("page", pageNo);
	request.setAttribute("bean", dto);
	pageContext.forward("updateView.jsp");
%>