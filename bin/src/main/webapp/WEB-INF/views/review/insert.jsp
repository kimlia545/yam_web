<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰쓰기</title>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet" />
</head>
<body>
	<div class="container">
		<h4>리뷰 쓰기</h4>
		<table class="table table-sm">
			<thead>
				<tr>
					<td>가게명</td>
					<td><input type=text name=name size=30></td>
				</tr>
				<tr>
		 			<td>이름</td>
		 			<td><input type=text name=email size=10 maxlength=8></td>
	    		</tr>
	    		<tr>
	     			<td>평점</td>
	     			<td><input type=text name=homepage size=5 maxlength=5></td>
	    		</tr>
	    		<tr>
	     			<td>먹은 메뉴</td>
	     			<td><input type=text name=title></td>
	    		</tr>
	    		<tr>
	     			<td>내 용(총평)</td>
	     			<td><textarea name=content rows ="10" cols="100">하고픈 말을 적으세요</textarea></td>
	     			
	    		</tr>
	    		<tr>
	     			<td>이미지</td> 
	     			<td><input type=file></td>
	    		</tr>
			</thead>
		</table>
	</div>


	
</body>
</html>