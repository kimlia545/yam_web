<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    
    <!-- Site Metas -->
    <title>YAM</title>
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
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/timelinesample.css" />
   
    <script src="https://kit.fontawesome.com/0779db264d.js" crossorigin="anonymous"></script>
    
</head>

<body id="home" data-spy="scroll" data-target="#navbar-wd" data-offset="98">

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
    <div class="ulockd-home-slider">
        <div class="container-fluid">
            <div class="row">
                <div class="pogoSlider" id="js-main-slider">
                    <div class="pogoSlider-slide" style="background-image:url(${pageContext.request.contextPath}/resources/img/banner-img.png);">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="slide_text">
                                        <h3>a variety of reviews ready</h3>
                                        <br>
                                        <h4><span class="theme_color">Look for the lunch menu</span></h4>
                                        <a class="contact_bt" href="/review/list">Review</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="pogoSlider-slide" style="background-image:url(${pageContext.request.contextPath}/resources/img/banner-img2.jpg);">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="slide_text">
                                        <h3>Don't you want to eat alone?</h3>
                                        <br>
                                        <h4><span class="theme_color">Find someone to go with you</span></h4>
                                        <br>
                                        <a class="contact_bt" href="/party/list">Party</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="pogoSlider-slide" style="background-image:url(${pageContext.request.contextPath}/resources/img/banner-img3.png);">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="slide_text">
                                        <h3>We worked hard on it</h3>
                                        <br>
                                        <h4><span class="theme_color">June 2020 Mini Project</span></h4>
                                        <br>
                                        <a class="contact_bt" href="/aboutus/content">About us</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- .pogoSlider -->
            </div>
        </div>
    </div>
    <!-- End Banner -->
    
	<!-- section -->
	<div class="section layout_padding">
    <div class="container">
	<div style="width:100%;">
		<div class="write-new">
		 <a href="/review/insert" class=""><b>+ add new</b></a>
		</div>
		 <div class="container">
	    <div class="row" style="width: 1000px;">
	      <div class="timeline-centered" id="timeline" style="width: 1000px;"> <!-- 메인 라인 -->
	    
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
		          <h2><a href="#">${id}</a> <span>posted a </span><a href ="/review/content?no=${tmp.getRvno()}">review</a></h2>
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
		          <blockquote>${tmp.getContent()}</blockquote>
		          
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
	    <c:when test="${tmp.getCategory() eq 'm'.charAt(0)}">
		    <article class="timeline-entry left-aligned">
		      
		      <div class="timeline-entry-inner">
		      	<c:set var="dt" value="${fn:split(tmp.getDate(), ' ')}" />
		        <time class="timeline-time" datetime="${tmp.getDate()}">
		        	<span>${dt[0]}</span>
		        	<span>${dt[1]}</span>
		        </time>
		        
		        <div class="timeline-icon bg-warning">
		          <i class="entypo-feather"></i>
		        </div>
		        
		        <div class="timeline-label">
		          <h2><a href="#">${id}</a> <span>posted a </span><a href ="/review/content?no=${tmp.getRvno()}">party</a></h2>
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
		          <h2><a href="#">${id}</a> <span>is going to go</span> <a href="#">${tmp.getShop_name()}</a></h2>
		          <blockquote>${tmp.getContent()}</blockquote>
		          
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
		        
		        <div class="timeline-icon bg-danger">
		          <i class="entypo-suitcase"></i>
		        </div>
		        
		        <div class="timeline-label">
		          <h2><a href="#">${id}</a> <span>posted a </span><a href ="/party/content?no=${tmp.getRvno()}">party</a></h2>
		          <p>${tmp.getContent()}</p>
		        </div>
		      </div>
		      
		    </article>
	    </c:when>
	    </c:choose>
	    
	    </c:forEach>
	        
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
	 </div>
	 </div>
	 
	<!-- end section -->

	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

    <a href="#" id="scroll-to-top" class="hvr-radial-out"><i class="fa fa-angle-up"></i></a>

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
</body>

</html>