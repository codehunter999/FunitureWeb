<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="zxx">
 
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>KAARE KLINT 카레클린트 | 가구 | 원목가구 | 디자인가구 | 신혼 가구</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicons -->
    <link rel="shortcut icon" href="<%=cp %>/resources/assets/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="<%=cp %>/resources/assets/img/icon.png">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>	
	<!-- 회원가입check  -->
	<script src="<%=cp %>/resources/assets/js/register_check.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#image").click(function(event) {
				$('div.modal').modal();
			});
			var sessionId = $("#session_Names").text();
			var substrIndex = sessionId.indexOf("@");
			
			$("#session_Names").text(sessionId.substr(0,substrIndex));
		});
	</script>
	
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#reviewSubject").click(function(event) {
				$('div.modal').modal();
			});
		});
	</script>
	
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#image").click(function(event) {
				$('div.modal').modal();
			});
		});
	</script>
	
	<script type="text/javascript">
	    var data;
		function clickevent(eventdata){
			data=eventdata;
			$('div.modal').modal();
		}
		function cartsubmit(){
			location.href="cart.fu?data="+data;
		}
    </script>

	<style type="text/css">
		.container {
		  padding-right: 15px;
		  padding-left: 15px;
		  margin-right: auto;
		  margin-left: auto;
		}
	</style>
	
	  <!-- ************************* CSS Files ************************* -->
    
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<!-- Vendor CSS -->
    <link rel="stylesheet" href="<%=cp %>/resources/assets/css/vendor.css">
    <!-- style css -->
    <link rel="stylesheet" href="<%=cp %>/resources/assets/css/main.css">
