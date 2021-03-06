<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Site Metas -->
    <title>LOGIN - YAM</title>
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
	
	<br/><br/><br/><br/>
	
	<div class="container">
	<form action="${pageContext.request.contextPath}/member/join" method="post">
 	<input type="text" class="form-control" name="userid" id="userid" placeholder="ID"/>
	<input type="button" id="btn" value="중복확인" />
	<input type="password" class="form-control" name="password" placeholder="password"/>
	<input type="text" class="form-control" name="username" placeholder="이름"/>
	<input type="date" class="form-control" name="birth"/>
	<input type="tel" class="form-control" name="phone" placeholder="전화번호"/>
	<select name="gender" class="form-control">
			<option value="m">남</option>
			<option value="f">여</option>
	</select>
	<input type="hidden" name="role" value="USER">
	<input type="submit" value="회원가입" />
	</form>
	
	</div>
	<br/><br/><br/><br/><br/><br/><br/>
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
    
    
    
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
	<script>
		$(function(){
			//id가 userid인 tag의 키보드가 up되면
			//$('#userid').bind('keyup',function(){
			$('#btn').bind('click',function(){
				var uid = $('#userid').val(); //입력했던 값을 받아와서 uid변수에 보관

				if (uid.length >= 3){
					//restcontroller를 호출해서 값을 받아옴
					$.get('/rest/memberidcheck.json?id=' + uid,function(data){
						//console.log("GET", data);  {"ret":1}  or {"ret":0}
						if(data.ret > 0){
							alert('사용불가');
						}
						else if(data.ret == 0){
							alert('사용가능');
						}
					}, 'json');
				}
				else{
					alert('최소3글자이상')
				}
			});
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