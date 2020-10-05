<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행자 상세페이지</title>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet" />
</head>
<body>
	<div class="container">
		<!-- USERID, PTYNO, PTYTITLE, PTYCONTENT, PTYDATE -->
		글번호 : ${obj.ptyno}
		제목 : ${obj.ptytitle}<br/>
		내용 : ${obj.brd_content}<br/>
		작성자 : ${obj.userid}<br/>
		작성일자 : 	${obj.brd_date}<br/>
		
		<hr />
		<a href="${pageContext.request.contextPath}/party/list" class="btn btn-success">목록</a>
		<a href="${pageContext.request.contextPath}/party/update?no=${obj.brd_no}" class="btn btn-success">수정</a>
		<a href="${pageContext.request.contextPath}/party/delete?no=${obj.brd_no}" class="btn btn-success">삭제</a>
		
		<c:if test="${prev != 0}">
		<a href="${pageContext.request.contextPath}/party/content?no=${prev}" class="btn btn-success">이전글</a>
		</c:if>
		
		<c:if test="${next != 0}">
		<a href="${pageContext.request.contextPath}/party/content?no=${next}" class="btn btn-success">다음글</a>
		</c:if>
	</div>
</body>
</html>