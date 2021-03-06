<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<!DOCTYPE html>
<html>
<style>
.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}
</style>
<head>
<meta charset="UTF-8">
<title>동행자 글수정</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
    

<script src="https://kit.fontawesome.com/0779db264d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

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

		<form action="${pageContext.request.contextPath}/party/update" method="post" enctype="multipart/form-data">
		<div>
		<h4>동행자 글 수정</h4>
		<table class="table table-sm">
			<thead style="margin-left:20%">
			<tr>
	     			<td><input type="text"  style="border:none; margin-top:10px; background-color: white;
	     			font-size:17px;margin-left: 5%" class="form-control" name="userid" value="${obj.userid}" readonly /></td>
	     			<td rowspan="4">
					<img style="cursor:pointer; max-width:400px; width:350px; height:auto; float:right; margin-top:30px; margin-right:100px;" 
			 id="imgpreview" src="${pageContext.request.contextPath}/party/getimg?no=${obj.ptyno}" />
			<input type="file" name="img" id="img" style="display:none;">
			</td>
	    		</tr>
				<tr>
					<td style="margin-left:30px;">
					<a href='#' id="testBtn" class="btn"><i class="fa fa-map-marker" 
					style="margin-left:30px;font-size:25px; background:#fff;color:#f2184f;" aria-hidden="true"></i>	
					<input autocomplete="off" type="text" style="cursor:pointer; padding: 10px; border:0px; font-weight: bold;" required 
					name="realresult" id="realresult" value="${obj.shop_name}"  placeholder="어디를 방문하시나요?">
					<input type="hidden" name = "map_id" id="map_id" value="0">
					<input type="hidden" name="shop_name" id="shop_name">
					<input type="hidden" name="shop_adr" id="shop_adr">
					<input type="hidden" name="shop_tel" id="shop_tel">
					<input type="hidden" name="shop_dep" id="shop_dep">
					<input type="hidden" name="x" id="x">
					<input type="hidden" name="y" id="y">
					</a>
					</td>
					
				</tr>
				<tr>				
					<td><input style="font-size:17px;border:none;margin-left: 5%" type="text" class="form-control" name="ptytitle" value="${obj.ptytitle}">
					<input type="hidden" name="ptyno" id="ptyno" value="${obj.ptyno}"></td> 
				</tr>
				
				<tr>
					<td><textarea  style="font-size:17px;border:none;margin-left: 5%" id="ptycontent" class="form-control" name="ptycontent" rows ="8">${obj.ptycontent}</textarea></td> 
				</tr>
					
	    		
	    			</thead>
		</table>			
		</div>
			
			<div id="button" style="float:left; width:100%;">
			<input type="submit" style="margin:10px"  class="btn btn-success" value="글 수정" />	
			<a href="${pageContext.request.contextPath}/party/list" class="btn btn-success">돌아가기</a>
				
			</div>
		</form>
	</div>
<div class="modal fade " id="testModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog " role="document" style="width: 500px;">
			<div class="modal-content">
				
				<div class="modal-body">
				
					<div id="map" style="width: 100%; height: 300px; margin-bottom:10px;"></div>
	
					<div><input id="search" type="search" placeholder="검색어를 입력해주세요" />
					<input type ="button" value="search!" id="btn1" ></div>
					
					<div  style="display:inline-block;text-align: center; width: 100%; margin-top:10px;">			
						<table id="resulttable" border="1" style="width:100%;">
							
						</table>
					</div>				
				</div>
				<div class="modal-footer">
					<a class="btn" id="modalY" href="#" data-dismiss="modal">choose!</a>
					<button class="btn" type="button" data-dismiss="modal">cancel</button>
					</div>									
			</div>
		</div>
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
    <!-- MAP -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=073a87b4e20a3e00a4c2afca4e7cafca&libraries=services"></script> 
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(35.1633305253161, 129.06315035329217), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);

var markerPosition  = new kakao.maps.LatLng(35.1633305253161, 129.06315035329217); 
var placePosition = new kakao.maps.LatLng(35.1633305253161, 129.06315035329217);
//마커를 생성합니다
var marker = new kakao.maps.Marker({
 position: markerPosition
});
var data1;
//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
let markers = [];
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
}

