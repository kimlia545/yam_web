<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>RANKING</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet"/>
</head>

<body>
	<div class="container">
		<h4>RANKING</h4>
		
		<div id="visit">
			<div id="total" style="float:left; width:30%;">
			<h6 style="text-align:center;">방문수 랭킹</h6>
				<table class="table table-sm" style="table-layout: fixed;">
					<thead style="text-align:center;">
						<tr>
							<th style="width:70%; vertical-align:middle;">가게</th>
							<th style="width:30%;">방문수</th>
						</tr>
					</thead>
						
					<tbody>
						<c:forEach var="tmp" items="${list1}">
						<tr>
							<td>${tmp.shop_name}</td>
							<td style="text-align:center; vertical-align:middle;">${tmp.cnt}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>		
			
			<div id="female" style="float:left; margin-left:5%; width:30%;">
			<h6 style="text-align:center;">(여성)</h6>
				<table class="table table-sm" style="table-layout: fixed;">
					<thead style="text-align:center;">
						<tr>
							<th style="width:70%; vertical-align:middle;">가게</th>
							<th style="width:30%;">방문수</th>
						</tr>
					</thead>
						
					<tbody>
						<c:forEach var="tmp" items="${list2}">
						<tr>
							<td>${tmp.shop_name}</td>
							<td style="text-align:center; vertical-align:middle;">${tmp.cntf}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>		
			
			<div id="male" style="float:right; width:30%;">
			<h6 style="text-align:center;">(남성)</h6>
				<table class="table table-sm" style="table-layout: fixed;">
					<thead style="text-align:center;">
						<tr>
							<th style="width:70%; vertical-align:middle;">가게</th>
							<th style="width:30%;">방문수</th>
						</tr>
					</thead>
						
					<tbody>
						<c:forEach var="tmp" items="${list3}">
						<tr>
							<td>${tmp.shop_name}</td>
							<td style="text-align:center; vertical-align:middle;">${tmp.cntm}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>		
		</div>
		
		<div id="score">
			<div id="total" style="float:left;">
			
			</div>		
			<div id="female" style="float:center;">
			
			</div>		
			<div id="male" style="float:right;">
			
			</div>				
		</div>
	
	</div>
</body>
</html>