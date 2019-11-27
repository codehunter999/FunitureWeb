<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="zxx">
 
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Beck - Furniture eCommerce Bootstrap 4 Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicons -->
    <link rel="shortcut icon" href="<%=cp %>/resources/assets/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="<%=cp %>/resources/assets/img/icon.png">

    <!-- ************************* CSS Files ************************* -->

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
                                            <a href="<%=cp %>/" class="logo--normal">
                                                <img src="<%=cp %>/resources/assets/img/logo/logo.png" alt="Logo">
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
                                                                    <a href="living_sunb.fu">
                                                                        <span class="mm-text">선브렐라 소파</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="living_fabric.fu">
                                                                        <span class="mm-text">패브릭 소파</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="living_leather.fu">
                                                                        <span class="mm-text">가죽 소파</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="living_deus.fu">
                                                                        <span class="mm-text">데우스 소파</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="living_sideTable.fu">
                                                                        <span class="mm-text">사이드 테이블</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="living_TV">
                                                                        <span class="mm-text">TV 장</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="living_shelf.fu">
                                                                        <span class="mm-text">선 반</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="living_bookcase.fu">
                                                                        <span class="mm-text">북케이스</span>
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
                                                                    <a href="dining_sunbrella.fu?cate=선브렐라 체어">
                                                                        <span class="mm-text">선브렐라 체어</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="dining_clean.fu?cate=클린터치 테이블">
                                                                        <span class="mm-text">클린터치 테이블</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="dining_rnl.fu?cate=리놀륨 테이블">
                                                                        <span class="mm-text">리놀륨 테이블</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="dining_table.fu?cate=테이블 / 식탁">
                                                                        <span class="mm-text">테이블 / 식탁</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="dining_chair.fu?cate=체어 / 의자">
                                                                        <span class="mm-text">체어 / 의자</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="dining_deco.fu?cate=장식장">
                                                                        <span class="mm-text">장식장</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="dining_desk.fu?cate=책상 / 선반">
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
                                                                    <a href="bed_bed.fu">
                                                                        <span class="mm-text">침 대</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="bed_ht.fu">
                                                                        <span class="mm-text">협 탁</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="bed_dressingTable.fu">
                                                                        <span class="mm-text">화장대</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="bed_chiff.fu">
                                                                        <span class="mm-text">서랍장</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                        <li>
                                                            <a class="megamenu-title" href="decofull.fu">
                                                                <span class="mm-text">홈데코 / 리빙</span>
                                                            </a>
                                                            <ul>
                                                                <li>
                                                                    <a href="deco_monthly.fu?cate=월간 카레클린트">
                                                                        <span class="mm-text">월간 카레클린트</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="deco_light.fu?cate=조명">
                                                                        <span class="mm-text">조명</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="deco_plasticch.fu?cate=PLASTIC 체어">
                                                                        <span class="mm-text">PLASTIC 체어</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="mainmenu__item menu-item-has-children">
                                                    <a href="#" class="mainmenu__link">
                                                        <span class="mm-text">지점안내</span>
                                                    </a>
                                                    <ul class="megamenu">
                                                        <li>
                                                            <a class="megamenu-title" href="#">
                                                                <span class="mm-text">서울</span>
                                                            </a>
                                                            <ul>
                                                                <li>
                                                                    <a href="#">
                                                                        <span class="mm-text">청담</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="#">
                                                                        <span class="mm-text">홍대</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="#">
                                                                        <span class="mm-text">목동</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                        <li>
                                                            <a class="megamenu-title" href="#">
                                                                <span class="mm-text">경기도</span>
                                                            </a>
                                                            <ul>
                                                                <li>
                                                                    <a href="#">
                                                                        <span class="mm-text">하남</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="#">
                                                                        <span class="mm-text">분당</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="#">
                                                                        <span class="mm-text">동탄</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="#">
                                                                        <span class="mm-text">안양</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="#">
                                                                        <span class="mm-text">평택</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </li>
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
                                                <li class="mainmenu__item menu-item-has-children">
                                                    <a href="contact-us.fu" class="mainmenu__link">
                                                        <span class="mm-text">커뮤니티</span>
                                                    </a>
                                                    <ul class="sub-menu">
                                                    	<li>
                                                            <a href="#">
                                                                <span class="mm-text">Q&A</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#">
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
                                            </ul>
                                        </nav>
                                    </div>
                                    <div class="header__main-right">
                                        <div class="header-toolbar-wrap">
                                            <div class="header-toolbar">
                                                <div class="header-toolbar__item header-toolbar--search-btn">
                                                    <a href="#searchForm" class="header-toolbar__btn toolbar-btn">
                                                        <i class="la la-search"></i>
                                                    </a>
                                                </div>
                                                <div class="header-toolbar__item header-toolbar--minicart-btn">
                                                    <a href="#miniCart" class="header-toolbar__btn toolbar-btn">
                                                        <i class="la la-shopping-cart"></i>
                                                        <span>01</span>
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

        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/image/주방다이닝룸.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">DINING ROOM</h1>
                        <ul class="breadcrumb">
                            <li><a href="/furnitureweb/">Home</a></li>
                            <li class="current"><span>리놀륨 테이블</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb area End -->

        <!-- Main Content Wrapper Start -->
        <div  class="main-content-wrapper">
            <div class="shop-page-wrapper ptb--80">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="shop-toolbar mb--50">
                                <div class="row align-items-center">
                                    <div class="col-md-5 mb-sm--30 mb-xs--10">
                                        <div class="shop-toolbar__left">
                                            <div class="product-ordering">
                                                <b>베스트상품</b>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="shop-toolbar__right d-flex justify-content-md-end justify-content-start flex-sm-row flex-column">
                                            <p class="product-pages">홈 > 주방 /다이닝룸 > 리놀륨 테이블 / 식탁</p>
                                            <%-- <div class="product-view-mode ml--50 ml-xs--0">
                                                <a class="active" href="#" data-target="grid">
                                                    <img src="<%=cp %>/resources/assets/img/icons/grid.png" alt="Grid">
                                                </a>
                                            </div> --%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- slide start -->
                            <hr/><br/>
                            
                            <div class="product-gallery__nav-image">
                                        <div class="element-carousel nav-slider product-slide-nav slick-vertical-center" 
                                        data-slick-options='{
                                            "spaceBetween": 30,
                                            "slidesToShow": 5,
                                            "slidesToScroll": 1,
                                            "swipe": true,
                                            "infinite": true,
                                            "focusOnSelect": true,
                                            "arrows": true, 
                                            "prevArrow": {"buttonClass": "slick-btn slick-prev", "iconClass": "la la-angle-left" },
                                            "nextArrow": {"buttonClass": "slick-btn slick-next", "iconClass": "la la-angle-right" }
                                        }'
                                        data-slick-responsive='[
                                            {
                                                "breakpoint":767, 
                                                "settings": {
                                                    "slidesToShow": 4
                                                } 
                                            },
                                            {
                                                "breakpoint":575, 
                                                "settings": {
                                                    "slidesToShow": 3
                                                } 
                                            },
                                            {
                                                "breakpoint":480, 
                                                "settings": {
                                                    "slidesToShow": 2
                                                } 
                                            }
                                        ]'>
                                       <!-- 베스트상품목록 -->
                                            <figure class="product-gallery__nav-image--single">
                                                <a href="dining_rnl_details.fu?imageIndex=15&cate=리놀륨 테이블">
                                                	<img src="<%=cp %>/resources/images/dining/애니테이블.jpg" style="max-width: 70%;" alt="Products">
                                                </a>
                                            </figure>
                                            <figure class="product-gallery__nav-image--single">
                                                <a href="dining_rnl_details.fu?imageIndex=16&cate=리놀륨 테이블">
                                                	<img src="<%=cp %>/resources/images/dining/아이테이블.jpg" style="max-width: 70%;" alt="Products">
                                                </a>
                                            </figure>
                                            <figure class="product-gallery__nav-image--single">
                                                <a href="dining_rnl_details.fu?imageIndex=17&cate=리놀륨 테이블">
                                                	<img src="<%=cp %>/resources/images/dining/데이테이블.jpg" style="max-width: 70%;" alt="Products">
                                                </a>
                                            </figure>
                                            <figure class="product-gallery__nav-image--single">
                                                <a href="dining_rnl_details.fu?imageIndex=20&cate=리놀륨 테이블">
                                                	<img src="<%=cp %>/resources/images/dining/베이직테이블.jpg" style="max-width: 70%;" alt="Products">
                                                </a>
                                                
                                            </figure>
                                            <figure class="product-gallery__nav-image--single">
                                                <a href="dining_rnl_details.fu?imageIndex=21&cate=리놀륨 테이블">
                                                	<img src="<%=cp %>/resources/images/dining/조이체어.jpg" style="max-width: 70%;" alt="Products">
                                                </a>
                                            </figure>
                                            <figure class="product-gallery__nav-image--single">
                                                <a href="dining_rnl_details.fu?imageIndex=22&cate=리놀륨 테이블">
                                                	<img src="<%=cp %>/resources/images/dining/데이체어.jpg" style="max-width: 70%;" alt="Products">
                                                </a>
                                            </figure>
                                            <figure class="product-gallery__nav-image--single">
                                                <a href="dining_rnl_details.fu?imageIndex=23&cate=리놀륨 테이블">
                                                	<img src="<%=cp %>/resources/images/dining/라인체어.jpg" style="max-width: 70%;" alt="Products">
                                                </a>
                                            </figure>
                                            <figure class="product-gallery__nav-image--single">
                                                <a href="dining_rnl_details.fu?imageIndex=24&cate=리놀륨 테이블">
                                                	<img src="<%=cp %>/resources/images/dining/클립체어.jpg" style="max-width: 70%;" alt="Products">
                                                </a>
                                            </figure>
                                            <figure class="product-gallery__nav-image--single">
                                                <a href="dining_rnl_details.fu?imageIndex=25&cate=리놀륨 테이블">
                                                	<img src="<%=cp %>/resources/images/dining/허그체어.jpg" style="max-width: 70%;" alt="Products">
                                                </a>
                                            </figure>
                                        </div>
                                    </div>
                                    
                            		<br/><br/>
                            		
                           
                            		
                           	<div class="shop-toolbar mb--50">
                                <div class="row align-items-center">
                                    <div class="col-md-5 mb-sm--30 mb-xs--10">
                                        <div class="shop-toolbar__left">
                                            <div class="product-ordering">
                                                <b>클린터치 테이블 / 식탁</b>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <hr/><br/>
                            
                            <!-- slide end -->
                            
                            <div class="shop-products">
                                <div class="row">
                                <c:forEach items="${catelists }" var="dto">
                                    <div class="col-xl-3 col-lg-4 col-sm-6 mb--50">
                                        <div class="ft-product">
                                            <div class="product-inner">
                                                <div class="product-image">
                                                    <figure class="product-image--holder">
                                                        <img src="<%=cp %>/resources/images/dining/${dto.saveFileName}" alt="Product">
                                                    </figure>
                                                    <a href="dining_rnl_details.fu?imageIndex=${dto.imageIndex }&cate=${dto.cate }" class="product-overlay"></a>
                                                    <div class="product-action">
                                                        <!-- <a data-toggle="modal" data-target="#productModal" class="action-btn">
                                                            <i class="la la-eye"></i>
                                                        </a> -->
                                                        <a href="wishlist.jsp" class="action-btn">
                                                            <i class="la la-heart-o"></i>
                                                        </a>
                                                        <a href="wishlist.jsp" class="action-btn">
                                                            <i class="la la-repeat"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="product-info">
                                                    <div class="product-category">
                                                        <a href="dining_rnl_details.fu?imageIndex=${dto.imageIndex }&cate=${dto.cate }">${dto.productName }</a>
                                                    </div>
                                                    <div class="product-info-bottom">
                                                        <div class="product-price-wrapper">
                                                            <span class="money">${dto.price }원</span>
                                                        </div>
                                                        <a href="cart.jsp" class="add-to-cart pr--15">
                                                            <i class="la la-plus"></i>
                                                            <span>Add To Cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
                                    
                                </div>
                            </div>
                            <nav class="pagination-wrap">
                                <ul class="pagination">
                                    <li><span class="page-number current">1</span></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Content Wrapper Start -->

        <!-- Footer Start-->
        <footer class="footer bg-color" data-bg-color="#f4f8fa">
            <div class="footer-top">
                <div class="container-fluid">
                    <div class="row border-bottom pt--70 pb--70">
                        <div class="col-lg-3 col-sm-6 offset-md-1 offset-lg-0 mb-md--45">
                            <div class="footer-widget">
                                <div class="textwidget">
                                    <figure class="footer-logo mb--30">
                                        <img src="<%=cp %>/resources/assets/img/logo/logo.png" alt="Logo">
                                    </figure>
                                    <p>On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms. </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-3 offset-lg-1 offset-sm-2 mb-md--45">
                            <div class="footer-widget">
                                <h3 class="widget-title mb--35 mb-sm--20">Company</h3>
                                <div class="footer-widget">
                                    <ul class="footer-menu">
                                        <li><a href="index.jsp">About Us</a></li>
                                        <li><a href="blog.jsp">Blogs</a></li>
                                        <li><a href="#">Careers</a></li>
                                        <li><a href="contact-us.jsp">Contact</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-4 offset-md-1 offset-lg-0 mb-xs--45">
                            <div class="footer-widget">
                                <h3 class="widget-title mb--35 mb-sm--20">Product</h3>
                                <div class="footer-widget">
                                    <ul class="footer-menu">
                                        <li><a href="#">Pricing</a></li>
                                        <li><a href="#">Features</a></li>
                                        <li><a href="#">Customers</a></li>
                                        <li><a href="#">Demos</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-4 mb-xs--45">
                            <div class="footer-widget">
                                <h3 class="widget-title mb--35 mb-sm--20">Helps</h3>
                                <div class="footer-widget">
                                    <ul class="footer-menu">
                                        <li><a href="#">Introduction</a></li>
                                        <li><a href="#">Feedback</a></li>
                                        <li><a href="#">Referals</a></li>
                                        <li><a href="#">Network Status</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-3 col-sm-4">
                            <div class="footer-widget">
                                <h3 class="widget-title mb--35 mb-sm--20">Social Network</h3>
                                <div class="footer-widget">
                                    <ul class="footer-menu">
                                        <li><a href="#">Facebook</a></li>
                                        <li><a href="#">Twitter</a></li>
                                        <li><a href="#">Linkedin</a></li>
                                        <li><a href="#">Google +</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-middle ptb--40">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-11">
                            <div class="footer-widget">
                                <div class="taglist">
                                    <span>Tags:</span>
                                    <a href="#">Minimal eCommerce</a>
                                    <a href="#">Marketing</a>
                                    <a href="#">User Exprience</a>
                                    <a href="#">Ali Express</a>
                                    <a href="#">Web</a>
                                    <a href="#">Digital Expo</a>
                                    <a href="#">Web Search</a>
                                    <a href="#">Affiliate</a>
                                    <a href="#">UCWeb</a>
                                    <a href="#">Support</a>
                                    <a href="#">Template</a>
                                    <a href="#">Best Queality</a>
                                    <a href="#">Mobile</a>
                                    <a href="#">24 Support</a>
                                    <a href="#">Ali Express</a>
                                    <a href="#">Web</a>
                                    <a href="#">Laptop</a>
                                    <a href="#">Web Search</a>
                                    <a href="#">Affiliate</a>
                                    <a href="#">Photoshop</a>
                                    <a href="#">Support</a>
                                    <a href="#">Template</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="container-fluid">
                    <div class="row border-top ptb--20">
                        <div class="col-12 text-center">
                            <p class="copyright-text">Beck &copy; 2019 all rights reserved</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer End-->

        <!-- OffCanvas Menu Start -->
        <div class="offcanvas-menu-wrapper" id="offcanvasMenu">
            <div class="offcanvas-menu-inner">
                <a href="" class="btn-close">
                    <i class="la la-remove"></i>
                </a>
                <nav class="offcanvas-navigation">
                    <ul class="offcanvas-menu">
                        <li class="menu-item-has-children active">
                            <a href="#">Home</a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="index.jsp">Homepage 01</a>
                                </li>
                                <li>
                                    <a href="index-02.jsp">Homepage 02</a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="shop.jsp">Shop</a>
                            <ul class="sub-menu">
                                <li class="menu-item-has-children">
                                    <a href="#">
                                        <span class="mm-text">Shop Grid</span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="shop-fullwidth.jsp">Full Width</a>
                                        </li>
                                        <li>
                                            <a href="shop.jsp">Left Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="shop-right-sidebar.jsp">Right Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="shop-three-columns.jsp">Three Columns</a>
                                        </li>
                                        <li>
                                            <a href="shop-four-columns.jsp">Four Columns</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Shop List</a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="shop-list.jsp">Full Width</a>
                                        </li>
                                        <li>
                                            <a href="shop-list-sidebar.jsp">Left Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="shop-list-right-sidebar.jsp">Right Sidebar</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Product Details</a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="product-details.jsp">Tab Style 1</a>
                                        </li>
                                        <li>
                                            <a href="product-details-tab-style-2.jsp">Tab Style 2</a>
                                        </li>
                                        <li>
                                            <a href="product-details-tab-style-3.jsp">Tab Style 3</a>
                                        </li>
                                        <li>
                                            <a href="product-details-gallery-left.jsp">Gallery Left</a>
                                        </li>
                                        <li>
                                            <a href="product-details-gallery-right.jsp">Gallery Right</a>
                                        </li>
                                        <li>
                                            <a href="product-details-sticky-left.jsp">Sticky Left</a>
                                        </li>
                                        <li>
                                            <a href="product-details-sticky-right.jsp">Sticky Right</a>
                                        </li>
                                        <li>
                                            <a href="product-details-slider-box.jsp">Slider Box</a>
                                        </li>
                                        <li>
                                            <a href="product-details-slider-full-width.jsp">Slider Box Full Width</a>
                                        </li>
                                        <li>
                                            <a href="product-details-affiliate.jsp">Affiliate Proudct</a>
                                        </li>                                                    
                                        <li>
                                            <a href="product-details-variable.jsp">Variable Proudct</a>
                                        </li>
                                        <li>
                                            <a href="product-details-group.jsp">Group Product</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="blog.jsp">Blog</a>
                            <ul class="sub-menu">
                                <li class="menu-item-has-children">
                                    <a href="#">Blog</a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="blog-left-sidebar.jsp">Blog Left Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="blog.jsp">Blog Right Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="blog-01-column.jsp">Blog 01 column</a>
                                        </li>
                                        <li>
                                            <a href="blog-02-columns.jsp">Blog 02 columns</a>
                                        </li>
                                        <li>
                                            <a href="blog-03-columns.jsp">Blog 03 columns</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Blog Details</a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="blog-details-audio.jsp">Audio Blog Details</a>
                                        </li>
                                        <li>
                                            <a href="blog-details-gallery.jsp">Gallery Blog Details</a>
                                        </li>
                                        <li>
                                            <a href="blog-details-image.jsp">image Blog Details</a>
                                        </li>
                                        <li>
                                            <a href="blog-details-video.jsp">Video Blog Details</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#">Pages</a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="my-account.jsp">My Account</a>
                                </li>
                                <li>
                                    <a href="checkout.jsp">Checkout</a>
                                </li>
                                <li>
                                    <a href="cart.jsp">Cart</a>
                                </li>
                                <li>
                                    <a href="compare.jsp">Compare</a>
                                </li>
                                <li>
                                    <a href="order-tracking.jsp">Track Order</a>
                                </li>
                                <li>
                                    <a href="wishlist.jsp">Wishlist</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="contact-us.jsp">Contact Us</a>
                        </li>
                    </ul>
                    <div class="site-info vertical">
                        <div class="site-info__item">
                            <a href="tel:+01223566678"><strong>+01 2235 666 78</strong></a>
                            <a href="mailto:Support@contixs.com">Support@furtrate.com</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- OffCanvas Menu End -->

        <!-- Mini Cart Start -->
        <aside class="mini-cart" id="miniCart">
            <div class="mini-cart-wrapper">
                <div class="mini-cart__close">
                    <a href="#" class="btn-close"><i class="la la-remove"></i></a>
                </div>
                <div class="mini-cart-inner">
                    <h3 class="mini-cart__heading mb--45">Shopping Cart</h3>
                    <div class="mini-cart__content">
                        <ul class="mini-cart__list">
                            <li class="mini-cart__product">
                                <a href="#" class="mini-cart__product-remove">
                                    <i class="la la-remove"></i>
                                </a>
                                <div class="mini-cart__product-image">
                                    <img src="<%=cp %>/resources/assets/img/products/prod-01-100x100.jpg" alt="products">
                                </div>
                                <div class="mini-cart__product-content">
                                    <a class="mini-cart__product-title" href="product-details.jsp">Golden Easy Spot Chair.</a>
                                    <span class="mini-cart__product-quantity">1 x $49.00</span>
                                </div>
                            </li>
                            <li class="mini-cart__product">
                                <a href="#" class="mini-cart__product-remove">
                                    <i class="la la-remove"></i>
                                </a>
                                <div class="mini-cart__product-image">
                                    <img src="<%=cp %>/resources/assets/img/products/prod-02-100x100.jpg" alt="products">
                                </div>
                                <div class="mini-cart__product-content">
                                    <a class="mini-cart__product-title" href="product-details.jsp">Golden Easy Spot Chair.</a>
                                    <span class="mini-cart__product-quantity">1 x $49.00</span>
                                </div>
                            </li>
                            <li class="mini-cart__product">
                                <a href="#" class="mini-cart__product-remove">
                                    <i class="la la-remove"></i>
                                </a>
                                <div class="mini-cart__product-image">
                                    <img src="<%=cp %>/resources/assets/img/products/prod-03-100x100.jpg" alt="products">
                                </div>
                                <div class="mini-cart__product-content">
                                    <a class="mini-cart__product-title" href="product-details.jsp">Golden Easy Spot Chair.</a>
                                    <span class="mini-cart__product-quantity">1 x $49.00</span>
                                </div>
                            </li>
                        </ul>
                        <div class="mini-cart__total">
                            <span>Subtotal</span>
                            <span class="ammount">$98.00</span>
                        </div>
                        <div class="mini-cart__buttons">
                            <a href="cart.jsp" class="btn btn-fullwidth btn-bg-primary mb--20">View Cart</a>
                            <a href="checkout.jsp" class="btn btn-fullwidth btn-bg-primary">Checkout</a>
                        </div>
                    </div>
                </div>
            </div>
        </aside>
        <!-- Mini Cart End -->

        <!-- Searchform Popup Start -->
        <div class="searchform__popup" id="searchForm">
            <a href="#" class="btn-close"><i class="la la-remove"></i></a>
            <div class="searchform__body">
                <p>Start typing and press Enter to search</p>
                <form class="searchform">
                    <input type="text" name="popup-search" id="popup-search" class="searchform__input" placeholder="Search Entire Store...">
                    <button type="submit" class="searchform__submit"><i class="la la-search"></i></button>
                </form>
            </div>
        </div>
        <!-- Searchform Popup End -->

        <!-- Qicuk View Modal Start -->