$(function(){	   
	$('#testBtn').click(function(e){//모달 오픈
		e.preventDefault();
		$('#testModal').modal("show");			
	});
	
	$('#testModal').on('shown.bs.modal',function(){
		relayout();
		//var placePosition = new kakao.maps.LatLng(35.1633305253161, 129.06315035329217);
		var bounds = new kakao.maps.LatLngBounds();
		bounds.extend(placePosition);
		map.setBounds(bounds);
	})			
	$('#btn1').click(function(){//버튼을 클릭하면
		var a = $('#search').val();
		$.ajax({ //ajax 실행시킴
		    type: 'GET',
		    url: "https://dapi.kakao.com/v2/local/search/keyword.json?y=35.1631872&x=129.0633782&radius=1000&category_group_code=FD6&query=" + a,
		    headers: {"Authorization":"KakaoAK 2fdd2ed9878013db5a3cb7081157c680"}
		
		}).done(function(data) { //완료하면 데이터를 가지고		
			removeMarker();
			data1 = data;   
		    console.log(data);//콘솔에 프린트
		    
		    var n = data.documents.length;// 데이터의 길이를 가져오고
		    var bounds = new kakao.maps.LatLngBounds();
		
		  	//마커 이미지의 이미지 주소입니다
		    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png"; 
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 	    
		        
		    $('#resulttable').empty();//테이블을 비우고
		    $('#resulttable').append(
				    '<thead style="text-align:center;">'+
					'<tr><th style="text-align:center; width:6%;">선택</th>'+
						'<th style="width:3%;">NO</th>'+
						'<th style="width:20%;">가게명</th>'+
						'<th style="width:20%;">전화번호</th>'+
						'<th style="width:30%;">상세</th></tr></thead>')
		    
		        
		    for (var i=0 ;i<n;i++){//데이터 길이만큼 반복 수행
			    $('#resulttable').append(//테이블에 추가하기	
						'<tr><td><input type="radio" name="place1" value="'+i+'"></td>'+
					    '<td><b>'+(i+1)+'</b></td>'+ 
						    '<td >'+
						    '<a href="'+data.documents[i].place_url+
					    	'" target="_blank">'+data.documents[i].place_name+'</td>'+
					    	'<td title="'+data.documents[i].road_address_name+'">'+data.documents[i].phone+
					    '</td><td>'+data.documents[i].category_name+
					    '</td></tr></table>')		    
					
				    // 마커 이미지를 생성합니다    
					var imgOptions =  {
			            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			            spriteOrigin : new kakao.maps.Point(0, (i*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			        };
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);
				    // 마커를 생성하고 지도에 표시합니다
				    var placePosition = new kakao.maps.LatLng(data.documents[i].y, data.documents[i].x),
						marker = new kakao.maps.Marker({
					            map: map, // 마커를 표시할 지도
					            position: placePosition,// 마커의 위치 
					            title : data.documents[i].place_name,
					            image: markerImage 
					        });

				    
			    	bounds.extend(placePosition);
			    	markers.push(marker);
				    }
				
		
		    var placePosition = new kakao.maps.LatLng(35.1633305253161, 129.06315035329217);
				    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				    console.log(placePosition);
				    bounds.extend(placePosition);
				    map.setBounds(bounds);
			 if(data.documents.length == 0) {
				 $('#resulttable').append(//테이블에 추가하기
						 '<tr><td colspan="5"><b>"검색결과가 없습니다. 다시 검색해보세요"</b></td></tr>')
			 }
				 });	    		   
		});
	
	$('#modalY').click(function(){		
		s = $(':radio[name=place1]:checked').val();	
		$('#realresult').empty();
		$('#realresult').val(data1.documents[s].place_name);
		console.log(s)
		$('#shop_name').val(data1.documents[s].place_name);
		$('#shop_adr').val(data1.documents[s].road_address_name);
		$('#shop_tel').val(data1.documents[s].phone);
		$('#shop_dep').val(data1.documents[s].category_name);
		$('#map_id').val(data1.documents[s].id);
		$('#x').val(data1.documents[s].x);
		$('#y').val(data1.documents[s].y);				
		});

});

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  
// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

/* // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}
 */
// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}
//지도에 마커를 표시하는 함수입니다
 function displayMarker(place) {   
     // 마커를 생성하고 지도에 표시합니다
     var marker = new kakao.maps.Marker({
         map: map,
         position: new kakao.maps.LatLng(place.y, place.x) 
     });
     // 마커에 클릭이벤트를 등록합니다
     kakao.maps.event.addListener(marker, 'click', function() {
         // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
         infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
         infowindow.open(map, marker);
     });
 }

//지도 릴레이아웃
function relayout() {
	map.relayout();
}		
setTimeout(function(){map.relayout();}, 0);
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