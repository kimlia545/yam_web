<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
 <meta charset="utf-8">   
<script src="https://kit.fontawesome.com/0779db264d.js" crossorigin="anonymous"></script>
</head> 
<body>

<table>
<thead><td colspan="2"><h3>당신의 친구들이 자주 찾은 장소 TOP5</h3></td></thead>
<tbody>
<tr>
<td>
<div id="map" style="width:400px;height:350px;"></div></td>
<td>
<c:forEach var="tmp" items="${list}">
  <p>
  	<b>${tmp.top}. ${tmp.shop_name}</b>  

	  <c:forEach begin="1" end="${tmp.star}">
	  <i class="fas fa-star" style="color:rgb(253, 255, 106)"></i>
	  </c:forEach> 
  </p>
</c:forEach>
</td>
</tbody>
</table>

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
// 마커 이미지의 이미지 크기 입니다
var imageSize = new kakao.maps.Size(24, 35); 
// 마커 이미지를 생성합니다    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
var data;
$(function(){
		$.get('/rest/shoptop5.json', function(data){
			this.data = data;
			console.log(data);
			var bounds = new kakao.maps.LatLngBounds();
			for (var i = 0; i < data.data.length; i ++) {
			    
			   
			    var placePosition = new kakao.maps.LatLng(data.data[i].y, data.data[i].x);
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: placePosition, // 마커를 표시할 위치
			        title : data.data[i].shop_name,// 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 		        
			    }); 
			    
			    bounds.extend(placePosition);
			    }	
			map.setBounds(bounds);						
			}, 'json');	
			
		});
 
</script>
</body>
</html>