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
    <title>KAARE KLINT 카레클린트 | 가구 | 원목가구 | 디자인가구 | 신혼 가구</title>
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
                                            <a href="/furnitureweb/" class="logo--normal">
                                                <img src="<%=cp %>/resources/assets/img/logo/logo.png" alt="Logo">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="header__main-center">
                                        <nav class="main-navigation text-center d-none d-lg-block">
                                            <ul class="mainmenu">
                                                <li class="mainmenu__item menu-item-has-children">
                                                    <a href="index.jsp" class="mainmenu__link">
                                                        <span class="mm-text">Home</span>
                                                    </a>
                                                    <ul class="sub-menu">
                                                        <li>
                                                            <a href="index.jsp">
                                                                <span class="mm-text">Home One</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="index-02.jsp">
                                                                <span class="mm-text">Home Two</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="mainmenu__item menu-item-has-children megamenu-holder">
                                                    <a href="" class="mainmenu__link">
                                                        <span class="mm-text">제품</span>
                                                    </a>
                                                    <ul class="megamenu">
                                                        <li>
                                                            <a class="megamenu-title" href="<%=cp%>/living_total.fu">
                                                                <span class="mm-text">거실 / 리빙룸</span>
                                                            </a>
                                                            <ul>
                                                                <li>
                                                                    <a href="<%=cp%>/living_sunb.fu?cateEn=sunb">
                                                                        <span class="mm-text">★선브렐라 소파</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="<%=cp%>/living_fabric.fu?cateEn=fabric">
                                                                        <span class="mm-text">패브릭 소파</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="<%=cp%>/living_leather.fu?cateEn=leather">
                                                                        <span class="mm-text">가죽 소파</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="<%=cp%>/living_deus.fu?cateEn=deus">
                                                                        <span class="mm-text">데우스 소파</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="<%=cp%>/living_sideTable.fu?cateEn=sideTable">
                                                                        <span class="mm-text">사이드 테이블</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="<%=cp%>/living_TV.fu?cateEn=TV">
                                                                        <span class="mm-text">TV 장</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="<%=cp%>/living_shelf.fu?cateEn=shelf">
                                                                        <span class="mm-text">선반</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="<%=cp%>/living_bookcase.fu?cateEn=bookcase">
                                                                        <span class="mm-text">북 케이스</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                        <li>
                                                            <a class="megamenu-title" href="#">
                                                                <span class="mm-text">Product Details</span>
                                                            </a>
                                                            <ul>
                                                                <li>
                                                                    <a href="product-details.jsp">
                                                                        <span class="mm-text">Tab Style 1</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="product-details-tab-style-2.jsp">
                                                                        <span class="mm-text">Tab Style 2</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="product-details-tab-style-3.jsp">
                                                                        <span class="mm-text">Tab Style 3</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="product-details-gallery-left.jsp">
                                                                        <span class="mm-text">Gallery Left</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="product-details-gallery-right.jsp">
                                                                        <span class="mm-text">Gallery Right</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="product-details-sticky-left.jsp">
                                                                        <span class="mm-text">Sticky Left</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                        <li>
                                                            <a class="megamenu-title" href="<%=cp%>/bed_total.fu">
                                                                <span class="mm-text">침실 / 베드룸</span>
                                                            </a>
                                                            <ul>
                                                                <li>
                                                                    <a href="<%=cp%>/bed_bed.fu?cateEn=BED">
                                                                        <span class="mm-text">침대</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="<%=cp%>/bed_ht.fu?cateEn=ht">
                                                                        <span class="mm-text">협탁</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="<%=cp%>/bed_dressingTable.fu?cateEn=dressingTable">
                                                                        <span class="mm-text">화장대</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="<%=cp%>/bed_chiff.fu?cateEn=chiff">
                                                                        <span class="mm-text">서랍장</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                        <li>
                                                            <a class="megamenu-title" href="#">
                                                                <span class="mm-text">Product Details</span>
                                                            </a>
                                                            <ul>
                                                                <li>
                                                                    <a href="product-details-sticky-right.jsp">
                                                                        <span class="mm-text">Sticky Right</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="product-details-slider-box.jsp">
                                                                        <span class="mm-text">Slider Box</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="product-details-slider-full-width.jsp">
                                                                        <span class="mm-text">Slider Box Full Width</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="product-details-affiliate.jsp">
                                                                        <span class="mm-text">Affiliate Proudct</span>
                                                                    </a>
                                                                </li>                                                    
                                                                <li>
                                                                    <a href="product-details-variable.jsp">
                                                                        <span class="mm-text">Variable Proudct</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="product-details-group.jsp">
                                                                        <span class="mm-text">Group Product</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="mainmenu__item menu-item-has-children">
                                                    <a href="blog.jsp" class="mainmenu__link">
                                                        <span class="mm-text">Blog</span>
                                                    </a>
                                                    <ul class="sub-menu">
                                                        <li class="menu-item-has-children">
                                                            <a href="#">
                                                                <span class="mm-text">Blog Grid</span>
                                                            </a>
                                                            <ul class="sub-menu">
                                                                <li>
                                                                    <a href="blog-left-sidebar.jsp">
                                                                        <span class="mm-text">Left Sidebar</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="blog.jsp">
                                                                        <span class="mm-text">Right Sidebar</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="blog-01-column.jsp">
                                                                        <span class="mm-text">One Column</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="blog-02-columns.jsp">
                                                                        <span class="mm-text">Two Columns</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="blog-03-columns.jsp">
                                                                        <span class="mm-text">Three Columns</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                        <li class="menu-item-has-children">
                                                            <a href=""><span class="mm-text">Blog Details</span></a>
                                                            <ul class="sub-menu">
                                                                <li>
                                                                    <a href="blog-details-image.jsp">
                                                                        <span class="mm-text">Image Post</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="blog-details-audio.jsp">
                                                                        <span class="mm-text">Audio Post</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="blog-details-video.jsp">
                                                                        <span class="mm-text">Video Post</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="blog-details-gallery.jsp">
                                                                        <span class="mm-text">Gallery Post</span>
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
                                                            <a href="my-account.jsp">
                                                                <span class="mm-text">My Account</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="checkout.jsp">
                                                                <span class="mm-text">Checkout</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="cart.jsp">
                                                                <span class="mm-text">Cart</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="compare.jsp">
                                                                <span class="mm-text">Compare</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="order-tracking.jsp">
                                                                <span class="mm-text">Track Order</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="wishlist.jsp">
                                                                <span class="mm-text">Wishlist</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="mainmenu__item">
                                                    <a href="contact-us.jsp" class="mainmenu__link">
                                                        <span class="mm-text">Contact Us</span>
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
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/images/bedroom/bedroomImage.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">${dto.productName }</h1>
                        <ul class="breadcrumb">
                            <li><a href="/furnitureweb/">Home</a></li>
                            <li class="current"><span>${dto.cate }</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb area End -->

        <!-- Main Content Wrapper Start -->
        <div class="main-content-wrapper">
            <div class="page-content-inner pt--80 pt-md--60">
                <div class="container">
                    <div class="row no-gutters mb--80 mb-md--57">
                        <div class="col-lg-7 product-main-image">
                            <div class="product-image">
                                <div class="product-gallery">
                                    <div class="product-gallery__large-image mb--30">
                                        <div class="product-gallery__wrapper">
                                            <div class="element-carousel main-slider image-popup"
                                            data-slick-options='{
                                                "slidesToShow": 1,
                                                "slidesToScroll": 1,
                                                "infinite": true,
                                                "arrows": false, 
                                                "asNavFor": ".nav-slider"
                                            }'>
                                                <figure class="product-gallery__image zoom">
                                                    <img src="<%=cp %>/resources/images/livingroom/${dto.imageIndex}.jpg" alt="Product">
                                                    <span class="product-badge sale">Sale</span>
                                                    <div class="product-gallery__actions">
                                                        <button class="action-btn btn-zoom-popup"><i class="la la-eye"></i></button>
                                                    </div>
                                                </figure>`
                                                <figure class="product-gallery__image zoom">
                                                    <img src="<%=cp %>/resources/images/livingroom/${dto.imageIndex}.jpg" alt="Product">
                                                    <span class="product-badge sale">Sale</span>
                                                    <div class="product-gallery__actions">
                                                        <button class="action-btn btn-zoom-popup"><i class="la la-eye"></i></button>
                                                    </div>
                                                </figure>
                                                
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 offset-xl-1 col-lg-5 product-main-details mt-md--50">
                            <div class="product-summary pl-lg--30 pl-md--0">
                                <div class="product-navigation text-right mb--20">
                                </div>
                                <h3 class="product-title mb--20">${dto.productName }</h3>
                                <hr>
                                <p class="product-short-description mb--20"></p>
                                <div class="product-price-wrapper mb--25">
                                    <span class="money">${dto.price }원</span>
                                </div>
                                <form action="#" class="variation-form mb--20">
                                	<!-- 패브릭 소파(211, 212, 215, 218,219, 222, 226, 227, 228, 229, 230 -->
                                	<c:choose>
                                		<c:when test="${dto.imageIndex == 213 || dto.imageIndex == 214 }">
	                                    <div class="product-size-variations d-flex align-items-center mb--15">
	                                        <p class="variation-label">수종:</p> 
	                                        <div class="product-size-variation variation-wrapper">
	                                        	<select>
	                                            	<option selected="selected">- [필수] 수종을 선택해주세요 -</option>
	                                            	<option disabled="disabled">-----------------------------------</option>
	                                            	<option value="오크">오크</option>
	                                            </select>
	                                        </div>                                 
	                                    </div>
                                		</c:when>
                                		<c:when test="${dto.imageIndex == 216 }">
	                                		<div class="product-size-variations d-flex align-items-center mb--15">
		                                        <p class="variation-label">사이즈:</p> 
		                                        <div class="product-size-variation variation-wrapper">
		                                        	<select>
		                                            	<option selected="selected">- [필수] 사이즈를 선택해주세요 -</option>
		                                            	<option disabled="disabled">-----------------------------------</option>
		                                            	<option value="3인 2P(일자형)">3인 2P(일자형)</option>
		                                            	<option value="4인 3P(일자형)">4인 3P(일자형)</option>
		                                            	<option value="5인 4P(일자형)">5인 4P(일자형)</option>
		                                            </select>
		                                        </div>                                 
		                                    </div>
                                		</c:when>
                                		<c:when test="${dto.imageIndex == 217}">
                                			<div class="product-size-variations d-flex align-items-center mb--15">
		                                        <p class="variation-label">색상:</p> 
		                                        <div class="product-size-variation variation-wrapper">
		                                        	<select>
		                                            	<option selected="selected">- [필수] 색상을 선택해주세요 -</option>
		                                            	<option disabled="disabled">-----------------------------------</option>
		                                            	<option value="더티프리_웜그레이">더티프리_웜그레이</option>
		                                            	<option value="더티프리_쉐도우">더티프리_쉐도우</option>
		                                            	<option value="더티프리_아쿠아그린">더티프리_아쿠아그린</option>
		                                            </select>
		                                        </div>                                 
		                                    </div>
                                		</c:when>
                                		<c:when test="${dto.imageIndex == 220}">
                                			<div class="product-size-variations d-flex align-items-center mb--15">
		                                        <p class="variation-label">색상:</p> 
		                                        <div class="product-size-variation variation-wrapper">
		                                        	<select>
		                                            	<option selected="selected">- [필수] 색상을 선택해주세요 -</option>
		                                            	<option disabled="disabled">-----------------------------------</option>
		                                            	<option value="딤그레이">딤그레이</option>
		                                            	<option value="딥블루">딥블루</option>
		                                            </select>
		                                        </div>                                 
		                                    </div>
                                		</c:when>
                                		<c:when test="${dto.imageIndex == 221}">
                                			<div class="product-size-variations d-flex align-items-center mb--15">
		                                        <p class="variation-label">색상:</p> 
		                                        <div class="product-size-variation variation-wrapper">
		                                        	<select>
		                                            	<option selected="selected">- [필수] 색상을 선택해주세요 -</option>
		                                            	<option disabled="disabled">-----------------------------------</option>
		                                            	<option value="딤그레이">딤그레이</option>
		                                            	<option value="오트밀">오트밀</option>
		                                            	<option value="딥블루">딥블루</option>
		                                            </select>
		                                        </div>                                 
		                                    </div>
                                		</c:when>
                                		<c:when test="${dto.imageIndex == 223}">
                                			<div class="product-size-variations d-flex align-items-center mb--15">
		                                        <p class="variation-label">색상:</p> 
		                                        <div class="product-size-variation variation-wrapper">
		                                        	<select>
		                                            	<option selected="selected">- [필수] 색상을 선택해주세요 -</option>
		                                            	<option disabled="disabled">-----------------------------------</option>
		                                            	<option value="웜그레이">웜그레이</option>
		                                            	<option value="미드나잇블루">미드나잇블루</option>
		                                            	<option value="인디블랙">인디블랙</option>
		                                            </select>
		                                        </div>                                 
		                                    </div>
                                		</c:when>
                                		<c:when test="${dto.imageIndex == 224}">
                                			<div class="product-size-variations d-flex align-items-center mb--15">
		                                        <p class="variation-label">색상:</p> 
		                                        <div class="product-size-variation variation-wrapper">
		                                        	<select>
		                                            	<option selected="selected">- [필수] 색상을 선택해주세요 -</option>
		                                            	<option disabled="disabled">-----------------------------------</option>
		                                            	<option value="썬브렐라더티프리_쿨그레이">썬브렐라더티프리_쿨그레이</option>
		                                            	<option value="썬브렐라더티프리_데님블루">썬브렐라더티프리_데님블루</option>
		                                            </select>
		                                        </div>                                 
		                                    </div>
                                		</c:when>
                                		<c:when test="${dto.imageIndex == 225}">
                                			<div class="product-size-variations d-flex align-items-center mb--15">
		                                        <p class="variation-label">옵션:</p> 
		                                        <div class="product-size-variation variation-wrapper">
		                                        	<select>
		                                            	<option selected="selected">- [필수] 옵션을 선택해주세요 -</option>
		                                            	<option disabled="disabled">-----------------------------------</option>
		                                            	<option value="쿠로기 데님 에디션">쿠로기 데님 에디션</option>
		                                            </select>
		                                        </div>                                 
		                                    </div>
                                		</c:when>
                                		<c:otherwise>
                                			<div class="product-size-variations d-flex align-items-center mb--15">
		                                        <p class="variation-label">색상:</p> 
		                                        <div class="product-size-variation variation-wrapper">
		                                        	<select>
		                                            	<option selected="selected">- [필수] 색상을 선택해주세요 -</option>
		                                            	<option disabled="disabled">-----------------------------------</option>
		                                            	<option value="딤그레이">딤그레이</option>
		                                            	<option value="오트밀">오트밀</option>
		                                            	<option value="딥블루">딥블루</option>
		                                            	<option value="차콜그레이">차콜그레이</option>
		                                            </select>
		                                        </div>                                 
		                                    </div>
                                		</c:otherwise>
                                  	</c:choose>
                                	<!-- 옵션 끝 -->
                                    <a href="" class="reset_variations">Clear</a>
                                </form>
                                <div class="product-action d-flex flex-sm-row align-items-sm-center flex-column align-items-start mb--30">
                                    <div class="quantity-wrapper d-flex align-items-center mr--30 mr-xs--0 mb-xs--30">
                                        <label class="quantity-label" for="qty">Quantity:</label>
                                        <div class="quantity">
                                            <input type="number" class="quantity-input" name="qty" id="qty" value="1" min="1">
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-size-sm btn-shape-square" onclick="window.location.href='cart.jsp'">
                                        Add To Cart
                                    </button>
                                </div>  
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center mb--77 mb-md--57">
                        <div class="col-12">
                            <div class="tab-style-2">
                                <div class="nav nav-tabs mb--35 mb-sm--25" id="product-tab" role="tablist">
                                    <a class="nav-link active" id="nav-description-tab" data-toggle="tab" href="#nav-description" role="tab" aria-selected="true"> 
                                        <span>상품 상세정보</span>
                                    </a>
                                    <a class="nav-link" id="nav-info-tab" data-toggle="tab" href="#nav-info" role="tab" aria-selected="true">
                                        <span>상품 구매안내</span>
                                    </a>
                                    <a class="nav-link" id="nav-reviews-tab" data-toggle="tab" href="#nav-reviews" role="tab" aria-selected="true">
                                        <span>상품 사용후기</span>
                                    </a>
                                </div>
                                <div class="tab-content" id="product-tabContent">
                                    <div class="tab-pane fade show active" id="nav-description" role="tabpanel" aria-labelledby="nav-description-tab">
                                        <div class="product-description">
                                        	<c:choose>
                                        		<c:when test="${dto.imageIndex == 212 }">
                                        			<embed style="width: 900px; height: 550px;" src="https://www.youtube.com/embed/0LXWVJzTGjU"> 
	  												<img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail1.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail2.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail3.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail4.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail5.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail6.jpg">	
                                        		</c:when>
                                        		<c:when test="${dto.imageIndex == 213 }">
                                        			<embed style="width: 900px; height: 550px;" src="https://www.youtube.com/embed/czyP_vZyhHw">
                                        			<img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail1.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail2.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail3.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail4.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail5.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail6.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail7.jpg">
                                        		</c:when>
                                        		<c:when test="${dto.imageIndex == 215 }">
                                        			<embed style="width: 900px; height: 550px;" src="https://www.youtube.com/embed/W5F3cKpHPlk">
                                        			<img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail1.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail2.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail3.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail4.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail5.jpg">	
                                        		</c:when>
                                        		<c:when test="${dto.imageIndex == 217  || dto.imageIndex == 223}">
                                        			<embed style="width: 900px; height: 550px;" src="https://www.youtube.com/embed/rFbyje4azX">
                                        			<img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail1.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail2.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail3.jpg">
		                                            <embed style="width: 900px; height: 550px;" src="https://www.youtube.com/embed/Us4rxBdVKVg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail4.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail5.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail6.jpg">	
                                        		</c:when>
                                        		<c:when test="${dto.imageIndex == 218 }">
                                        			<embed style="width: 900px; height: 550px;" src="https://www.youtube.com/embed/rOqhmCKI7OA">
                                        			<img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail1.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail2.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail3.jpg">	
                                        		</c:when>
                                        		<c:when test="${dto.imageIndex == 220 || dto.imageIndex == 221 || dto.imageIndex == 226 || dto.imageIndex == 227 || dto.imageIndex == 230 }">
                                        			<embed style="width: 900px; height: 550px;" src="https://www.youtube.com/embed/czyP_vZyhHw">
                                        			<img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail1.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail2.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail3.jpg">
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail4.jpg">
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail5.jpg">
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail6.jpg">
                                        		</c:when>
                                        		<c:when test="${dto.imageIndex == 224}">
                                        			<embed style="width: 900px; height: 550px;" src="https://www.youtube.com/embed/2SwYqd21gPk">
                                        			<img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail1.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail2.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail3.jpg">
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail4.jpg">
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail5.jpg">
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail6.jpg">
                                        		</c:when>
                                        		<c:when test="${dto.imageIndex == 228 || dto.imageIndex == 229}">
                                        			<embed style="width: 900px; height: 550px;" src="https://www.youtube.com/embed/71VEqYwN650">
                                        			<img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail1.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail2.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail3.jpg">
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail4.jpg">
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail5.jpg">
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail6.jpg">
                                        		</c:when>
                                        		<c:otherwise>
                                        			<img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail1.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail2.jpg">	
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail3.jpg">
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail4.jpg">
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail5.jpg">
		                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail6.jpg">
                                        		</c:otherwise>
                                        	</c:choose>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="nav-info" role="tabpanel" aria-labelledby="nav-info-tab">
                                        <div class="table-content table-responsive">
                                            <img alt="" src="<%=cp %>/resources/images/bedroom/${dto.imageIndex }_goo1.jpg">
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="nav-reviews" role="tabpanel" aria-labelledby="nav-reviews-tab">
                                        <div class="product-reviews">
                                            <h3 class="review__title">1 review for Black Blazer</h3>
                                            <ul class="review__list">
                                                <li class="review__item">
                                                    <div class="review__container">
                                                        <img src="<%=cp %>/resources/assets/img/others/comment-1.jpg" alt="Review Avatar" class="review__avatar">
                                                        <div class="review__text">
                                                            <div class="d-flex flex-sm-row flex-column justify-content-between">
                                                                <div class="review__meta">
                                                                    <strong class="review__author">John Snow </strong>
                                                                    <span class="review__dash">-</span>
                                                                    <span class="review__published-date">November 20, 2018</span>
                                                                </div>
                                                                <div class="product-rating">
                                                                    <div class="star-rating star-five">
                                                                        <span>Rated <strong class="rating">5.00</strong> out of 5</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <p class="review__description">Aliquam egestas libero ac turpis pharetra, in vehicula lacus scelerisque. Vestibulum ut sem laoreet, feugiat tellus at, hendrerit arcu.</p>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <div class="review-form-wrapper">
                                                <div class="row">
                                                    <div class="col-lg-8">
                                                        <span class="reply-title">Add a review</span>
                                                        <form action="#" class="form pr--30">
                                                            <div class="form-notes mb--20">
                                                                <p>Your email address will not be published. Required fields are marked <span class="required">*</span></p>
                                                            </div>
                                                            <div class="form__group mb--10 pb--1">
                                                                <label class="form__label d-block" >Your Ratings</label>
                                                                <div class="rating">
                                                                    <span><i class="la la-star"></i></span>
                                                                    <span><i class="la la-star"></i></span>
                                                                    <span><i class="la la-star"></i></span>
                                                                    <span><i class="la la-star"></i></span>
                                                                    <span><i class="la la-star"></i></span>
                                                                </div>
                                                            </div>
                                                            <div class="form__group mb--10">
                                                                <label class="form__label d-block" for="email">Your Review<span class="required">*</span></label>
                                                                <textarea name="review" id="review" class="form__input form__input--textarea"></textarea>
                                                            </div>
                                                            <div class="form__group mb--20">
                                                                <label class="form__label d-block" for="name">Name<span class="required">*</span></label>
                                                                <input type="text" name="name" id="name" class="form__input">
                                                            </div>
                                                            <div class="form__group mb--20">
                                                                <label class="form__label d-block" for="email">Email<span class="required">*</span></label>
                                                                <input type="email" name="email" id="email" class="form__input">
                                                            </div>
                                                            <div class="form__group">
                                                                <div class="form-row">
                                                                    <div class="col-12">
                                                                        <input type="submit" value="Submit Now" class="btn btn-size-md">
                                                                    </div>
                                                                </div>
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
                    <div class="row mb--75 mb-md--55">
                        <div class="col-12">
                            <div class="element-carousel slick-vertical-center" data-slick-options='{
                                "spaceBetween": 30,
                                "slidesToShow": 4,
                                "slidesToScroll": 1,
                                "arrows": true,
                                "prevArrow": {"buttonClass": "slick-btn slick-prev", "iconClass": "la la-angle-double-left" },
                                "nextArrow": {"buttonClass": "slick-btn slick-next", "iconClass": "la la-angle-double-right" }
                            }'
                            data-slick-responsive= '[
                                {"breakpoint":1199, "settings": {
                                    "slidesToShow": 3
                                }},
                                {"breakpoint":991, "settings": {
                                    "slidesToShow": 2
                                }},
                                {"breakpoint":575, "settings": {
                                    "slidesToShow": 1
                                }}
                            ]'>
                                <c:forEach items="${lists }" var="dto">
                                <div class="item">
                                    <div class="ft-product">
                                        <div class="product-inner">
                                            <div class="product-image">
                                                <figure class="product-image--holder">
                                            	${dto.imageIndex }
                                                    <img src="<%=cp %>/resources/images/livingroom/${dto.imageIndex}.jpg" alt="Product">
                                                </figure>
                                                <a href="living_${dto.cateEn }_details.fu?imageIndex=${dto.imageIndex }&cateEn=${dto.cateEn }" class="product-overlay"></a>
                                                <div class="product-action">
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
                                                    <a href="living_${dto.cateEn }_details.fu?imageIndex=${dto.imageIndex }&cateEn=${dto.cateEn }">${dto.cate }</a>
                                                </div>
                                                <h3 class="product-title"><a href="living_${dto.cateEn }_details.fu?imageIndex=${dto.imageIndex }&cateEn=${dto.cateEn }">${dto.productName }</a></h3>
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
                                <!-- 끝 -->
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Content Wrapper End -->

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
                                            <a href="shop-fullwidth.jsp">
                                                <span class="mm-text">Full Width</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="shop.jsp">
                                                <span class="mm-text">Left Sidebar</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="shop-right-sidebar.jsp">
                                                <span class="mm-text">Right Sidebar</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="shop-three-columns.jsp">
                                                <span class="mm-text">Three Columns</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="shop-four-columns.jsp">
                                                <span class="mm-text">Four Columns</span>
                                            </a>
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
        <div class="modal fade product-modal" id="productModal" tabindex="-1" role="dialog" aria-hidden="true">
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
        </div>
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