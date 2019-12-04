<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/image/주방다이닝룸.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">주방/다이닝룸</h1>
                        <ul class="breadcrumb">
                            <li><a href="/furnitureweb/">Home</a></li>
                            <li class="current"><span>선브렐라 체어│클린터치 테이블│리놀륨 테이블│테이블│체어│장식장│책상/선반</span></li>
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
                                                <b>주방 / 다이닝룸</b>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="shop-toolbar__right d-flex justify-content-md-end justify-content-start flex-sm-row flex-column">
                                            <p class="product-pages">홈 > 주방 /다이닝룸</p>
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
                                                        <img src="<%=cp %>/resources/images/dining/${dto.saveFileName}" alt="Product">
                                                    </figure>
                                                    <a href="dining_${dto.cateEn }_details.fu?imageIndex=${dto.imageIndex }&cate=${dto.cate}&pageNum=${pageNum}" class="product-overlay"></a>
                                                    <div class="product-action">
                                                        <!-- <a data-toggle="modal" data-target="#productModal" class="action-btn">
                                                            <i class="la la-eye"></i>
                                                        </a> -->
                                                        <a href="wishlist.fu?cate=${dto.cate }&itemname=${dto.productName }&price=${dto.price }&imagepath=/resources/images/dining/${dto.saveFileName}" class="action-btn">
                                                            <i class="la la-heart-o"></i>
                                                        </a>
                                                        <a href="wishlist.html" class="action-btn">
                                                            <i class="la la-repeat"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="product-info">
                                                    <div class="product-category">
                                                        <a href="dining_${dto.cateEn }_details.fu?imageIndex=${dto.imageIndex }&cate=${dto.cate}&pageNum=${pageNum}">${dto.cate }</a>
                                                    </div>
                                                    <h3 class="product-title"><a href="dining_${dto.cateEn }_details.fu?imageIndex=${dto.imageIndex }&cate=${dto.cate}&pageNum=${pageNum}">${dto.productName }</a></h3>
                                                    <div class="product-info-bottom">
                                                        <div class="product-price-wrapper">
                                                            <c:if test="${dto.imageIndex>=1 && dto.imageIndex<=43 }">
                                   							<span class="money">${dto.price }원</span>
                                    						</c:if>
                                    						<c:if test="${dto.imageIndex>=44 && dto.imageIndex<=45 }">
                                    						<span class="money">일시품절</span>
                                    						</c:if>
                                    						<c:if test="${dto.imageIndex>=46 && dto.imageIndex<=59 }">
                                   							<span class="money">${dto.price }원</span>
                                    						</c:if>
                                    						<c:if test="${dto.imageIndex==60 }">
                                    						<span class="money">일시품절</span>
                                    						</c:if>
                                    						<c:if test="${dto.imageIndex>=61 && dto.imageIndex<=72 }">
                                   							<span class="money">${dto.price }원</span>
                                    						</c:if>
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
        <!-- Main Content Wrapper Start -->

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>