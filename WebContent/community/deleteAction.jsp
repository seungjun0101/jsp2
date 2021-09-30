<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request.setCharacterEncoding("UTF-8"); //post로 받는 폼데이터가 둘다 숫자니까
	int pageNo = Integer.parseInt(request.getParameter("page"));
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
		href = "listAction.jsp?page="+pageNo;
	}else{  //n=0 : password가 틀릴때
	 	message = "글 비밀번호가 틀렸습니다..";
		href = "detailAction.jsp?page="+pageNo+"&idx="+idx;		
	}
	out.print("alert('"+message+"');");
	out.print("location.href='"+href+"';");
	out.print("</script>"); 
	
%>

<!-- 
메인글과 댓글의 참조 관계(외래키) 설정되어 있을떄
:외래키 On Delete 동작을 설정합니다.

1.메인글 삭제 못하게한다. - Restrict
2.메인글과 댓글 모두 삭제한다. - Cascade (테스트는 이 방법으로 해보자)
3.메인글의 suject를 [삭제된 글]로 하고 작성자, 내용은 ""없게 update한다.
4.메인글은 삭제하고 
댓글의 mref값은 null로  







 -->