</head>
<body>
    <!-- Preloader Start -->
    <div class="ft-preloader active">
        <div class="ft-preloader-inner h-100 d-flex align-items-center justify-content-center">
            <div class="ft-child ft-bounce1"></div>
            <div class="ft-child ft-bounce2"></div>
            <div class="ft-child ft-bounce3"></div>
        </div>
    </div>
    <!-- Preloader End -->
 
    <!-- Main Wrapper Start -->
    <div class="wrapper">
        <!-- Header Start -->
        <header class="header">
            <div class="header__inner fixed-header">
                <div class="header__main">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="header__main-inner">
                                    <div class="header__main-left">
                                        <div class="logo">
                                            <a href="home.fu" class="logo--normal">
                                                <img src="<%=cp %>/resources/assets/img/logo/kaare.jpg" alt="Logo">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="header__main-center">
                                        <nav class="main-navigation text-center d-none d-lg-block">
                                            <ul class="mainmenu">
                                                <li class="mainmenu__item menu-item-has-children">
                                                    <a href="company.fu" class="mainmenu__link">
                                                        <span class="mm-text">회사소개</span>
                                                    </a>
                                                    <!-- <ul class="sub-menu">
                                                        <li>
                                                            <a href="home.fu">
                                                                <span class="mm-text">Home One</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="home2.fu">
                                                                <span class="mm-text">Home Two</span>
                                                            </a>
                                                        </li>
                                                    </ul> -->
                                                </li>
                                                <li class="mainmenu__item menu-item-has-children megamenu-holder">
                                                    <a href="" class="mainmenu__link">
                                                        <span class="mm-text">제 품</span>
                                                    </a>
                                                    <ul class="megamenu">
                                                        <li>
                                                            <a class="megamenu-title" href="living_total.fu">
                                                                <span class="mm-text">거실 / 리빙룸</span>
                                                            </a>
                                                            <ul>
                                                                <li>
                                                                    <a href="living_sunb.fu?cateEn=sunb">
                                                                        <span class="mm-text">★선브렐라 소파</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="living_fabric.fu?cateEn=fabric">
                                                                        <span class="mm-text">패브릭 소파</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="living_leather.fu?cateEn=leather">
                                                                        <span class="mm-text">가죽 소파</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="living_deus.fu?cateEn=deus">
                                                                        <span class="mm-text">데우스 소파</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="living_sideTable.fu?cateEn=sideTable">
                                                                        <span class="mm-text">사이드 테이블</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="living_TV.fu?cateEn=TV">
                                                                        <span class="mm-text">TV 장</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="living_shelf.fu?cateEn=shelf">
                                                                        <span class="mm-text">선반</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="living_bookcase.fu?cateEn=bookcase">
                                                                        <span class="mm-text">북 케이스</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                        <li>
                                                            <a class="megamenu-title" href="diningfull.fu">
                                                                <span class="mm-text">주방/다이닝룸</span>
                                                            </a>
                                                            <ul> 
                                                                <li>
                                                                    <a href="dining_sunbrella.fu?cateEn=sunbrella">
                                                                        <span class="mm-text">선브렐라 체어</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="dining_clean.fu?cateEn=clean">
                                                                        <span class="mm-text">클린터치 테이블</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="dining_rnl.fu?cateEn=rnl">
                                                                        <span class="mm-text">리놀륨 테이블</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="dining_table.fu?cateEn=table">
                                                                        <span class="mm-text">테이블 / 식탁</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="dining_chair.fu?cateEn=chair">
                                                                        <span class="mm-text">체어 / 의자</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="dining_deco.fu?cateEn=deco">
                                                                        <span class="mm-text">장식장</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="dining_desk.fu?cateEn=desk">
                                                                        <span class="mm-text">책상 / 선반</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                        <li>
                                                            <a class="megamenu-title" href="bed_total.fu">
                                                                <span class="mm-text">침실 / 베드룸</span>
                                                            </a>
                                                            <ul>
                                                                <li>
                                                                    <a href="bed_bed.fu?cateEn=BED">
                                                                        <span class="mm-text">침대</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="bed_ht.fu?cateEn=ht">
                                                                        <span class="mm-text">협탁</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="bed_dressingTable.fu?cateEn=dressingTable">
                                                                        <span class="mm-text">화장대</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="bed_chiff.fu?cateEn=chiff">
                                                                        <span class="mm-text">서랍장</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                        <li>
                                                            <a class="megamenu-title" href="decofull.fu">
                                                                <span class="mm-text">홈데코/리빙</span>
                                                            </a>
                                                            <ul>
                                                                <li>
                                                                    <a href="deco_monthly.fu?cateEn=monthly">
                                                                        <span class="mm-text">월간 카레클린트</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="deco_light.fu?cateEn=light">
                                                                        <span class="mm-text">조명</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="deco_plasticch.fu?cateEn=plasticch">
                                                                        <span class="mm-text">PLASTIC 체어</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </li>
                                                
                                                <!-- 지점안내  -->
                                                <%@include file="/WEB-INF/views/location/LocationTab.jsp" %>
                                                
                                                
                                                <!-- Page -->
                                                <!-- 
                                                <li class="mainmenu__item menu-item-has-children">
                                                    <a href="#" class="mainmenu__link">
                                                        <span class="mm-text">Pages</span>
                                                    </a>
                                                    <ul class="sub-menu">
                                                        <li>
                                                            <a href="my-account.fu">
                                                                <span class="mm-text">My Account</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="checkout.fu">
                                                                <span class="mm-text">Checkout</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="cart.fu">
                                                                <span class="mm-text">Cart</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="compare.fu">
                                                                <span class="mm-text">Compare</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="order-tracking.fu">
                                                                <span class="mm-text">Track Order</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="wishlist.fu">
                                                                <span class="mm-text">Wishlist</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                 -->
                                                
                                                <li class="mainmenu__item menu-item-has-children">
                                                    <a href="#" class="mainmenu__link">
                                                        <span class="mm-text">커뮤니티</span>
                                                    </a>
                                                    <ul class="sub-menu">
                                                    	<li>
                                                            <a href="qnamain.fu">
                                                                <span class="mm-text">Q&A</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="reviewmain.fu">
                                                                <span class="mm-text">상품평</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="mainmenu__item menu-item-has-children">
                                                    <a href="event_list.fu" class="mainmenu__link">
                                                        <span class="mm-text">Event</span>
                                                    </a>
                                                </li>
                                                
                                                <li class="mainmenu__item menu-item-has-children">
                                                   <span class="mm-text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                </li>
                                                
                                                <li class="mainmenu__item menu-item-has-children">
                                                   <span class="mm-text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                </li>

                                                <c:choose> 
												    <c:when test="${not empty sessionScope.email }">   
												        <li class="mainmenu__item menu-item-has-children">
												        	<a href="${pageContext.request.contextPath }/home.fu" class="mainmenu__link">
												        		<span class="mm-text" id="session_Names">${sessionScope.email } 님</span>
												        	</a>
												        	 <ul class="sub-menu">
		                                                    	<li>
		                                                            <a href="<%=cp%>/mypage.fu">
		                                                                <span class="mm-text">마이페이지</span>
		                                                            </a>
		                                                        </li>
		                                                        <li>
		                                                            <a href="<%=cp%>/deleteMember.fu">
		                                                                <span class="mm-text">회원탈퇴</span>
		                                                            </a>
		                                                        </li>
		                                                    </ul>
												        </li>
												        <li class="mainmenu__item menu-item-has-children">
												        	<a href="${pageContext.request.contextPath }/logout.fu" class="mainmenu__link"> 
												        		<span class="mm-text">로그아웃</span>
												        	 </a>
												        </li>            
												    </c:when>
												    <c:otherwise>    
													    <li class="mainmenu__item menu-item-has-children">
		                                                    <a href="login.fu" class="mainmenu__link">
		                                                        <span class="mm-text">로그인</span>
		                                                    </a>
		                                                </li>
		                                                <li class="mainmenu__item menu-item-has-children">
		                                                    <a href="register.fu" class="mainmenu__link">
		                                                        <span class="mm-text">회원가입</span>
		                                                    </a>
		                                                </li>
												    </c:otherwise>                  
												</c:choose>
                                            </ul>
                                        </nav>
                                    </div> 
                                    <div class="header__main-right">
                                        <div class="header-toolbar-wrap">
                                            <div class="header-toolbar">
                                                <!-- <div class="header-toolbar__item header-toolbar--search-btn">
                                                    <a href="#searchForm" class="header-toolbar__btn toolbar-btn">
                                                        <i class="la la-search"></i>
                                                    </a>
                                                </div> -->
                                                <div class="header-toolbar__item header-toolbar--minicart-btn">
                                                    <a href="#miniCart" class="header-toolbar__btn toolbar-btn">
                                                        <i class="la la-shopping-cart"></i>
                                                        <!-- <span>01</span> -->
                                                    </a>
                                                </div>
                                                <div class="header-toolbar__item d-block d-lg-none">
                                                    <a href="#offcanvasMenu" class="header-toolbar__btn toolbar-btn menu-btn">
                                                        <div class="hamburger-icon">
                                                            <span></span>
                                                            <span></span>
                                                            <span></span>
                                                            <span></span>
                                                            <span></span>
                                                            <span></span>
                                                        </div>
                                                    </a>
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
        </header>
        <!-- Header End -->