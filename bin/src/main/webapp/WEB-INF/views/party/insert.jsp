<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행자 글쓰기</title>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet" />
</head>
<body>
			<form action="/party/insert" method="post" enctype="multipart/form-data">
			<input type="text" name="ptytitle" placeholder="글제목" />
			<input type="text" name="userid" value="${userid}" readonly />
			<textarea id="content" name="ptycontent" placeholder="글내용"></textarea>
			<input type="text" name="ptydate" value="${ptydate}" readonly />		 
			<input type="submit" class="btn btn-success" value="작성" />&nbsp; 
			<a href="/" class="btn btn-secondary">홈으로</a>

		</form>
</body>
</html>