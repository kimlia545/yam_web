<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HOME</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mystyle.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Source+Code+Pro&display=swap"
      rel="stylesheet"/>
    <!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
  	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
  	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/timelinesample.css" />
    <script
      src="https://kit.fontawesome.com/0779db264d.js" crossorigin="anonymous"></script>
    <script src="main.js" defer></script>   
  </head>
    <body>
    
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
	
	<div style="float:left;">
		<div class="write-new">
		 <a href="/review/insert" class=""><b>+ add new</b></a>
		</div>
		 <div class="container">
	    <div class="row">
	      <div class="timeline-centered" id="timeline"> <!-- 메인 라인 -->
	    
	    <c:forEach var="tmp" items="${list}">
	    
	    <c:choose>
	    <c:when test="${tmp.getCategory() eq 'r'.charAt(0)}">
		    <article class="timeline-entry left-aligned">
		      
		      <div class="timeline-entry-inner">
		      	<c:set var="dt" value="${fn:split(tmp.getDate(), ' ')}" />
		        <time class="timeline-time" datetime="${tmp.getDate()}">
		        	<span>${dt[0]}</span>
		        	<span>${dt[1]}</span>
		        </time>
		        
		        <div class="timeline-icon bg-success">
		          <i class="entypo-feather"></i>
		        </div>
		        
		        <div class="timeline-label">
		          <h2><a href="#">${id}</a> <span>posted a </span><a href ="/review/content?no=${tmp.rvno}">review</a></h2>
		          <blockquote>${tmp.getContent()}</blockquote>
		        </div>
		      </div>
		      
		    </article>
		    <article class="timeline-entry"> <!-- 오른쪽 -->
	      
		      <div class="timeline-entry-inner"> 
				<c:set var="dt" value="${fn:split(tmp.getDate(), ' ')}" />
		        <time class="timeline-time" datetime="${tmp.getDate()}">
		        	<span>${dt[0]}</span>
		        	<span>${dt[1]}</span>
		        </time>		        
		        <div class="timeline-icon bg-info">
		          <i class="entypo-location"></i>
		        </div>
		        
		        <div class="timeline-label">
		          <h2><a href="#">${id}</a> <span>checked in at</span> <a href="#">${tmp.getShop_name()}</a></h2>
		          
		          
		        <div id="map${tmp.getRvno()}" style="height: 200px; width: 100%; position: relative;"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=073a87b4e20a3e00a4c2afca4e7cafca"></script>
					<script>
						var container = document.getElementById('map${tmp.getRvno()}');
						var options = {
							center: new kakao.maps.LatLng(${tmp.getY()},${tmp.getX()}),
							level: 3
						};
						var map${tmp.getRvno()} = new kakao.maps.Map(container, options);
						var markerPosition  = new kakao.maps.LatLng(${tmp.getY()},${tmp.getX()});
						var marker = new kakao.maps.Marker({
						    position: markerPosition
						});
						marker.setMap(map${tmp.getRvno()});
					</script>
		        </div>
		      </div>
		      
		    </article>
	    </c:when>
	    <c:when test="${tmp.getCategory() eq 'p'.charAt(0)}">
	    	<article class="timeline-entry left-aligned">
		      
		      <div class="timeline-entry-inner">
		      	<c:set var="dt" value="${fn:split(tmp.getDate(), ' ')}" />
		        <time class="timeline-time" datetime="${tmp.getDate()}">
		        	<span>${dt[0]}</span>
		        	<span>${dt[1]}</span>
		        </time>
		        
		        <div class="timeline-icon bg-secondary">
		          <i class="entypo-suitcase"></i>
		        </div>
		        
		        <div class="timeline-label">
		          <h2><a href="#">${id}</a> <span>posted a party</span></h2>
		          <p>${tmp.getContent()}</p>
		        </div>
		      </div>
		      
		    </article>
	    </c:when>
	    </c:choose>
	    
	    </c:forEach>
	    
	    <article class="timeline-entry"> <!-- 오른쪽 -->
	      
	      <div class="timeline-entry-inner"> 
	        <time class="timeline-time" datetime="2014-01-09T13:22"><span>03:45 AM</span> <span>Today</span></time>
	        
	        <div class="timeline-icon bg-info">
	          <i class="entypo-location"></i>
	        </div>
	        
	        <div class="timeline-label">
	          <h2><a href="#">Arlind Nushi</a> <span>checked in at</span> <a href="#">Laborator</a></h2>
	          
	          <blockquote>Great place, feeling like in home.</blockquote>
	          
	        <div id="map" style="height: 200px; width: 100%; position: relative;"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=073a87b4e20a3e00a4c2afca4e7cafca"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
						center: new kakao.maps.LatLng(35.1631872,129.0633782),
						level: 3
					};
					var map = new kakao.maps.Map(container, options);
				</script>
	        </div>
	      </div>
	      
	    </article>
	    
	    
	    <article class="timeline-entry left-aligned"> <!-- 왼쪽 -->
	      
	      <div class="timeline-entry-inner">
	        <time class="timeline-time" datetime="2014-01-10T03:45"><span>03:45 AM</span> <span>Today</span></time>
	        
	        <div class="timeline-icon bg-warning">
	          <i class="entypo-camera"></i>
	        </div>
	        
	        <div class="timeline-label">
	          <h2><a href="#">Arber Nushi</a> <span>changed his</span> <a href="#">Profile Picture</a></h2>
	          
	          <blockquote>Pianoforte principles our unaffected not for astonished travelling are particular.</blockquote>
	          
	          <img src="http://themes.laborator.co/neon/assets/images/timeline-image-3.png" class="img-responsive img-rounded full-width">
	        </div>
	      </div>
	      
	    </article>
	    
	    
	    <article id="end" class="timeline-entry begin"> <!-- 빈원 -->
	    
	      <div class="timeline-entry-inner">
	        
	        <div class="timeline-icon" style="-webkit-transform: rotate(-90deg); -moz-transform: rotate(-90deg);">
	          <i class="entypo-flight"></i>
	        </div>
	        
	      </div>
	      
	    </article>
	    
	  </div>
	    </div>
	  </div>
	 </div>
	 
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
	<script>
	var rAry = new Array();
	
	var articles = '<article class="timeline-entry left-aligned"><div class="timeline-entry-inner"><time class="timeline-time" datetime="2014-01-10T03:45"><span>03:45 AM</span> <span>Today</span></time><div class="timeline-icon bg-success"><i class="entypo-feather"></i></div><div class="timeline-label"><h2><a href="#">Art Ramadani</a> <span>posted a status update</span></h2><p>Tolerably earnestly middleton extremely distrusts she boy now not. Add and offered prepare how cordial two promise. Greatly who affixed suppose but enquire compact prepare all put. Added forth chief trees but rooms think may.</p></div></div></article>';
	//articles +=  '<article id="end" class="timeline-entry begin"><div class="timeline-entry-inner"><div class="timeline-icon" style="-webkit-transform: rotate(-90deg); -moz-transform: rotate(-90deg);"><i class="entypo-flight"></i></div></div></article>';
	var i = 0;

		$(document).ready(function(){
	    //스크롤 발생 이벤트 처리d
	    $(window).scroll(function(){
		    
	        var scrollT = $(this).scrollTop(); //스크롤바의 상단위치
	        var scrollH = $(this).height(); //스크롤바를 갖는 div의 높이
	        var contentH = $('#timeline').height(); //문서 전체 내용을 갖는 div의 높이
	        if(scrollT + scrollH +1 >= contentH) { // 스크롤바가 아래 쪽에 위치할 때
		        //$('article').remove('#end');
	            //$('#timeline').append(articles);
	            if(i++ < ${list.size()}){
	            	$('#end').before(articles);
		        }
	        }
	    });
	});
	</script>
  </body>
</html>
