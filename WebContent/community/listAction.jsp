<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Freeboard"%>
<%@page import="java.util.List"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//비지니스 로직을 처리하는 jsp 파일
	FreeboardDao dao = FreeboardDao.getInstance();
	//페이지 번호는 파라미터로 전달됩니다.
	int pageNo;
	if(request.getParameter("page")==null) pageNo=1;
	else pageNo = Integer.parseInt(request.getParameter("page"));   //page=1,2,3,4,.....
	
	int pageSize =15;
	int startNo=(pageNo-1)*pageSize;
	
	Map<String,Integer> map = new HashMap<>();
	map.put("pageSize",pageSize);
	map.put("startNo",startNo);
	List<Freeboard> list = dao.getList(map);
	//out.print(list);
	
	request.setAttribute("list", list); 
	pageContext.forward("listView.jsp"); 
%>