<%--         <div class="modal fade product-modal" id="productModal" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true"><i class="la la-remove"></i></span>
                </button>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="element-carousel slick-vertical-center"
                        data-slick-options='{
                            "slidesToShow": 1,
                            "slidesToScroll": 1,
                            "arrows": true,
                            "prevArrow": {"buttonClass": "slick-btn slick-prev", "iconClass": "la la-angle-double-left" },
                            "nextArrow": {"buttonClass": "slick-btn slick-next", "iconClass": "la la-angle-double-right" }
                        }'
                        >
                            <div class="product-image">
                                <div class="product-image--holder">
                                    <a href="product-details.jsp">
                                        <img src="<%=cp %>/resources/assets/img/products/prod-01.jpg" alt="Product Image" class="primary-image">
                                    </a>
                                </div>
                                <span class="product-badge sale">sale</span>
                            </div>
                            <div class="product-image">
                                <div class="product-image--holder">
                                    <a href="product-details.jsp">
                                        <img src="<%=cp %>/resources/assets/img/products/prod-02.jpg" alt="Product Image" class="primary-image">
                                    </a>
                                </div>
                                <span class="product-badge sale">sale</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="modal-box product-summary">
                            <div class="product-navigation text-right mb--20">
                                <a href="#" class="prev"><i class="la la-angle-double-left"></i></a>
                                <a href="#" class="next"><i class="la la-angle-double-right"></i></a>
                            </div>
                            <div class="product-rating d-flex mb--20">
                                <div class="star-rating star-three">
                                    <span>Rated <strong class="rating">5.00</strong> out of 5</span>
                                </div>
                            </div>
                            <h3 class="product-title mb--20">Golden Easy Spot Chair.</h3>
                            <p class="product-short-description mb--25">Donec accumsan auctor iaculis. Sed suscipit arcu ligula, at egestas magna molestie a. Proin ac ex maximus, ultrices justo eget, sodales orci. Aliquam egestas libero ac turpis pharetra, in vehicula lacus scelerisque. Vestibulum ut sem laoreet, feugiat tellus at, hendrerit arcu.</p>
                            <div class="product-price-wrapper mb--25">
                                <span class="money">$200.00</span>
                                <span class="price-separator">-</span>
                                <span class="money">$400.00</span>
                            </div>
                            <form action="#" class="variation-form mb--30">
                                <div class="product-color-variations d-flex align-items-center mb--20">
                                    <p class="variation-label">Color:</p>
                                    <div class="product-color-variation variation-wrapper">
                                        <div class="variation">
                                            <a class="product-color-variation-btn red selected" data-toggle="tooltip" data-placement="top" title="Red">
                                                <span class="product-color-variation-label">Red</span>
                                            </a>
                                        </div>
                                        <div class="variation">
                                            <a class="product-color-variation-btn black" data-toggle="tooltip" data-placement="top" title="Black">
                                                <span class="product-color-variation-label">Black</span>
                                            </a>
                                        </div>
                                        <div class="variation">
                                            <a class="product-color-variation-btn pink" data-toggle="tooltip" data-placement="top" title="Pink">
                                                <span class="product-color-variation-label">Pink</span>
                                            </a>
                                        </div>
                                        <div class="variation">
                                            <a class="product-color-variation-btn blue" data-toggle="tooltip" data-placement="top" title="Blue">
                                                <span class="product-color-variation-label">Blue</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-size-variations d-flex align-items-center mb--15">
                                    <p class="variation-label">Size:</p>   
                                    <div class="product-size-variation variation-wrapper">
                                        <div class="variation">
                                            <a class="product-size-variation-btn selected" data-toggle="tooltip" data-placement="top" title="S">
                                                <span class="product-size-variation-label">S</span>
                                            </a>
                                        </div>
                                        <div class="variation">
                                            <a class="product-size-variation-btn" data-toggle="tooltip" data-placement="top" title="M">
                                                <span class="product-size-variation-label">M</span>
                                            </a>
                                        </div>
                                        <div class="variation">
                                            <a class="product-size-variation-btn" data-toggle="tooltip" data-placement="top" title="L">
                                                <span class="product-size-variation-label">L</span>
                                            </a>
                                        </div>
                                        <div class="variation">
                                            <a class="product-size-variation-btn" data-toggle="tooltip" data-placement="top" title="XL">
                                                <span class="product-size-variation-label">XL</span>
                                            </a>
                                        </div>
                                    </div>                                 
                                </div>
                                <a href="" class="reset_variations">Clear</a>
                            </form>
                            <div class="product-action d-flex flex-sm-row flex-column align-items-sm-center align-items-start mb--30">
                                <div class="quantity-wrapper d-flex align-items-center mr--30 mr-xs--0 mb-xs--30">
                                    <label class="quantity-label" for="quick-qty">Quantity:</label>
                                    <div class="quantity">
                                        <input type="number" class="quantity-input" name="qty" id="quick-qty" value="1" min="1">
                                    </div>
                                </div>
                                <button type="button" class="btn btn-size-sm btn-shape-square" onclick="window.location.href='cart.jsp'">
                                    Add To Cart
                                </button>
                            </div>  
                            <div class="product-footer-meta">
                                <p><span>Category:</span>
                                    <a href="shop.jsp">Full Sweater</a>,
                                    <a href="shop.jsp">SweatShirt</a>,
                                    <a href="shop.jsp">Jacket</a>,
                                    <a href="shop.jsp">Blazer</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
              </div>
            </div>
          </div>
        </div> --%>
        <!-- Qicuk View Modal End -->

        <!-- Global Overlay Start -->
        <div class="global-overlay"></div>
        <!-- Global Overlay End -->

        <!-- Global Overlay Start -->
        <a class="scroll-to-top" href=""><i class="la la-angle-double-up"></i></a>
        <!-- Global Overlay End -->
    </div>
    <!-- Main Wrapper End -->
 

    <!-- ************************* JS Files ************************* -->

    <!-- jQuery JS -->
    <script src="<%=cp %>/resources/assets/js/vendor.js"></script>

    <!-- Main JS -->
    <script src="<%=cp %>/resources/assets/js/main.js"></script>
</body>

</html>