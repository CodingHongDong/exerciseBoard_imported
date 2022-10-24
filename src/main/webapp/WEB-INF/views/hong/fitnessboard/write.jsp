<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="with=divice-width,initial-scale=1">
<link rel="stylesheet" 
		href="<c:url value="/resources/user/css/bootstrap.min.css" />">
<script src="http://code.jquery.com/jquery-2.2.3.min.js"></script>
<script src="<c:url value="/resources/user/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta charset="UTF-8">
<style type="text/css">
body {
	background-color: #afe0b3;
}
details :hover {
	text-decoration: underline;
	color: white;
}
</style>
<title>Fitness Board</title>
</head>
<body>
<form action="write.do" method="post">
<input type="hidden" name="perPageNum" value="${param.perPageNum }">
<div class="container">
<h2>Fitness 게시판 > 글쓰기</h2>
<table class="table">
	<tr>
		<th>제목</th>
		<td><input name="title"></td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td><textarea rows="5" style="width: 600px;" name="content"></textarea> </td>
	</tr>
	
	<tr>
		<th>작성자</th>
		<td><input name="memberId" value="${login.getId()}" readonly="readonly"></td>
	</tr>
	<tr>
		<th>위치</th>
		<td>
			<details>
				<summary>위치보기</summary>
					<div id="map" style="width:500px;height:400px; "></div>
					<p><em>지도를 클릭해주세요!</em></p> 
					
					<div id="clickLatlng"></div>
					
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1cb75304bbdee6e20b06e355e68a28d"></script>
					<script>
						var container = document.getElementById('map');
						var options = {
							center: new kakao.maps.LatLng(37.56658990880107, 126.9784599023243),
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
						kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
						    
					    // 클릭한 위도, 경도 정보를 가져옵니다 
					    var latlng = mouseEvent.latLng; 
					    
					    // 마커 위치를 클릭한 위치로 옮깁니다
					    marker.setPosition(latlng);
					    
					    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
					    message += '경도는 ' + latlng.getLng() + ' 입니다';
					    
					    var resultDiv = document.getElementById('clickLatlng'); 
					    resultDiv.innerHTML = message;
						    
						});
						
						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						var mapTypeControl = new kakao.maps.MapTypeControl();
				
						// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
						// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
						map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
				
						// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
						var zoomControl = new kakao.maps.ZoomControl();
						map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
						
					</script>
					<input type="text" name="lat">
					<input type="text" name="lng">
			</details> 
		</td>
	</tr>
	
	<tr>
		<td colspan="2"><button class="btn btn-default">등록</button></td>
	</tr>
</table>
</div>
</form>
</body>
</html>