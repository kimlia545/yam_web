<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- Site Metas -->
    <title>SHOP - YAM</title>
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
    <script src="https://kit.fontawesome.com/0779db264d.js" crossorigin="anonymous"></script>
 
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
				    <h3>SHOP</h3>
				 </div>
			  </div>
			</div>
		 </div>
	  </div>
    <!-- end Banner -->
	<div class="container">
		<br/>
<div id="button" style="margin:10px;">
			<div id="move" style="float:left; margin-bottom:10px;">
				<a href="${pageContext.request.contextPath}/shop/list" class="btn btn-success" style="margin-right:2px;">전체목록</a>
				</div>
			<div id="search" style="float:right">			
			<form action="${pageContext.request.contextPath}/shop/list" method="get">
				<input type="hidden" name="page" value="1"/>
				<input type="text" name="text" class="form-control" placeholder="검색어" style="width:75%; float:left;"/>
				<input type="submit" class="btn btn-success" value="검색" style="float:right"/>
			</form>
			</div>
			</div>
<table class="table table-sm" style="table-layout: fixed;">
			<thead style="text-align:center;">
				<tr>
					<th style="width:5%; text-align:center;">번호</th>
					<th style="width:20%;text-align:center;">가게명</th>
					<th style="width:15%;text-align:center;">전화번호</th>
					<th >카테고리</th>
					<th >주소</th>
					<th style="width:11%; text-align:center;">별점</th>
					<th style="width:7%;">더보기</th>
				
				</tr>
			</thead>
			
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="6" align=center> 검색결과가 없습니다. </td> <!--VO 변수명-->
					</tr>
				</c:if>		
				<c:if test="${!empty list}" >
				<c:forEach var="tmp" items="${list}">
				<tr>
				   	<td style="text-align:center;">${tmp.shop_no}</td>
					<td style="text-align:center; vertical-align:middle; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"><a href ="/shop/content?no=${tmp.shop_no}">${tmp.shop_name}</a></td>				
					<td style="text-align:center;">${tmp.shop_tel}</td>
					<td style="text-align:left; vertical-align:middle; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${tmp.shop_dep}</td>
					<td style="text-align:left;vertical-align:middle; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${tmp.shop_adr}</td>
					<td style="text-align:center;">
					<c:forEach begin="1" end="${tmp.star}">
	  			<i class="fas fa-star" style="color:rgb(253, 255, 106)"></i>
	  				</c:forEach>	  				
	  				<c:forEach begin="1" end="${5-tmp.star}" step="1">
	  			<i class="fas fa-star" style="color:#dedee0dc"></i>
	  				</c:forEach>
					</td>
					<td style="text-align:center;"><a href="https://place.map.kakao.com/${tmp.map_id}" target="_blank">...</a></td>
				</tr>
				</c:forEach>
				</c:if>
			</tbody>			
		</table>
		
			<div id="pagination-div" style="position: absolute; left: 50%; transform: translatex(-50%);"></div>		
	
		<br/><br/><br/>	
		
<%-- <h4>당신의 친구들이 자주 찾은 장소 TOP RANK</h4>
<table>
<tbody>
<tr>
<td>
<div id="map" style="width:400px;height:350px;"></div></td>
<td>
<c:forEach var="tmp" items="${list1}">
  <p>
  	<b>&nbsp&nbsp&nbsp&nbsp${tmp.top}. ${tmp.shop_name}</b>  

	  <c:forEach begin="1" end="${tmp.star}">
	  <i class="fas fa-star" style="color:rgb(253, 255, 106)"></i>
	  </c:forEach> 
  </p>
</c:forEach>
</td>
</tbody>
</table> --%>
<br/><br/><br/>
</div>

	<!-- end section -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>


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

<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
<script>
		$(function(){
			$('#pagination-div').twbsPagination({
		        totalPages: Number('${cnt}'),
		        visiblePages: 10,
		        startPage : Number('${param.page}'),
		        initiateStartPageClick : false,
			    first : "<<",
			    prev : "<",
			    next : ">",
			    last : ">>",
		        onPageClick: function (event, page) {
		             window.location.href = "/shop/list?page="+page+"&text=${param.text}";
		        }
		    });
		})
	</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=073a87b4e20a3e00a4c2afca4e7cafca"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.1631872,129.0633782), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


// 마커를 표시할 위치와 title 객체 배열입니다 


// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

var data;
$(function(){
		$.get('/rest/shoptop5.json', function(data){
			this.data = data;
			console.log(data);
			var bounds = new kakao.maps.LatLngBounds();
			for (var i = 0; i < data.data.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: new kakao.maps.LatLng(data.data[i].y, data.data[i].x), // 마커를 표시할 위치
			        title : data.data[i].shop_name,// 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 		        
			    }); 
			    var placePosition = new kakao.maps.LatLng(data.data[i].y, data.data[i].x);
			    bounds.extend(placePosition);
			    map.setBounds(bounds);
			    }							
			}, 'json');	
			
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
</body>
</html>