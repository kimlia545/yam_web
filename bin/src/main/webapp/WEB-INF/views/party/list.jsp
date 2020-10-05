<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행자 게시판 목록</title>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet"/>
</head>
<body>
<!-- USERID, PTYNO, PTYTITLE, PTYCONTENT, PTYDATE -->
<div class="container">
	<h4>동행자 목록</h4>
		<table class="table table-sm">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="tmp" items="${list}">
				<tr>
					<td>${tmp.ptyno}</td>
					<td><a href ="/party/content?no=${tmp.ptyno}">${tmp.ptytitle}</a></td>
					<td>${tmp.userid}</td>
					<td>${tmp.ptydate}</td>
				
				</tr>
				</c:forEach>
			</tbody>			
		</table>
		<a href="/party/insert" class="btn btn-success">글쓰기</a>					
</div>
</body>
</html>