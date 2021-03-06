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
    

</head>

<body id="about" class="inner_page" data-spy="scroll" data-target="#navbar-wd" data-offset="98">
   
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>

    <!-- Start Banner -->
	  <div class="section inner_page_header">
	     <div class="container">
		    <div class="row">
              <div class="col-lg-12">
			     <div class="full">
				    <h3>SHOP</h3>
				 </div>
			  </div>
			</div>
		 </div>
	  </div>
    <!-- end Banner -->
    
	<!-- section -->
	<div class="container" style="width:100%">
	<h4 style="font-weight:bold;">가게 상세</h4>
		<hr/>

	<!-- 가게 정보  -->
	<div>
	<div style="width:45%; display: inline-block; margin-top:20px; margin-left:20px">
 		<div style="text-align:center;">
		<span style="font-weight:bold; font-size: 30px;">${obj.shop_name}&nbsp;</span>
		<span style="text-align:left;"> 
			<c:forEach begin="1" end="${obj.star}">
	  			<i class="fas fa-star" style="color:rgb(253, 255, 106); font-size:25px"></i>
	  				</c:forEach>	  				
	  				<c:forEach begin="1" end="${5-obj.star}" step="1">
	  			<i class="fas fa-star" style="color:#dedee0dc; font-size:25px"></i>
	  				</c:forEach>
		 </span>
		</div>
		<div style="text-align:center;">
		<span style="margin:5px;font-size: 17px;">${obj.shop_tel}</span>
		<span style="margin:5px;font-size: 17px;">${obj.shop_adr}</span>
	 	</div>
	 	<div style="text-align:center;font-size: 17px;">
	 	<span> ${obj.shop_dep}</span>
	 	</div >
	 	<div style="text-align:center; margin-bottom:50px;font-size: 17px;">
	 	<a href="https://place.map.kakao.com/${obj.map_id}" target="_blank">더보기</a>
	 	</div>
	 	</div>
	 <!-- 지도 or 이미지  -->
	 	<div id="map" style="width: 400px; height: 300px;float:right; margin-right:80px; margin- width:45%; display: inline-block;">		
		</div>
		</div>

<!-- 리뷰  -->
	<br><br><br><br><br><br>	
	 	<div style="width:90%; margin-left:40px">	
	 	<c:if test="${!empty list}" >
	 	<c:forEach var="rv" items="${list}">
	 	<div style="padding:10px; margin-bottom:10px;border:1px solid pink; border-radius:2em;">
	 	<a href="${pageContext.request.contextPath}/review/content?no=${rv.rvno}">
	 	<span style="margin:10px; font-style:italic;margin-left:20px;"> <b> <c:set var="dt" value="${fn:split(rv.rvdate, ' ')}" />${dt[0]}</b></span>
	 	<div>
	 		<span style="margin:5px; margin-left:20px;">
	 		<c:forEach begin="1" end="${rv.score}">
	  			<i class="fas fa-star" style="color:rgb(253, 255, 106); font-size:20px"></i>
	  				</c:forEach>	  				
	  				<c:forEach begin="1" end="${5-rv.score}" step="1">
	  			<i class="fas fa-star" style="color:#dedee0dc; font-size:20px"></i>
	  				</c:forEach></span>
	 		<span style="margin:10px;font-size:17px;">${rv.content}</span>
	 		<span style="float:right; font-style:italic; margin-right:30px;">${rv.userid}</span>
	 	</div></div>
	 	</a>
	 	</c:forEach>
		</c:if>
		</div>
	
		<div id="button" style="margin-top:30px;">
		
			<div id="movebutton" style="float:left; margin:10px; width:70%">
				<a href="${pageContext.request.contextPath}/shop/list" style=" margin:5px;" class="btn btn-success">목록</a>
				<a href="${pageContext.request.contextPath}/review/insert" class="btn btn-success">리뷰 쓰기</a>
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=073a87b4e20a3e00a4c2afca4e7cafca"></script>
<script>
/* map  */
 
var currentPosition = new kakao.maps.LatLng(35.1633305253161,  129.06315035329217);
var placePosition  = new kakao.maps.LatLng(${obj.y},${obj.x}); 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: placePosition, // 지도의 중심좌표
        level: 5// 지도의 확대 레벨
    };
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
//마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
// 마커 이미지의 이미지 크기 입니다
var imageSize = new kakao.maps.Size(24, 35); 
// 마커 이미지를 생성합니다    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
//마커를 생성합니다
var marker = new kakao.maps.Marker({
 position: placePosition,
 map : map,
 image : markerImage, // 마커 이미지 
 title : '${obj.shop_name}'// 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
});
var marker2 = new kakao.maps.Marker({
	 position: currentPosition,
	 map : map,
	 title : '현재 위치'// 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	});
//마커가 지도 위에 표시되도록 설정합니다
var bounds = new kakao.maps.LatLngBounds();
bounds.extend(placePosition);
bounds.extend(currentPosition);
map.setBounds(bounds);
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