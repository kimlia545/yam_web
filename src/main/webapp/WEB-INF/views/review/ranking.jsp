<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- Site Metas -->
    <title>RANKING - YAM</title>
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
        .tab ul{list-style:none;margin:0;padding:0;}
        .tab ul.title li:first-child {margin-left:0;}
        .tab ul.title li {float:left; margin-left:5px; margin-bottom:5px;}
        .tab ul.title li a {display:block; padding:5px 10px;}
        .tab ul.title li a.show {border-bottom:3px solid #ffabab; font-weight:700;}
        .tab ul.title li a:hover {font-weight:700;}
        .tab ul.title:after {content:""; display:block; clear:both; }
        .tab ul.panel li{display:none; overflow:hidden; http://127.0.0.1:8080/}
	</style>
	<style type"text/css">
		a:link {text-decoration:none;}
		a:visited {text-decoration:none;}
		a:active {text-decoration:none;}
		a:hover {text-decoration:none; color:#000;}
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
	     <div class="container"">
		    <div class="row">
              <div class="col-lg-12">
			     <div class="full">
				    <h3>RANKING</h3>
				 </div>
			  </div>
			</div>
		 </div>
	  </div>
    <!-- end Banner -->
	
<div class="container">
<div id="row-1" class="container" style="display:inline-block; width:50%; margin:0; padding:0 3%;">
	<h4 style="text-align:center; font-weight:bold;">TOTAL</h4>
    <div class="tab">
      <ul class="title">
        <li><a href="#" class="show" id="tab-1">TOTAL</a></li>
        <li><a href="#" id="tab-2">FEMALE</a></li>
        <li><a href="#" id="tab-3">MALE</a></li>
      </ul>
      <ul class="panel">
        <li id="content-1">
            <table class="table table-sm" style="table-layout: fixed;">
                <thead style="text-align:center;">
                    <tr>
                        <th style="width:70%; vertical-align:middle;">가게</th>
                        <th style="width:30%;">방문수</th>
                    </tr>
                </thead>
                    
                <tbody>
                    <c:forEach var="tmp" items="${list1}">
                    <tr>
                        <td>${tmp.shop_name}</td>
                        <td style="text-align:center; vertical-align:middle;">${tmp.cnt}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table><br/>
            
            <table class="table table-sm" style="table-layout: fixed;">
                <thead style="text-align:center;">
                    <tr>
                        <th style="width:70%; vertical-align:middle;">가게</th>
                        <th style="width:30%;">별점</th>
                    </tr>
                </thead>
                    
                <tbody>
                    <c:forEach var="tmp" items="${listavg1}">
                    <tr>
                        <td>${tmp.shop_name}</td>
                        <td style="text-align:center; vertical-align:middle;">
                            <fmt:formatNumber value="${tmp.avg}" pattern="#.#"/>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </li>

        <li id="content-2">
            <table class="table table-sm" style="table-layout: fixed;">
                <thead style="text-align:center;">
                    <tr>
                        <th style="width:70%; vertical-align:middle;">가게</th>
                        <th style="width:30%;">방문수</th>
                    </tr>
                </thead>
                    
                <tbody>
                    <c:forEach var="tmp" items="${list2}">
                    <tr>
                        <td>${tmp.shop_name}</td>
                        <td style="text-align:center; vertical-align:middle;">${tmp.cntf}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table><br/>
            <table class="table table-sm" style="table-layout: fixed;">
                <thead style="text-align:center;">
                    <tr>
                        <th style="width:70%; vertical-align:middle;">가게</th>
                        <th style="width:30%;">별점</th>
                    </tr>
                </thead>
                    
                <tbody>
                    <c:forEach var="tmp" items="${listavg2}">
                    <tr>
                        <td>${tmp.shop_name}</td>
                        <td style="text-align:center; vertical-align:middle;">
                            <fmt:formatNumber value="${tmp.avgf}" pattern="#.#"/>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </li>

        <li id="content-3">
            <table class="table table-sm" style="table-layout: fixed;">
                <thead style="text-align:center;">
                    <tr>
                        <th style="width:70%; vertical-align:middle;">가게</th>
                        <th style="width:30%;">방문수</th>
                    </tr>
                </thead>
                    
                <tbody>
                    <c:forEach var="tmp" items="${list3}">
                    <tr>
                        <td>${tmp.shop_name}</td>
                        <td style="text-align:center; vertical-align:middle;">${tmp.cntm}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table><br/>
            
            <table class="table table-sm" style="table-layout: fixed;">
                <thead style="text-align:center;">
                    <tr>
                        <th style="width:70%; vertical-align:middle;">가게</th>
                        <th style="width:30%;">별점</th>
                    </tr>
                </thead>
                    
                <tbody>
                    <c:forEach var="tmp" items="${listavg3}">
                    <tr>
                        <td>${tmp.shop_name}</td>
                        <td style="text-align:center; vertical-align:middle;">
                            <fmt:formatNumber value="${tmp.avgm}" pattern="#.#"/>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>		
        </li> 
      </ul>
    </div>
  </div>
  


  <div  id="row-2" class="container" style="float:right; width:50%; margin:0; padding:0 3%;">
	<h4 style="text-align:center; font-weight:bold;">7DAYS</h4>
    <div class="tab">
      <ul class="title">
        <li><a href="#" class="show"  id="tab-4">TOTAL</a></li>
        <li><a href="#" id="tab-5">FEMALE</a></li>
        <li><a href="#" id="tab-6">MALE</a></li>
      </ul>
      <ul class="panel">
        <li id="content-4">
            <table class="table table-sm" style="table-layout: fixed;">
                <thead style="text-align:center;">
                    <tr>
                        <th style="width:70%; vertical-align:middle;">가게</th>
                        <th style="width:30%;">방문수</th>
                    </tr>
                </thead>
                    
                <tbody>
                    <c:forEach var="tmp" items="${listcntweek1}">
                    <tr>
                        <td>${tmp.shop_name}</td>
                        <td style="text-align:center; vertical-align:middle;">${tmp.cnt}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table><br/>

            <table class="table table-sm" style="table-layout: fixed;">
                <thead style="text-align:center;">
                    <tr>
                        <th style="width:70%; vertical-align:middle;">가게</th>
                        <th style="width:30%;">별점</th>
                    </tr>
                </thead>
                    
                <tbody>
                    <c:forEach var="tmp" items="${listavgweek}">
                    <tr>
                        <td>${tmp.shop_name}</td>
                        <td style="text-align:center; vertical-align:middle;">
                            <fmt:formatNumber value="${tmp.avg}" pattern="#.#"/>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </li>
        <li id="content-5">
            <table class="table table-sm" style="table-layout: fixed;">
                <thead style="text-align:center;">
                    <tr>
                        <th style="width:70%; vertical-align:middle;">가게</th>
                        <th style="width:30%;">방문수</th>
                    </tr>
                </thead>
                    
                <tbody>
                    <c:forEach var="tmp" items="${listcntweekf}">
                    <tr>
                        <td>${tmp.shop_name}</td>
                        <td style="text-align:center; vertical-align:middle;">${tmp.cntf}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table><br/>
            <table class="table table-sm" style="table-layout: fixed;">
                <thead style="text-align:center;">
                    <tr>
                        <th style="width:70%; vertical-align:middle;">가게</th>
                        <th style="width:30%;">별점</th>
                    </tr>
                </thead>
                    
                <tbody>
                    <c:forEach var="tmp" items="${listavgweekf}">
                    <tr>
                        <td>${tmp.shop_name}</td>
                        <td style="text-align:center; vertical-align:middle;">
                            <fmt:formatNumber value="${tmp.avgf}" pattern="#.#"/>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </li>
        <li id="content-6">
            
            <table class="table table-sm" style="table-layout: fixed;">
                <thead style="text-align:center;">
                    <tr>
                        <th style="width:70%; vertical-align:middle;">가게</th>
                        <th style="width:30%;">방문수</th>
                    </tr>
                </thead>
                    
                <tbody>
                    <c:forEach var="tmp" items="${listcntweekm}">
                    <tr>
                        <td>${tmp.shop_name}</td>
                        <td style="text-align:center; vertical-align:middle;">${tmp.cntm}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table><br/>
            
            <table class="table table-sm" style="table-layout: fixed;">
                <thead style="text-align:center;">
                    <tr>
                        <th style="width:70%; vertical-align:middle;">가게</th>
                        <th style="width:30%;">별점</th>
                    </tr>
                </thead>
                    
                <tbody>
                    <c:forEach var="tmp" items="${listavgweekm}">
                    <tr>
                        <td>${tmp.shop_name}</td>
                        <td style="text-align:center; vertical-align:middle;">
                            <fmt:formatNumber value="${tmp.avgm}" pattern="#.#"/>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>	
        </li> 
      </ul>
    </div>
</div>
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
    
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script>
    /*탭메뉴*/
    $('.tab').each(function(i) {
    var oTab = $(this);
    var tabIndex = $(this).find('.show').attr('id').match(/\d+$/);

    $(this).find('.panel').find('#content-' + tabIndex[0]).show();

    $(this).find('.title li a').click(function() {
        /*선택색인*/

        var tabIndex = $(this).attr('id').match(/\d+$/);
        /*타이틀*/
        oTab.find('.title li a').removeClass('show');
        $(this).addClass('show');

        /*패널*/
        oTab.find('.panel li').hide();
        oTab.find('.panel').find('#content-' + tabIndex[0]).show();

        return false;
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
		             window.location.href = "/review/list?page="+page+"&text=${param.text}";
		        }
		    });
		})
	</script>
</html>