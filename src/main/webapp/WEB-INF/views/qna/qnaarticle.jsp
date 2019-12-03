<%@page import="com.funi.domain.QnADTO"%>
<%@page import="com.funi.domain.Re_QnADTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	QnADTO dto=(QnADTO)request.getAttribute("dto");
	List<Re_QnADTO>lists=(List<Re_QnADTO>)request.getAttribute("lists");
	String mode=(String)request.getAttribute("mode");
%>  
<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
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
        
        <!-- Header End -->

        <!-- Breadcrumb area Start -->
         
        <section class="page-title-area-2 bg-image" data-bg-image="<%=cp %>/resources/assets/img/reviewimg/backgroundimages1.jpg">
        <!-- <section class="page-title-area-2 bg-image"> -->
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h1 class="sr-only">Blog Details</h1>
                    </div>
                </div>
            </div>
        </section>
         
        <!-- Breadcrumb area End -->

        <!-- Main Content Wrapper Start -->
        <main class="main-content-wrapper">
            <div class="inner-page-content">
                <!-- Single Post Area Start -->
                <div class="single-post-area mb--75 mb-md--55">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-9">
                                <!-- Single Post Start -->
                                <article class="single-post mb--75 mb-md--55 pb--75 pb-md--55">
                                	<%if((String)request.getParameter("mode")==null){ %>
                                    <header class="single-post__header">
                                        <h2 class="single-post__title"><%=dto.getSubject() %></h2>
                                        <div class="single-post__media">
                                            <figure class="image">
                                            		
                                                <%-- <img src="/img/<%=dto.getPhoto() %>" alt="Single Post Title" class="w-100"> --%>
                                            </figure>
                                        </div>
                                        <div class="single-post__header-meta">
                                            <span class="posted-on"><%=dto.getCreated_at() %></span>
                                            <span class="post-category">
                                                <%=dto.getName() %>
                                            </span>
                                        </div>
                                    </header>
                                    <div class="single-post__info">
                                        <div class="row mb--43 mb-md-33">
                                            <div class="col-lg-8 col-md-8">
                                            <textarea rows="10" cols="105" readonly="readonly"><%=dto.getContent() %></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="<%=cp %>/qnarewrite.fu?id=<%=dto.getId() %>&mode=1">
                                    <img src="<%=cp %>/resources/assets/img/reviewimg/rewrite.png" width=50 height=50>
                                    </a>
                                    <a href="<%=cp %>/qnadelete.fu?id=<%=dto.getId() %>">
                                    <img src="<%=cp %>/resources/assets/img/reviewimg/delete.jpg" width=50 height=50>
                                    </a>
                                    <%}else {%>
                                   <form action="qnarewrite_ok.fu?id=<%=dto.getId() %>" method="post" enctype="application/x-www-form-urlencoded">
                                   <header class="single-post__header">
                                        <input type="text" name="subject" id="subject" class="form__input" value="<%=dto.getSubject() %>" style="width: 700px">
                                        <div class="single-post__media">
                                            <figure class="image">
                                            		
                                                <%-- <img src="/img/<%=dto.getPhoto() %>" alt="Single Post Title" class="w-100"> --%>
                                            </figure>
                                        </div>
                                        <div class="single-post__header-meta">
                                            <span class="posted-on"><%=dto.getCreated_at() %></span>
                                            <span class="post-category">
                                                <%=dto.getName() %>
                                            </span>
                                        </div>
                                    </header>
                                    <div class="single-post__info">
                                        <div class="row mb--43 mb-md-33">
                                            <div class="col-lg-8 col-md-8">
                                            <textarea rows="10" cols="105" name="content" id="content"><%=dto.getContent() %></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-size-sm">작성</button>
                                    <a href="<%=cp %>/qnarewrite.fu?id=<%=dto.getId() %>&mode=1">
                                    <img src="<%=cp %>/resources/assets/img/imgsrc/reviewimg/rewrite.png" width=50 height=50>
                                    </a>
                                    <a href="<%=cp %>/qnadelete.fu?id=<%=dto.getId() %>">
                                    <img src="<%=cp %>/resources/assets/img/imgsrc/reviewimg/delete.jpg" width=50 height=50>
                                    </a>
                                   </form>
                                   <%} %>																																																																																																																																																																																																																																																																																																																													```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
                                </article>
                                <!-- Single Post End -->

                                <!-- Comment Area Start -->
                                <section class="comment">
                                    <h2 class="comment-title"><%=lists.size() %> comments</h2>
                                    <ul class="comment-list mb--45">
                                        <%-- <li>
                                            <div class="single-comment">
                                                <figure class="comment-avatar">
                                                    <img src="<%=cp %>/resources/assets/img/others/avatar-large-2.png" alt="Avatar">
                                                </figure>
                                                <div class="comment-info">
                                                    <div class="comment-meta">
                                                        <h4>임꺽정</h4>
                                                        <div class="metadata">
                                                            <span class="comment-date">2019-09-30</span>
                                                        </div>
                                                    </div>
                                                    <div class="comment-content">
                                                        <p>제가봐도 좋은 가구같군요 <br> 하얀색이면 쉽게 더러워지지 않나요?</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="single-comment">
                                                <figure class="comment-avatar">
                                                    <img src="<%=cp %>/resources/assets/img/others/comment-1.jpg" alt="Avatar">
                                                </figure>
                                                <div class="comment-info">
                                                    <div class="comment-meta">
                                                        <h4>홍길동</h4>
                                                        <div class="metadata">
                                                            <span class="comment-date">2019-09-30</span>
                                                        </div>
                                                    </div>
                                                    <div class="comment-content">
                                                        <p>쉽게 안더러워지더라고요 <br> 닦는것도 쉽고요</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li> --%>
                                        
                                        <%for(Re_QnADTO re_dto:lists){ %>
                                        <li>
                                            <div class="single-comment">
                                                <figure class="comment-avatar">
                                                    <img src="<%=cp %>/resources/assets/img/others/avatar-large-2.png" alt="Avatar">
                                                </figure>
                                                <div class="comment-info">
                                                    <div class="comment-meta">
                                                        <h4><%=re_dto.getName() %></h4>
                                                        <div class="metadata">
                                                            <span class="comment-date"><%=re_dto.getCreated_at() %></span>
                                                        </div>
                                                    </div>
                                                    <div class="comment-content">
                                                        <p><%=re_dto.getContent() %></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <%} %>
                                    </ul>
                                    <div class="comment-respond">
                                        <h3 class="comment-reply-title">Write a Reply or Comment</h3>
                                        <form action="qnaarticlewrite.fu" class="form comment-form" method="post">
                                        <input type="hidden" name="qaboard_id" value="<%=dto.getId()%>">
                                            <div class="form__group mb--25 mb-sm--20">
                                                <div class="form-row">
                                                </div>
                                            </div>
                                            <div class="form__group mb--25 mb-sm--20">
                                                <div class="form-row">
                                                    <div class="col-12">
                                                        <textarea name="content" id="review" class="form__input form__input--textarea" placeholder="댓글 작성하기"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form__group">
                                                <div class="form-row">
                                                    <div class="col-12">
                                                        <button type="submit" class="btn btn-size-sm">댓글 작성하기</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </section>
                                <!-- Comment Area End -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Post Area End -->

                <!-- Related Post Area Start -->
                <section class="related-post-area mb--80 mb-md--60">
                    <div class="container">
                        <div class="row mb--50">
                            <div class="col-12 text-center">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="element-carousel slick-dot-mt-40 related-post-carousel" data-slick-options='{
                                    "spaceBetween": 30,
                                    "slidesToShow": 2,
                                    "slidesToScroll": 1,
                                    "dots": true,
                                    "infinite": true, 
                                    "centerMode": true
                                }' data-slick-responsive='[
                                    {"breakpoint": 768, "settings": {"slidesToShow": 1}}
                                ]'>
                                    
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Related Post Area End -->
            </div>
        </main>
        <!-- Main Content Wrapper End -->

        <!-- Footer Start-->
        <%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>
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
                                    <a href="index.html">Homepage 01</a>
                                </li>
                                <li>
                                    <a href="index-02.html">Homepage 02</a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="shop.html">Shop</a>
                            <ul class="sub-menu">
                                <li class="menu-item-has-children">
                                    <a href="#">
                                        <span class="mm-text">Shop Grid</span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="shop-fullwidth.html">Full Width</a>
                                        </li>
                                        <li>
                                            <a href="shop.html">Left Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="shop-right-sidebar.html">Right Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="shop-three-columns.html">Three Columns</a>
                                        </li>
                                        <li>
                                            <a href="shop-four-columns.html">Four Columns</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Shop List</a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="shop-list.html">Full Width</a>
                                        </li>
                                        <li>
                                            <a href="shop-list-sidebar.html">Left Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="shop-list-right-sidebar.html">Right Sidebar</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Product Details</a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="product-details.html">Tab Style 1</a>
                                        </li>
                                        <li>
                                            <a href="product-details-tab-style-2.html">Tab Style 2</a>
                                        </li>
                                        <li>
                                            <a href="product-details-tab-style-3.html">Tab Style 3</a>
                                        </li>
                                        <li>
                                            <a href="product-details-gallery-left.html">Gallery Left</a>
                                        </li>
                                        <li>
                                            <a href="product-details-gallery-right.html">Gallery Right</a>
                                        </li>
                                        <li>
                                            <a href="product-details-sticky-left.html">Sticky Left</a>
                                        </li>
                                        <li>
                                            <a href="product-details-sticky-right.html">Sticky Right</a>
                                        </li>
                                        <li>
                                            <a href="product-details-slider-box.html">Slider Box</a>
                                        </li>
                                        <li>
                                            <a href="product-details-slider-full-width.html">Slider Box Full Width</a>
                                        </li>
                                        <li>
                                            <a href="product-details-affiliate.html">Affiliate Proudct</a>
                                        </li>                                                    
                                        <li>
                                            <a href="product-details-variable.html">Variable Proudct</a>
                                        </li>
                                        <li>
                                            <a href="product-details-group.html">Group Product</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="blog.html">Blog</a>
                            <ul class="sub-menu">
                                <li class="menu-item-has-children">
                                    <a href="#">Blog</a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="blog-left-sidebar.html">Blog Left Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="blog.html">Blog Right Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="blog-01-column.html">Blog 01 column</a>
                                        </li>
                                        <li>
                                            <a href="blog-02-columns.html">Blog 02 columns</a>
                                        </li>
                                        <li>
                                            <a href="blog-03-columns.html">Blog 03 columns</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Blog Details</a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="blog-details-audio.html">Audio Blog Details</a>
                                        </li>
                                        <li>
                                            <a href="blog-details-gallery.html">Gallery Blog Details</a>
                                        </li>
                                        <li>
                                            <a href="blog-details-image.html">image Blog Details</a>
                                        </li>
                                        <li>
                                            <a href="blog-details-video.html">Video Blog Details</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#">Pages</a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="my-account.html">My Account</a>
                                </li>
                                <li>
                                    <a href="checkout.html">Checkout</a>
                                </li>
                                <li>
                                    <a href="cart.html">Cart</a>
                                </li>
                                <li>
                                    <a href="compare.html">Compare</a>
                                </li>
                                <li>
                                    <a href="order-tracking.html">Track Order</a>
                                </li>
                                <li>
                                    <a href="wishlist.html">Wishlist</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="contact-us.html">Contact Us</a>
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
                                    <a class="mini-cart__product-title" href="product-details.html">Golden Easy Spot Chair.</a>
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
                                    <a class="mini-cart__product-title" href="product-details.html">Golden Easy Spot Chair.</a>
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
                                    <a class="mini-cart__product-title" href="product-details.html">Golden Easy Spot Chair.</a>
                                    <span class="mini-cart__product-quantity">1 x $49.00</span>
                                </div>
                            </li>
                        </ul>
                        <div class="mini-cart__total">
                            <span>Subtotal</span>
                            <span class="ammount">$98.00</span>
                        </div>
                        <div class="mini-cart__buttons">
                            <a href="cart.html" class="btn btn-fullwidth btn-bg-primary mb--20">View Cart</a>
                            <a href="checkout.html" class="btn btn-fullwidth btn-bg-primary">Checkout</a>
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
                                    <a href="product-details.html">
                                        <img src="<%=cp %>/resources/assets/img/products/prod-01.jpg" alt="Product Image" class="primary-image">
                                    </a>
                                </div>
                                <span class="product-badge sale">sale</span>
                            </div>
                            <div class="product-image">
                                <div class="product-image--holder">
                                    <a href="product-details.html">
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
                                <button type="button" class="btn btn-size-sm btn-shape-square" onclick="window.location.href='cart.html'">
                                    Add To Cart
                                </button>
                            </div>  
                            <div class="product-footer-meta">
                                <p><span>Category:</span>
                                    <a href="shop.html">Full Sweater</a>,
                                    <a href="shop.html">SweatShirt</a>,
                                    <a href="shop.html">Jacket</a>,
                                    <a href="shop.html">Blazer</a>
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