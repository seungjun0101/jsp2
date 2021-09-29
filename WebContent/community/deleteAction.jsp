<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dto.Freeboard"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request.setCharacterEncoding("UTF-8"); //post로 받는 폼데이터가 둘다 숫자니까

	int idx = Integer.parseInt(request.getParameter("idx"));
	String password = request.getParameter("password");
	FreeboardDao dao = FreeboardDao.getInstance();
	Map<String,Object> map = new HashMap<>();
	map.put("idx", idx);
	map.put("password", password);
	
	int n = dao.delete(map); //주요 실행 메소드
	
	//out.print(n);
	out.print("<script>");
	String message = null;
	String href = null;
	if(n==1){	//정상 delete 실행
	 	message = "글 삭제가 되었습니다.";
		href = "listAction.jsp";
	}else{  //n=0 : password가 틀릴때
	 	message = "글 비밀번호가 틀렸습니다..";
		href = "detailAction.jsp?page=1&idx="+idx;		
	}
	out.print("alert('"+message+"');");
	out.print("location.href='"+href+"';");
	out.print("</script>"); 
	
%>