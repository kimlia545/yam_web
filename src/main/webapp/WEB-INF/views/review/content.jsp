<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- Site Metas -->
    <title>REVIEW - YAM</title>
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
    
    <style>
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
   
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>

    <!-- Start Banner -->
	  <div class="section inner_page_header">
	     <div class="container">
		    <div class="row">
              <div class="col-lg-12">
			     <div class="full">
				    <h3>REVIEW</h3>
				 </div>
			  </div>
			</div>
		 </div>
	  </div>
    <!-- end Banner -->
    
	<!-- section -->
	<div class="container" style="width:100%">
	
		<h4 style="font-weight:bold;">상세리뷰</h4>
		<hr/>
		
		<div id="text" style="width:45%; display: inline-block;">
		<table class="table">
			<tr>
				<td>
					${obj.userid} <text style="color:#fff;"> | <c:set var="dt" value="${fn:split(obj.rvdate, ' ')}" />${dt[0]}</text>
				</td>
			</tr>
			<tr>
			<!--  -->
				<td>
					${obj.shop_name}, ${obj.menu} &nbsp;&nbsp;&nbsp;
					
					<c:forEach begin="1" end="${obj.score}">
	  					<i class="fas fa-star" style="color:rgb(253, 255, 106)"></i>
	  				</c:forEach>	  				
	  				<c:forEach begin="1" end="${5-obj.score}" step="1">
	  					<i class="fas fa-star" style="color:#dedee0dc"></i>
	  				</c:forEach>
	  				
	  				<span>(${obj.score})</span>
					<!--  
					<span class="star-prototype">${obj.score}</span> (${obj.score})
					-->
				</td>
			</tr>
			<tr>
				<td>${obj.content}</td>
			</tr>
			<tr>
				<td>${obj.rvimg}</td>
			</tr>
		</table>
		</div>
		
		<div id="img" style="width:45%; display: inline-block;">
			<img src="${pageContext.request.contextPath}/review/getimgtp?no=${obj.rvno}"
				style=" max-height:420px; max-width:400px; width:auto; height:auto;"/><br />
		</div>
		
		<div id="button">
			<div id="movebutton" style="float:left; margin-top:5px; margin-bottom:10px; width:70%">
				<a href="${pageContext.request.contextPath}/review/list" class="btn btn-success">목록</a>
		
				<c:if test="${next != 0}">
				<a href="${pageContext.request.contextPath}/review/content?no=${next}" class="btn btn-success">
					<i class="fa fa-angle-up" aria-hidden="true"></i> 다음
				</a>
				</c:if>
				
				<c:if test="${prev != 0}">
				<a href="${pageContext.request.contextPath}/review/content?no=${prev}" class="btn btn-success">
					이전 <i class="fa fa-angle-down" aria-hidden="true"></i>
				</a>
				</c:if>
			</div>
			
			<div id="updatebutton" style="float:right; margin-top:5px;">	
				<security:authentication property="name" var="uid" />
				<c:if test="${uid eq obj.userid}">
					<a href="${pageContext.request.contextPath}/review/update?no=${obj.rvno}" class="btn btn-success">수정</a>
					<a href="${pageContext.request.contextPath}/review/delete?no=${obj.rvno}" class="btn btn-success">삭제</a>
				</c:if>
			</div>
		</div>
	
	</div>
	<!-- end section -->


	</div>
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
	
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$.fn.generateStars = function() {
	  return this.each(function(i, e) {
	    $(e).html($('<span/>').width($(e).text() * 15));
	  });
	};

	// 숫자 평점을 별로 변환하도록 호출하는 함수
	$('.star-prototype').generateStars();
</script>
</html>