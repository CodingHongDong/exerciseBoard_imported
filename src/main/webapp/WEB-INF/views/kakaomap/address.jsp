<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 지도 api</title>
</head>
<body>

	<div id="map" style="width:500px;height:400px; "></div>
		<p><em>지도를 클릭해주세요!</em></p> 				
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1cb75304bbdee6e20b06e355e68a28d"></script>
		<script>

			var mode = '${mode}';
			
			if(mode == 'view'){
				var voLat = '${vo.lat}';
				var voLng = '${vo.lng}';
			}
			console.log('mode: ' + mode + ', voLat :' +voLat+ ', voLng:' + voLng);
			var centerLat = (mode == 'view') ? voLat : '37.56658990880107';
			var centerLng = (mode == 'view') ? voLng : '126.9784599023243';
			
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(centerLat, centerLng),
				level: 3
			};
	
			var map = new kakao.maps.Map(container, options);
			
			// 지도를 클릭한 위치에 표출할 마커입니다
			var marker = new kakao.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter() 
			}); 
			// 지도에 마커를 표시합니다
			marker.setMap(map);
			
			// 지도에 클릭 이벤트를 등록합니다
			// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
			if(mode == 'write'){
				kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
									
			    // 클릭한 위도, 경도 정보를 가져옵니다 
			    var latlng = mouseEvent.latLng; 
			    
			    
			    const lat = latlng.getLat();
				const lng = latlng.getLng();
			    
			    // 마커 위치를 클릭한 위치로 옮깁니다
			    marker.setPosition(latlng);
			        
				console.log('lat: '+lat + ' ,lng: ' + lng);
				
				document.getElementById("lat").value = lat;
				document.getElementById("lng").value = lng;
			    console.log('refreshed');
				});
			}
		</script>
	
</body>
</html>