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
				    <h3>REVIEW</h3>
				 </div>
			  </div>
			</div>
		 </div>
	  </div>
    <!-- end Banner -->
    
	<!-- section -->
	
	<div class="container">

		<form action="${pageContext.request.contextPath}/review/update" method="post" enctype="multipart/form-data">
		<div>
		<h4>리뷰 수정</h4>
			<table class="table table-sm">
			<thead style="margin-left:20%">
			<tr>
	     			<td><input type="text"  style="border:none; margin-top:10px; background-color: white;
	     			font-size:17px;margin-left: 5%" class="form-control" name="userid" value="${obj.userid}" readonly /></td>
	     			<td rowspan="5">
					<img style="cursor:pointer; max-width:400px; width:350px; height:auto; float:right; margin-top:30px; margin-right:100px;" 
			 	id="imgpreview" src="${pageContext.request.contextPath}/review/getimg?no=${obj.rvno}" />
				<input type="file" name="img" id="img" style="display:none;">
				</td>
	    	</tr>
			<tr>
					<td>
					<!-- <input type="number" class="form-control" name="score" value="${obj.score}" /> -->
					<i class="fa fa-map-marker" 
					style="margin-left:30px;font-size:25px; background:#fff;color:#f2184f;" aria-hidden="true"></i>	
					<input type="hidden" class="form-control" name="rvno" value="${obj.rvno}"/>
					<input type="hidden" class="form-control" name="shopno" value="${obj.shopno}"/>					
					<input autocomplete="off" type="text" style="cursor:pointer; padding: 10px; border:0px; font-weight: bold;" required 
					name="realresult" id="realresult" value="${obj.shop_name}"  readonly>
					</td>
				</tr>
				<tr>				
					<td>
					
					<c:forEach var="i" begin="1" end="5">
				<c:if test="${obj.score == i}">
				<input type="radio" name="score" value="${i}" checked="checked" style="margin-left:35px;"> <!-- <c:out value="${i}"/>   --> 
					<c:forEach begin="1" end="${i}">
	  					<i class="fas fa-star" style="color:rgb(253, 255, 106)"></i>
	  				</c:forEach>	  				
	  				<c:forEach begin="1" end="${5-i}" step="1">
	  					<i class="fas fa-star" style="color:#dedee0dc"></i>
	  				</c:forEach> <br/>
				</c:if>
				
				<c:if test="${obj.score != i}">
				<input type="radio" name="score" value="${i}" style="margin-left:35px;"> <!-- <c:out value="${i}"/>   --> 
					<c:forEach begin="1" end="${i}">
	  					<i class="fas fa-star" style="color:rgb(253, 255, 106)"></i>
	  				</c:forEach>	  	
	  				<c:forEach begin="1" end="${5-i}" step="1">
	  					<i class="fas fa-star" style="color:#dedee0dc"></i>
	  				</c:forEach><br/>			
				</c:if>
			</c:forEach></td>
				</tr>
				<tr>
					<td style="margin-left:30px;">
					<input type="text" class="form-control" style="font-size:17px;border:none;margin-left: 5%" name="menu" value="${obj.menu}" /></td>
				</tr>
				<tr>
					<td><textarea  style="font-size:17px;border:none;margin-left: 5%" id="content" class="form-control" name="content" rows ="8">${obj.content}</textarea></td> 
				</tr>

	    			</thead>
		</table>			
	</div>
		<div id="button" style="float:left; width:100%;">
			<input type="submit" style="margin:10px" class="btn btn-success" value="글 수정" />
			<a href="${pageContext.request.contextPath}/review/list" class="btn btn-success">돌아가기</a>
		</div>
		</form>
	</div>
		<br/><br/><br/>
		

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
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(function(){ //jQuery 문법 상용

			$('#imgpreview').click(function(){
				$('#img').click();
			})
			
			//태그중에서 id="img" 인것을 찾아 변경이 되면 반응
			$('#img').on('change', function(){
				var img = this; //읽은 이미지를 img변수에 보관함
				if(img.files && img.files[0]) { //img변수에 이미지가 있다면
					var reader = new FileReader();
					reader.onload = function(e){
						//이미지를 읽어서 id="imgpreview" 인곳의 src를 읽은 이미지로 변경
						$('#imgpreview').attr('src', e.target.result);
					}
					reader.readAsDataURL(img.files[0]);
				}
			})
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