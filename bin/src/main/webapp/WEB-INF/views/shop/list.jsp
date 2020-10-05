<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이템 목록</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet"/>
</head>
<body>
<%-- <% for(int i=0)) %> --%>
	<div class="container">
		<h4>shop 목록</h4>
		<table class="table">
			<thead>
				<tr>
					<th>가게명</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>기타</th>
				
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="tmp" items="${list}">
				<tr>
					<td><a href ="/shop/content?no=${tmp.shop_no}">${tmp.shop_name}</a></td>
					<td>${tmp.shop_adr}</td>
					<td>${tmp.shop_tel}</td>
					<td>0</td>
					
				</tr>
				</c:forEach>
			</tbody>			
		</table>
	</div>

</body>
</html>