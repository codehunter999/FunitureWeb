<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp%>/resources/assets/img/location/container.png">
         <div class="container">
        	<div class="row">
        		<div class="col-xs-4">
        		</div>
        		<div class="col-xs-4">
        			<h1><font style="color: white">Company.Fu  : 분당점</font></h1>
        		</div>
        	</div>
         </div>
        </section>
        <!-- Breadcrumb area End -->
        <br/><br/>
        <div class="container">
        	<img src="<%=cp%>/resources/assets/img/location/BunDang1.png">
        </div>
        <br/><br/>
      	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15ede2a09176a10f01d66f34374f9688"></script>
		<div id="map" style="width:90%;height:250px;margin-left: 130px"></div>
		<script type="text/javascript">	
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(37.367253,127.107593), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				};	
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다	
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(37.367253,127.107593); 
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
		
				// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
				// marker.setMap(null);    
				var iwContent = '<div style="padding:5px;">company.fu<br/> 분당점', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    	
				iwPosition = new kakao.maps.LatLng(37.367253,127.107593); //인포윈도우 표시 위치입니다
		
				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent 
				});				  
				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				infowindow.open(map, marker); 
			</script>

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>			