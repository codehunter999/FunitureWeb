<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/image/홈데코리빙.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">홈데코 / 리빙</h1>
                        <ul class="breadcrumb">
                            <li><a href="/furnitureweb/">Home</a></li>
                            <li class="current"><span>월간 카레클린트│조명│PLASTIC 체어</span></li>
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
                                                <b>홈데코 / 리빙</b>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="shop-toolbar__right d-flex justify-content-md-end justify-content-start flex-sm-row flex-column">
                                            <p class="product-pages">홈 > 홈데코 /리빙</p>
                                            <div class="product-view-mode ml--50 ml-xs--0">
                                                <a class="active" href="#" data-target="grid">
                                                    <img src="<%=cp %>/resources/assets/img/icons/grid.png" alt="Grid">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <hr/><br/>
                            
                            <!-- 상품목록 -->
                            <div class="shop-products">
                                <div class="row">
                                <c:forEach items="${lists }" var="dto">
                                    <div class="col-xl-3 col-lg-4 col-sm-6 mb--50">
                                    
                                        <div class="ft-product">
                                            <div class="product-inner">
                                                <div class="product-image">
                                                    <figure class="product-image--holder">
                                                        <img src="<%=cp %>/resources/images/deco/${dto.saveFileName}" alt="Product">
                                                    </figure>
                                                    <a href="deco_${dto.cateEn }_details.fu?imageIndex=${dto.imageIndex }&cate=${dto.cate}&pageNum=${pageNum}" class="product-overlay"></a>
                                                    <div class="product-action">
                                                        <!-- <a data-toggle="modal" data-target="#productModal" class="action-btn">
                                                            <i class="la la-eye"></i>
                                                        </a> -->
                                                        <a href="wishlist.fu?cate=${dto.cate }&itemname=${dto.productName }&price=${dto.price }&imagepath=/resources/images/deco/${dto.saveFileName}" class="action-btn">
                                                            <i class="la la-heart-o"></i>
                                                        </a>
                                                        
                                                    </div>
                                                </div>
                                                <div class="product-info">
                                                    <div class="product-category">
                                                        <a href="deco_${dto.cateEn }_details.fu?imageIndex=${dto.imageIndex }&cate=${dto.cate}&pageNum=${pageNum}">${dto.cate }</a>
                                                    </div>
                                                    <h3 class="product-title"><a href="deco_${dto.cateEn }_details.fu?imageIndex=${dto.imageIndex }&cate=${dto.cate}&pageNum=${pageNum}">${dto.productName }</a></h3>
                                                    <div class="product-info-bottom">
                                                        <div class="product-price-wrapper">
                                                            <span class="money">${dto.price }원</span>
                                                        </div>
                                                        <a href="cart.html" class="add-to-cart pr--15">
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
                            <nav class="pagination-wrap">
                                <ul class="pagination">
                                    <!-- <li><span class="page-number current">1</span></li>
                                    <li><a href="#" class="page-number">2</a></li>
                                    <li><span class="dot"></span></li>
                                    <li><span class="dot"></span></li>
                                    <li><span class="dot"></span></li>
                                    <li><a href="#" class="page-number">16</a></li> -->
                                    <c:if test="${dataCount!=0 }">
                                    	${pageIndexList }
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
        <!-- Main Content Wrapper Start -->

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>
