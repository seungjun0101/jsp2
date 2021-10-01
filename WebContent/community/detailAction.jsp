<%@page import="javax.swing.text.StyledEditorKit.BoldAction"%>
<%@page import="dto.Comment"%>
<%@page import="java.util.List"%>
<%@page import="dao.CommentDao"%>
<%@page import="dto.Freeboard"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

	//글 상세보기
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pageNo = Integer.parseInt(request.getParameter("page"));
	
	FreeboardDao dao =FreeboardDao.getInstance();
	
	if(session.getAttribute("readIdx") != null){ //이미 home.jsp 에서 readIdx ="/"이라 웬만하면 null이 아님
		StringBuilder readIdx = (StringBuilder)session.getAttribute("readIdx");
		boolean status = readIdx.toString().contains("/"+idx+"/"); //처음들어왔을때 reaIdx는 "/"
		if(!status){ //읽은 글 목록 문자열에 idx가 포함되어있지 않으면
			// 어떤 게시물이 처음이면 당연히 그 게시물의 해당 idx가 포함 안되어있으니까 status는 false
			dao.readCount(idx); //조회수 증가
			readIdx.append(idx+"/"); //읽은글 목록에 추가 // 여기서 readIdx = "/" -> "/idx/"이 된다
									//또 다른 게시물 가면 readIdx ="/idx1/idx2/" 다른 idx가 쌓인다 
		}
	}else{
		StringBuilder readIdx = new StringBuilder("/");
		session.setAttribute("readIdx", readIdx);
	}
	
	
	
	Freeboard bean = dao.getOne(idx);
	
	//freeboard 테이블 idx을 이용해서 board_comment 테이블의 댓글 목록 가져오기
	CommentDao cdao = CommentDao.getInstance();
	cdao.updateCountAll(idx); //댓글 갯수 update
	List<Comment> cmts = cdao.getComments(idx);
	request.setAttribute("cmtlist", cmts);
	
	request.setAttribute("page", pageNo);
	
	//bean 객체로 참조하고 있는 값은 detailView.jsp에게 전달하고 브라우저에 출력하도록 합니다.
	request.setAttribute("bean", bean);
	pageContext.forward("detailView.jsp");


%>