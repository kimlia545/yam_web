<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>동행자 수정</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" 
		rel="stylesheet"/>
</head>
<body>
	<div class="container">
		<form action="${pageContext.request.contextPath}/party/update" method="post" enctype="multipart/form-data">
			<input type="text" class="form-control" name="ptyno" value="${vo.ptyno}" readonly />
			<input type="text" class="form-control" name="ptytitle" value="${vo.ptytitle}" />
			<textarea id="content" class="form-control" name="ptycontent">${vo.ptycontent}</textarea>
			<input type="text" class="form-control" name="userid" value="${vo.userid}" readonly />
			<hr />
			<input type="submit" class="btn btn-success" value="글수정 " />
			<a href="${pageContext.request.contextPath}/party/list" class="btn btn-success">글목록</a>
		</form>
	</div>
	
	
	
</body>
</html>