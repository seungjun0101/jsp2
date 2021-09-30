<%@page import="dto.Comment"%>
<%@page import="dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); // method가 post니까
	int mref;
	int pageNo = Integer.parseInt(request.getParameter("page"));
	CommentDao dao = CommentDao.getInstance();
	if(request.getParameter("del") != null){		//삭제
		int cmtidx = Integer.parseInt(request.getParameter("cmtidx"));
		int idx = Integer.parseInt(request.getParameter("idx"));
		dao.delete(cmtidx);
		mref=idx;
	}else{
	
		mref = Integer.parseInt(request.getParameter("mref"));
		String name = request.getParameter("name");	
		String password = request.getParameter("password");	
		String content = request.getParameter("content");	
		String ip = request.getRemoteAddr();
		
		Comment dto = new Comment(0,mref,name,password,content,null,ip);
		dao.insert(dto);
		//댓글을 insert한 후 댓글 카운터 증가 dao를 한다	
	//	dao.updateCommentCnt(mref); //mref는 메인(freeboard))의 idx : 글 상세보기의 idx입니다.
	}
	dao.updateCountAll(mref);
	response.sendRedirect("detailAction.jsp?page="+pageNo+"&idx="+ mref);


%>