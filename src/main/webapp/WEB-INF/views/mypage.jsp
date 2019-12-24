<%@page import="com.funi.domain.PaymentDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@include file="/WEB-INF/views/header/fu_header2.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function check(cp){
	
	var f = document.register;

	var email = f.email.value;
	if(email=="" || email==null){
		alert("Email을 입력");
		f.email.focus();
		return;
	}
	
	var password = f.password.value;
	if(password=="" || password==null){
		alert("Password를 입력하세요");
		f.password.focus();
		return;
	}
	
	var name = f.name.value;

	if(name=="" || name==null){
		alert("이름을 입력하세요");
		f.name.focus();
		return;
	}
	
	var phone2 = f.phone2.value;
	if(phone2=="" || phone2==null){
		alert("전화번호를 입력하세요");
		f.phone2.focus();
		return;
	}
	
	var addr1 = f.addr1.value;
	var addr2 = f.addr2.value;
	var addr3 = f.addr3.value;
	
	f.action = cp+"/myinfo_ok.fu";
	f.submit();
}

</script>
<script type="text/javascript"> 
	
	var mapContainer = document.getElementById('map'), 
	
	mapOption = { 
				center: new daum.maps.LatLng(37.537187, 127.005476), 
				level: 5 // 지도의 확대 레벨 
	};
	
	var map = new daum.maps.Map(mapContainer, mapOption); 
	var geocoder = new daum.maps.services.Geocoder(); 
    var marker = new daum.maps.Marker({ position: new daum.maps.LatLng(37.537187, 127.005476), map : map }); 
   
    function sample5_execDaumPostcode() { 
    	new daum.Postcode({ oncomplete: function(data) { 
    		var fullAddr = data.address; 
    		var extraAddr = '';
    		if(data.addressType === 'R'){ 
    			if(data.bname !== ''){ 
    				extraAddr += data.bname; 
    			}
			if(data.buildingName !== ''){ 
				extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName); 
			}
			fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : ''); } 
    		document.getElementById("sample5_address").value = fullAddr; 
    		geocoder.addressSearch(data.address, function(results, status) { 
    			if (status === daum.maps.services.Status.OK) { var result = results[0]; 
    			var coords = new daum.maps.LatLng(result.y, result.x); 
    			mapContainer.style.display = "block"; map.relayout(); 
    			map.setCenter(coords);
    			marker.setPosition(coords) }
    			}); 
    		} }).open(); 
    	}
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = data.zonecode;
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	                } else {
	                    document.getElementById("sample4_extraAddress").value = '';
	                }
	
	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	
	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
	</script>
	<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31d857a43c06796d21fa6fd041d12cd6&libraries=services"></script>
	
        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/assets/img/payment/completion1.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">마이페이지</h1>
                        <ul class="breadcrumb">
                            <li><a href="home.fu">Home</a></li>
                            <li class="current"><span>마이페이지</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section> 
        <!-- Breadcrumb area End -->

        <!-- Main Content Wrapper Start -->
        <div class="main-content-wrapper">
            <div class="page-content-inner ptb--80 ptb-md--60">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="table-content table-responsive">
                            <div class="tab-style-2">
                                <div class="nav nav-tabs mb--35 mb-sm--25" id="product-tab" role="tablist">
                                    <a class="nav-link active" id="nav-description-tab" data-toggle="tab" href="#nav-description" role="tab" aria-selected="true"> 
                                        <span>결제내역</span>
                                    </a>
                                    <a class="nav-link" id="nav-info-tab" data-toggle="tab" href="#nav-info" role="tab" aria-selected="true">
                                        <span>내정보수정</span>
                                    </a>
                                </div>
                                <div class="tab-content" id="product-tabContent">
                                    <div class="tab-pane fade show active" id="nav-description" role="tabpanel" aria-labelledby="nav-description-tab">
                                        <div class="product-description"> 
				                             <table class="table table-style-2 wishlist-table text-center">
				                                    <thead>
				                                        <tr>
				                                            <th>구매날짜</th>
				                                            <th>상품명</th> 
				                                            <th>결제수단</th>
				                                            <th>상품금액</th>
				                                            <th>상품수량</th>
				                                            <th>결제금액</th>     
				                                        </tr>
				                                    </thead>
				                            		 <%
				                                    	                                    		
				                                    	List<PaymentDTO> paylist = (List<PaymentDTO>)request.getAttribute("paylist");
				                                   		
				                                    	if(!paylist.equals("") || paylist != null){
				                                    		
				                                    		Iterator<PaymentDTO> it = paylist.iterator();
				                                   			PaymentDTO paydto = null;
					                                   		while(it.hasNext()){
					                                   			paydto = it.next();
					                                 %>  			
					                                    
				                                        <tr >
				                                            <th class=""><%=paydto.getPaydate() %></th>
				                                            <th class="" style="text-align: left;">
				                                            <img src="<%=cp%><%=paydto.getImagePath()%>" style="width: 10%;height: 10%">
				                                            <%=paydto.getProductInfo() %></th> 
				                                            <th class=""><%=paydto.getPaytype() %></th>
				                                            <td class="product-price">
				                                                <span class="product-price-wrapper">
				                                                	<span><font color="#368AFF">
				                                                	<fmt:formatNumber value="<%=paydto.getProductPrice()/paydto.getProductEa() %>" pattern="###,###,###"/>
				                                                	원</font></span>
				                                                </span>
				                                            </td>
				                                            <th class=""><%=paydto.getProductEa() %></th>
				                                            <td class="product-price">
				                                                <span class="product-price-wrapper">
				                                                	<span><font color="#368AFF">
				                                                	<fmt:formatNumber value="<%=paydto.getProductPrice() %>" pattern="###,###,###"/>
				                                                	원</font></span>
				                                                </span>
				                                            </td>                                            
				                                   	<%
													  		}
					                                   	}
				                                   	%>
                                     </tbody>
                                  </table>
                               </div>
                                    </div>
                                    <div class="tab-pane fade" id="nav-info" role="tabpanel" aria-labelledby="nav-info-tab">
                                        <div class="table-content table-responsive">
                                        
                                       <!-- 회원정보수정 탭 -->  
                                             <div class="main-content-wrapper">
									          <div class="page-content-inner pt--75 pb--80">
									              <div class="container">
									              	<div class="row">
									              		<div class="col-md-4">       			
									              		</div>
									              		<div class="col-md-4">
									              			<div class="login-box">
									              				<h3 class="heading__terriary mb--30" style="text-align: center">회원정보수정</h3>
									             					<form class="form form--login" name="register"  method="post">
									             						<div class="form__group mb--20">
									                                  &nbsp;
									                                  </div>
									             						<div class="form__group mb--20">
									                                      <label class="form__label" for="email"><b>이메일주소</b></label>
									                                      <input type="text" class="form__input" id="email" name="email" style="size: 50px" value="${memberdto.email }" readonly="readonly">
									                                  </div>
									                                  <div class="form__group mb--20">
									                                     <label class="form__label" for="password"><b>패스워드</b></label>
									                                      <input type="password" class="form__input" id="password" name="pwd" value="" onfocus="this.value=''">
									                                  </div>
									                                  <div class="form__group mb--20">
									                                     <label class="form__label" for="name"><b>이  름</b></label>
									                                      <input type="text" class="form__input" id="name" name="name" value="${memberdto.name }" readonly="readonly">
									                                  </div>
									                                  <div class="form__group mb--20">
									                                     <label class="form__label" ><b>휴대전화</b></label>
									                                      <select id="phone1" name="phone1" class="form__input">
																		<option value="010">010</option>
																		<option value="011">011</option>
																		<option value="016">016</option>
																		<option value="017">017</option>
																		<option value="018">018</option>
																		<option value="019">019</option>
																	</select>
																	<input type="text" class="form__input" id="phone2" name="phone" maxlength="8" placeholder="'-'를 제외하고 입력하세요" value="${memberdto.phone}" readonly="readonly">
									                                  </div>
									                                  
									                                  <div class="form__group mb--20">
									                                  &nbsp;
									                                  </div>
									                                  <div class="form__group mb--20">
									                           			<input type="text" id="sample4_postcode" placeholder="우편번호"  name="addr1" class="form__input" style="width: 150px" value="${memberdto.addr1 }" readonly="readonly">
																		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="form__input" style="width: 130px;text-align: center;vertical-align: right" readonly="readonly"><br>
											                          </div>
											                          <div class="form__group mb--20">
																		<input type="text" id="sample4_roadAddress" name="addr2"  placeholder="도로명주소" class="form__input" style="width: 220px;" value="${memberdto.addr2 }">
																		<input type="text" id="sample4_extraAddress"  placeholder="참고주소" class="form__input" style="width: 136px;" readonly="readonly">
																		<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" readonly="readonly">
																		<span id="guide" style="color:#999;display:none"></span>
																	  </div>
																	  <div class="form__group mb--20"> 
																		<input type="text" id="sample4_detailAddress"  name="addr3"  placeholder="상세주소" class="form__input" style="height: 50px" value="${memberdto.addr3 }" readonly="readonly"><br/>
									                                  </div>
									                                  
									                                  <div class="form__group mb--20">            
									                                      <input type="button" class="form__input" value="수정하기 " style="background-color: #FF5151; font-size:13pt; color:#ffffff;" onclick="check('<%=cp%>');">    
									                                      <a href="home.fu">
									                                      <input type="button" class="form__input" value="수정취소" style="background-color: #FF5151; font-size:13pt; color:#ffffff;">
									                                      </a>
									                                  </div>
									             					</form>
									              				</div>
									              			</div>
									              		</div>
									              </div>
									          </div>
									      </div>                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Content Wrapper Start -->

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>
