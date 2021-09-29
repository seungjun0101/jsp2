<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>day7 글 상세보기</title>
<link rel="stylesheet" href="../css/freeboard.css?v=3">
</head>
<body>
	<!-- 문서가 생성될때 실행 -->
	<h3>동아리 커뮤니티</h3>
	<hr>
	<div style="width: 80%; margin: auto;">
		<ul id="main">
			<li>
				<ul class="row">
					<li>제목</li>
					<li>${bean.subject}</li>
					<li>조회수</li>
					<li>${bean.readCount}</li>
				</ul>
			</li>
			<li>
				<ul class="row">
					<li>작성자</li>
					<li>${bean.name}
					<span style="font-size: 70%; padding-left: 30px;">(${bean.ip})</span></li>
					<li>작성날짜</li>
					<li><fmt:formatDate value="${bean.wdate }" type="both"/></li>
					<!--pattern="yyyy-MM-dd hh:mm:ss",type = date,time,both  -->
				</ul>
			</li>
			<li id="content">
				<ul>
					<li>내용</li>	
					<!-- textarea에 입력한 엔터는 \n db에도 \n으로 저장됩니다.
						브라우저 출력은 줄바꿈은 <br> 태그 해결 1) pre 태그  2)\n을 <br>로 대처-->			
					<li><pre>${bean.content}</pre></li>				
				</ul>
			</li>
		</ul>
	<div style="text-align: center;margin-bottom: 10px;">
		<a class="button" href="updateAction.jsp?idx=${bean.idx}">수정</a>
		<a class="button" onclick="deleteSet()">삭제</a>
		<a class="button" href="listAction.jsp">목록</a>
	</div>
	<!-- 메인글 출력 끝 -->
	<!-- 댓글 시작 -->
	<form action="commentAction.jsp" method="post" name="frmCmt">
		<hr class="line">
		<div>
			<span>댓글</span>
			<span>${bean.commentCount}</span>
			<span>3열</span>
		</div>
		<hr class="line">
		<ul id="main">
			<li>
				<ul class="row">
					<li>작성자</li>
					<li><input type="text" name="name" class="input"></li>
					<li>글비밀번호</li>
					<li><input type="password" name="password" class="input"></li>
				</ul>
			</li>
			<li>
				<ul class="row-2">
					<li>
					<textarea rows="5"
						cols="80" name="content" style="resize: none;"
						placeholder="댓글을 작성하세요." class="input" required></textarea>
					</li>
					<li>
						<input type="submit" value="저장" class="button small">
						<input type="reset" value="취소" class="button small">
					</li>
				</ul>
			</li>
		</ul>
	</form>
</div>
<!--처음에는 display가 none이고 안보입니다.  -->
<!-- modal : alert,confirm 메소드 사용 외에 추가적인 정보를 받을 때 사용자가 만드는 입력 상자...-->
  <div id="myModal" class="modal">
		<!-- Modal content : 모달 입력창-->
		<div class="modal-content">
			<span class="close">&times;</span><br>
			<div style="padding: 0px 20px;">
				<b>글비밀번호</b><br>
				<br>
				<form action="deleteAction.jsp" method="post" name="frmPassword">
					<input type="hidden" name="idx" value="${bean.idx }"> <!--삭제할 글번호-->
					<input
						type="password" name="password" size="10">
					<input type="submit" value="확인" style="padding: 5px 20px;">
				</form>
			</div>
		</div>
	</div>
   <!--모달 끝  -->
  <script type="text/javascript">
  var modal = document.getElementById('myModal');
  var span = document.getElementsByClassName("close")[0];

  span.onclick = function() {
  modal.style.display = "none";   //modal 화면에 안보이기   닫기 기능 구현
  }
	function deleteSet(){
		document.getElementById('myModal').style.display='block';		
	}
</script>
</body>
</html>









