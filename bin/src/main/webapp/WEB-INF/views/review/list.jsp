<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>REVIEW</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet"/>
</head>
<body>
	<div class="container">
		<h4>REVIEW</h4>
		
		<div id="button" style="margin:10px;">
			<div id="move" style="float:left; margin-bottom:10px;">
				<a href="${pageContext.request.contextPath}/" class="btn btn-success" style="margin-right:2px;">홈으로</a>
				<a href="${pageContext.request.contextPath}/review/list" class="btn btn-success" style="margin-right:2px;">전체목록</a>
				<a href="${pageContext.request.contextPath}/review/insert" class="btn btn-success">글쓰기</a>
			</div>
			
			<div id="search" style="float:right">			
			<form action="${pageContext.request.contextPath}/review/list" method="get">
				<input type="hidden" name="page" value="1"/>
				<input type="text" name="text" class="form-control" placeholder="검색어" style="width:75%; float:left"/>
				<input type="submit" class="btn btn-success" value="검색" style="float:right"/>
			</form>
			</div>
		</div>
		
		<table class="table table-sm" style="table-layout: fixed;">
			<thead style="text-align:center;">
				<tr>
					<th style="width:3%; vertical-align:middle;">번호</th>
					<th style="width:20%; vertical-align:middle;">내용</th>
					<th style="width:10%; vertical-align:middle;">가게</th>
					<th style="width:5%; vertical-align:middle;">별점</th>
					<th style="width:10%; vertical-align:middle;">작성자</th>
					<th style="width:7%; vertical-align:middle;">작성일</th>
				</tr>
			</thead>
			
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="6" align=center>검색결과가 없습니다.</td>
					</tr>
				</c:if>
		
				<c:if test="${!empty list}">
				<c:forEach var="tmp" items="${list}">
				<tr style="text-align:center;">
					<td style="vertical-align:middle;">${tmp.rvno}</td>
					<td style="text-align:left; vertical-align:middle; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
						<a href ="/review/content?no=${tmp.rvno}">${tmp.content}</a>
					</td>
					<td style="text-align:left; vertical-align:middle;">${tmp.shop_name}</td>
					<td style="vertical-align:middle;">${tmp.score}</td>
					<td style="vertical-align:middle;">${tmp.userid}</td>
					<td style="vertical-align:middle;">
						<c:set var="dt" value="${fn:split(tmp.rvdate, ' ')}" />
						${dt[0]}
					</td>
				</tr>
				</c:forEach>
				</c:if>
			</tbody>			
		</table>
		
		<div id="pagination-div" style="position: absolute; left: 50%; transform: translatex(-50%);"></div>

	</div>
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>

	<script>
		$(function(){
			$('#pagination-div').twbsPagination({
		        totalPages: Number('${cnt}'),
		        visiblePages: 10,
		        startPage : Number('${param.page}'),
		        initiateStartPageClick : false,
		        onPageClick: function (event, page) {
		             window.location.href = "/review/list?page="+page+"&text=${param.text}";
		        }
		    });
		})
	</script>
	
</body>
</html>