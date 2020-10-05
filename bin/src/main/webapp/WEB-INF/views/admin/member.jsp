<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 관리</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet"/>
</head>
<body>
<%-- <% for(int i=0)) %> --%>
	<div class="container">
		<h4>회원 목록</h4>
		 <form action="/admin/member" method="post">
			<input type="submit" name="btn" class="btn btn-success" value="일괄삭제" />
			<table class="table table-sm">
			<thead>
				<tr>		
					<th><input type="checkbox" /></th>
					<th>아이디</th>
					<th>이름</th>
					<th>연락처</th>
					<th>나이</th>
					<th>가입일자</th>
				
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="tmp" items="${list}">
				<tr>
					<td><input type="checkbox" name="chk[]" value="${tmp.userid}"/></td>
					<td>${tmp.userid}</td>
					<td>${tmp.username}</td>
					<td>${tmp.phone}</td>
					<td>${tmp.userage}</td>
					<td>${tmp.joindate}</td>
				</tr>
				</c:forEach>
			</tbody>			
		</table>
		</form>
	</div>

</body>
</html>