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
    <title>REVIEW - ADMIN</title>
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

    <!-- LOADER -->
    <div id="preloader">
        <div class="loader">
            <img src="${pageContext.request.contextPath}/resources/images/loader.gif" alt="#" />
        </div>
    </div>
    <!-- END LOADER -->
   
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>

    <!-- Start Banner -->
	  <div class="section inner_page_header">
	     <div class="container">
		    <div class="row">
              <div class="col-lg-12">
			     <div class="full">
				    <h3>ADMIN</h3>
				 </div>
			  </div>
			</div>
		 </div>
	  </div>
    <!-- end Banner -->
    
	<!-- section -->
	<div class="container">
		<div id="button" style="margin:10px;">
			<div id="move" style="float:left; margin-bottom:10px;">
				<a href="${pageContext.request.contextPath}/review/list" class="btn btn-success" style="margin-right:2px;">전체목록</a>
				<a href="${pageContext.request.contextPath}/review/insert" class="btn btn-success" style="margin-right:10px;">글쓰기</a>
			</div>
			
			<div id="search" style="float:right">			
			<form action="${pageContext.request.contextPath}/review/list" method="get">
				<input type="hidden" name="page" value="1"/>
				<input type="text" name="text" class="form-control" placeholder="검색어" style="width:75%; float:left;"/>
				<input type="submit" class="btn btn-success" value="검색" style="float:right"/>
			</form>
			</div>
		</div>
		<form action="/admin/review" method="post">
		<input type="submit" name="btn" class="btn btn-success" value="일괄삭제" />
		<table class="table table-sm" style="table-layout: fixed;">
			<thead style="text-align:center;">
				<tr>
					<th style="width:3%;">체크</th>
					<th style="width:3%;">번호</th>
					<th style="width:20%;">내용</th>
					<th style="width:10%;">가게</th>
					<th style="width:5%;">별점</th>
					<th style="width:10%;">작성자</th>
					<th style="width:7%;">작성일</th>
				</tr>
			</thead>
			
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="6" align=center>결과가 없습니다.</td>
					</tr>
				</c:if>
		
				<c:if test="${!empty list}">
				<c:forEach var="tmp" items="${list}">
				<tr style="text-align:center;">
					<td><input type="checkbox" name="chk[]" value="${tmp.rvno}"/></td>
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
		</form>
		
		<div id="pagination-div" style="position: absolute; left: 50%; transform: translatex(-50%);"></div>

	</div>
	<!-- end section -->
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
	<!-- Pagination -->
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
</html>