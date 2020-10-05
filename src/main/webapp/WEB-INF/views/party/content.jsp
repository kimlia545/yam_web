<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>동행자 상세페이지</title>
	 <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- Site Metas -->
    <title>PARTY - YAM</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="#" type="image/x-icon" />
    <link rel="apple-touch-icon" href="#" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
    <!-- Pogo Slider CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pogo-slider.min.css" />
    <!-- Site CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css" />
    <script src="https://kit.fontawesome.com/0779db264d.js"></script>  
    
	<!-- Add icon library -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<style>
	body{
		position:relative;
	}
	heart{
		z-index: 10;
		position: absolute;
		top:-240px;
		right: 880px;
		cursor: pointer;
		display: block;
		height: 100px;
		width: 100px;
		margin: 200px auto;
		background-size: auto 100%;
		background-position: 0 0;
		background-image: url(https://abs.twimg.com/a/1446304541/img/t1/web_heart_animation.png);
	}
	span.star-prototype, span.star-prototype > * {
	    height: 18.5px; 
	    background: url(${pageContext.request.contextPath}/resources/img/star.png) 0 -16px repeat-x;
	    width: 75px;
	    display: inline-block;
	}
	 
	span.star-prototype > * {
	    background-position: 0 0;
	    max-width:80px; 
	}
	.table td {
	  border-top: transparent;
	}
	</style>
</head>

<body id="about" class="inner_page" data-spy="scroll" data-target="#navbar-wd" data-offset="98">
	 
	<!-- LOADER -->
    <div id="preloader">
        <div class="loader">
            <img src="${pageContext.request.contextPath}/resources/images/loader.gif" alt="#" />
        </div>
    </div>
    <!-- end loader -->
    <!-- END LOADER -->
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
	
    <!-- Start Banner -->
	  <div class="section inner_page_header">
	     <div class="container">
		    <div class="row">
              <div class="col-lg-12">
			     <div class="full">
				    <h3>PARTY</h3>
				 </div>
			  </div>
			</div>
		 </div>
	  </div>
    <!-- end Banner -->
    
	<!-- section -->
<div class="container">	
	<div class="contentdiv" >
	
		<h4 style="font-weight:bold;">동행자 구하기</h4>
		&nbsp;&nbsp;&nbsp; <h5> 이 글이 마음에 드시나요?</h>
		<br />
		<br />
		
		<!-- USERID, PTYNO, PTYTITLE, PTYCONTENT, PTYDATE -->
		<%-- 글번호 : ${obj.ptyno}<br /> --%>
		<div id="text" style="width:45%; display: inline-block;">
		<table class="table">
			<tr>
				<td>
					제목 : ${obj.ptytitle}
				</td>
			</tr>
			<tr>
				<td>작성자 : ${obj.userid}
				</td>
			</tr>
			<tr>
				<td>
					작성일자 : 	${obj.ptydate}
				</td>
			</tr>
			<tr>
				<td>
					조회수 : ${obj.ptyhit}
				</td>
			</tr>
			<tr>
				<td>
					내용 : ${obj.ptycontent}
				</td>
			</tr>
		</table>
		</div>
		
		<div id="img" style="width:45%; display: inline-block;">	
			<img src="${pageContext.request.contextPath}/party/getimg?no=${obj.ptyno}" style=" max-height:420px; max-width:400px; width:auto; height:auto;"/><br />
		</div>
		
		<div id="button">
			<div id="movebutton" style="float:left; margin-top:5px; margin-bottom:10px; width:70%">
				<a href="${pageContext.request.contextPath}/party/list" class="btn btn-success">목록</a>
				
				<c:if test="${prev != 0}">
				<a href="${pageContext.request.contextPath}/party/content?no=${prev}" class="btn btn-success">이전글</a>
				</c:if>
				
				<c:if test="${next != 0}">
				<a href="${pageContext.request.contextPath}/party/content?no=${next}" class="btn btn-success">다음글</a>
				</c:if>
			</div>	
				
			<div id="updatebutton" style="float:right; margin-top:5px;">
				<security:authentication property="name" var="uid" />
				<c:if test="${uid eq obj.userid}">
					<a href="${pageContext.request.contextPath}/party/update?no=${obj.ptyno}" class="btn btn-success">수정</a>
					<a href="${pageContext.request.contextPath}/party/delete?no=${obj.ptyno}" class="btn btn-success">삭제</a>
				</c:if>
			</div>
		</div>

		
		<heart id="like" />
    
		</div><br />
	

	
	<div class="replydiv">
		<h4 style="font-weight:bold;">댓글목록</h4>
		
		<table class="table table-sm">
			<thead>
				<c:forEach var="robj" items="${list}">
				<tr>
					<td>댓글번호</td>
					<td>${robj.rpcount}</td>
				</tr>
				<tr>	
					<td>댓글아이디</td>
					<td>${robj.userid}</td>
				</tr>
				
				
				<security:authentication property="name" var="uid" />
				<c:if test="${uid ne robj.userid}">
				<tr> 	
					<td>댓글</td>
					<td>${robj.rpcontent}</td>
				</tr>
				</c:if>
				
				<security:authentication property="name" var="uid" />
				<c:if test="${uid eq robj.userid}">

				<tr>	
					<td>댓글</td>
					<td><textarea id="updatereply" class="updatereply" >${robj.rpcontent}</textarea></td>
				</tr>

				</c:if>
				
				
				<tr>	
					<td>날짜</td>
					<td>${robj.rpdate}</td>
				</tr>	
				<tr>
					<security:authentication property="name" var="uid" />
					<c:if test="${uid eq robj.userid}">
					<td>
						<form action="${pageContext.request.contextPath}/party_reply/update?no=${obj.ptyno}&rpno=${robj.rpno}" method="post" class="form"style="width:20%; float:left;">
							<input type="hidden" name="rpcontent" class="rpcontent"/>
							<input type="button" class="btn btn-success update" value="수정"  />
						</form>
						<form action="${pageContext.request.contextPath}/party_reply/delete?no=${obj.ptyno}&rpno=${robj.rpno}" method="post">
							<input type="submit" class="btn btn-success delete"  id ="delete" value="삭제" />
						</form>
					</td>
					</c:if>	
				</tr>
				</c:forEach>
			</thead>	
		</table>
	
		
		<h4 style="font-weight:bold;">댓글쓰기</h4>
		<form action="/party_reply/insert?no=${obj.ptyno}" method="post">
		<table class="table table-sm">
			<thead>
				<tr>
					<td>아이디 : <input type="text"   id="userid"  name="userid" value="${userid}" readonly /></td>		
				</tr>
				<tr>
					<td>댓글내용 : <textarea id="createreply" name="createreply" value="${rpcontent}" placeholder="댓글을 입력해주세요"></textarea></td>
				</tr>
				<tr>			
					<td><input type="submit" class="btn btn-success" value="등록" id="insert"/></td>
				</tr>	
			</thead>
		</table>
		</form> 
		
	</div>
</div>
	<!-- end section -->
	
	<br/><br/><br/><br/><br/><br/>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
</body>
	<!-- ALL JS FILES -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.pogo-slider.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/slider-index.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/smoothscroll.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/form-validator.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/contact-form-script.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/isotope.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/images-loded.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
    <!-- PAGINATION -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
	
	<script>
		$(function(){  //$( document ).ready(function() {

			$('.update').bind('click',function(){
				var idx = $(this).index('.update');
				console.log(idx)
			
				var a = $('.updatereply').eq(idx).val();
				if( a.trim() == ""){
					alert("작성한 댓글 내용이 없습니다.");
				}else{
					alert("댓글이 수정되었습니다.");
					$('.rpcontent').eq(idx).val(a);
					$('.form').eq(idx).submit();
				}
				
			});

			$('#delete').bind('click',function(){
				alert("댓글이 삭제되었습니다.")
			})	

 			$('#insert').bind('click',function(){
				var reply = $('#createreply').val();
				alert('#createreply'.val());
			}) 
				
			//하트	
			var pos = 0,
			dpos = 3.5714,
			cycle,
			heart = false,
			animating = false;
			var chk=0;
			
			<c:if test="${likechk eq 1}">
				    animating = true;
				    animate();
				    chk=1;
			</c:if>

			
			$('heart').click(function(){

				 if(heart && !animating){
				    $('heart').css('background-position','0 0');
				    alert("좋아요를 취소하셨습니다.");
				    chk=0;
				    heart = false;
				  }else if(!animating){
					alert("이 글을 좋아요 하셨습니다.");
				    animating = true;
				    animate();
				    chk=1;
				  }

					var id = $('#uid').val();
					var ptyno = $('#obj.ptyno').val();
					var likechk = $('#like').val();
	
					$.ajax({
						url: "/party/content.json",
						dataType : 'json',
						data : JSON.stringify({userid:"${uid}",ptyno:"${obj.ptyno}", likechk:chk}),
						processData: false,
						contentType: "application/json; charset=utf-8",
						type: 'POST',
						success: function (res) {
						    console.log(res);
						},error: function (xhr) {
						  alert(xhr.responseText);
						} 
					});
	
				});
	
				function animate(){
				  cycle = setInterval(increment,30);
				}
	
				function increment(){
				  pos += dpos;
				  if(pos > 100){
				    clearInterval(cycle);
				    heart = true;
				    animating = false;
				    pos = 0;
				  }else{
				    $('heart').css('background-position',pos+'% 0');
				  }
				}
	
			});

	</script>	
	
	<script>
	/* counter js */
	
	(function ($) {
		$.fn.countTo = function (options) {
			options = options || {};
			
			return $(this).each(function () {
				// set options for current element
				var settings = $.extend({}, $.fn.countTo.defaults, {
					from:            $(this).data('from'),
					to:              $(this).data('to'),
					speed:           $(this).data('speed'),
					refreshInterval: $(this).data('refresh-interval'),
					decimals:        $(this).data('decimals')
				}, options);
				
				// how many times to update the value, and how much to increment the value on each update
				var loops = Math.ceil(settings.speed / settings.refreshInterval),
					increment = (settings.to - settings.from) / loops;
				
				// references & variables that will change with each update
				var self = this,
					$self = $(this),
					loopCount = 0,
					value = settings.from,
					data = $self.data('countTo') || {};
				
				$self.data('countTo', data);
				
				// if an existing interval can be found, clear it first
				if (data.interval) {
					clearInterval(data.interval);
				}
				data.interval = setInterval(updateTimer, settings.refreshInterval);
				
				// initialize the element with the starting value
				render(value);
				
				function updateTimer() {
					value += increment;
					loopCount++;
					
					render(value);
					
					if (typeof(settings.onUpdate) == 'function') {
						settings.onUpdate.call(self, value);
					}
					
					if (loopCount >= loops) {
						// remove the interval
						$self.removeData('countTo');
						clearInterval(data.interval);
						value = settings.to;
						
						if (typeof(settings.onComplete) == 'function') {
							settings.onComplete.call(self, value);
						}
					}
				}
				
				function render(value) {
					var formattedValue = settings.formatter.call(self, value, settings);
					$self.html(formattedValue);
				}
			});
		};
		
		$.fn.countTo.defaults = {
			from: 0,               // the number the element should start at
			to: 0,                 // the number the element should end at
			speed: 1000,           // how long it should take to count between the target numbers
			refreshInterval: 100,  // how often the element should be updated
			decimals: 0,           // the number of decimal places to show
			formatter: formatter,  // handler for formatting the value before rendering
			onUpdate: null,        // callback method for every time the element is updated
			onComplete: null       // callback method for when the element finishes updating
		};
		
		function formatter(value, settings) {
			return value.toFixed(settings.decimals);
		}
	}(jQuery));
	
	jQuery(function ($) {
	  // custom formatting example
	  $('.count-number').data('countToOptions', {
		formatter: function (value, options) {
		  return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
		}
	  });
	  
	  // start all the timers
	  $('.timer').each(count);  
	  
	  function count(options) {
		var $this = $(this);
		options = $.extend({}, options || {}, $this.data('countToOptions') || {});
		$this.countTo(options);
	  }
	});
	</script>
</html>
