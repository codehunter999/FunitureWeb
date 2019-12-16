<%@page import="com.funi.domain.FurnitureDTO"%>
<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/assets/img/bedroom/bedroomImage.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">BED ROOM</h1>
                        <ul class="breadcrumb">
                            <li><a href="<%=cp%>/">Home</a></li>
                            <li class="current"><span>침대│협탁│화장대│서랍장</span></li>
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
                                                <b>침실 / 베드룸</b>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="shop-toolbar__right d-flex justify-content-md-end justify-content-start flex-sm-row flex-column">
                                            <p class="product-pages">홈 > 침실 /베드룸</p>
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
                            <div class="shop-products">
                                <div class="row">
                                    <c:forEach items="${lists }" var="dto">
                                    <div class="col-xl-3 col-lg-4 col-sm-6 mb--50">
                                    
                                        <div class="ft-product">
                                            <div class="product-inner">
                                                <div class="product-image">
                                                    <figure class="product-image--holder">
                                                    <%-- ${dto.imageIndex }
                                                    ${dto.cateEn } --%>
                                                        <img src="<%=cp %>/resources/images/bedroom/${dto.imageIndex}.jpg" alt="Product">	
                                                    </figure>
                                                    <a href="bed_${dto.cateEn }_details.fu?imageIndex=${dto.imageIndex }&cateEn=${dto.cateEn }" class="product-overlay"></a>
                                                    <div class="product-action">
                                                        <!-- <a data-toggle="modal" data-target="#productModal" class="action-btn">
                                                            <i class="la la-eye"></i>
                                                        </a> -->
                                                        <%
                                                            FurnitureDTO dto=(FurnitureDTO)pageContext.getAttribute("dto");
                                                            
                                                            if(dto.getProductName().contains("[")){
                                                    	        String str=dto.getProductName();
                                                    	        str=str.replace("[", "%5B");
                                                    	        str=str.replace("]", "%5D");
                                                    	%>
                                                   		 <a href="wishlist.fu?cate=${dto.cate }&itemname=<%=str %>&price=${dto.price }&imagepath=/resources/images/bedroom/${dto.imageIndex}.jpg" class="action-btn">       
                                                            <i class="la la-heart-o"></i>
                                                        </a>
                                                            <%}else{ %>
                                                                <a href="wishlist.fu?cate=${dto.cate }&itemname=${dto.productName }&price=${dto.price }&imagepath=/resources/images/bedroom/${dto.imageIndex}.jpg" class="action-btn">       
                                                                    <i class="la la-heart-o"></i>
                                                                </a>
                                                            <%} %>
                                                        <!-- <a href="wishlist.html" class="action-btn">
                                                            <i class="la la-repeat"></i>
                                                        </a> -->
                                                    </div>
                                                </div>
                                                <div class="product-info">
                                                    <div class="product-category">
                                                        <a href="bed_${dto.cateEn }_details.fu?imageIndex=${dto.imageIndex }&cateEn=${dto.cateEn }">${dto.cate }</a>
                                                    </div>
                                                    <h3 class="product-title"><a href="bed_${dto.cateEn }_details.fu?imageIndex=${dto.imageIndex }&cateEn=${dto.cateEn }">${dto.productName }</a></h3>
                                                    <div class="product-info-bottom">
                                                        <div class="product-price-wrapper">
                                                            <span class="money">${dto.price }원</span>
                                                        </div>
                                                        <!-- <a href="cart.html" class="add-to-cart pr--15">
                                                            <i class="la la-plus"></i>
                                                            <span>Add To Cart</span>
                                                        </a> -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <!-- *******page********* -->
                           <nav class="pagination-wrap">
                                <ul class="pagination">
                                    <c:if test="${dataCount!=0 }">
                                    	${pageIndexList }
                                    </c:if>
                                    <c:if test="${dataCount==0 }">
                                    	등록된 게시물이 없습니다.
                                    </c:if>
                                </ul>
                            </nav>
                            <!-- **********page************ -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Content Wrapper Start -->

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>