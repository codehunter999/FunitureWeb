<%@page import="com.funi.domain.FurnitureDTO"%>
<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/image/주방다이닝룸.jpg">
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
                                                    <img src="<%=cp %>/resources/images/dining/${dto.saveFileName}" alt="Product">
                                                    <span class="product-badge sale">Sale</span>
                                                    <div class="product-gallery__actions">
                                                        <button class="action-btn btn-zoom-popup"><i class="la la-eye"></i></button>
                                                        <!-- <a href="https://www.youtube.com/watch?v=Rp19QD2XIGM" class="action-btn video-popup"><i class="la la-play"></i></a> -->
                                                    </div>
                                                </figure>
                                                <figure class="product-gallery__image zoom">
                                                    <img src="<%=cp %>/resources/images/dining/${dto.saveFileName}" alt="Product">
                                                    <span class="product-badge sale">Sale</span>
                                                    <div class="product-gallery__actions">
                                                        <button class="action-btn btn-zoom-popup"><i class="la la-eye"></i></button>
                                                        <a href="https://www.youtube.com/watch?v=Rp19QD2XIGM" class="action-btn video-popup"><i class="la la-play"></i></a>
                                                    </div>
                                                </figure>
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <%-- <div class="product-gallery__nav-image">
                                        <div class="element-carousel nav-slider product-slide-nav slick-vertical-center" 
                                        data-slick-options='{
                                            "spaceBetween": 30,
                                            "slidesToShow": 3,
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
                                          <c:forEach items="${catelists }" var="dto">
                                            <figure class="product-gallery__nav-image--single">
                                                <a href="dining_rnl_details.fu?imageIndex=${dto.imageIndex }&cate=${dto.cate}">
                                                	<img src="<%=cp %>/resources/images/dining/${dto.saveFileName}" alt="Products">
                                                </a>
                                            </figure>
                                      </c:forEach>
                                        </div>
                                    </div> --%>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 offset-xl-1 col-lg-5 product-main-details mt-md--50">
                            <div class="product-summary pl-lg--30 pl-md--0">
                                <!-- <div class="product-navigation text-right mb--20">
                                    <a href="#" class="prev"><i class="la la-angle-double-left"></i></a>
                                    <a href="#" class="next"><i class="la la-angle-double-right"></i></a>
                                </div>
                                <div class="product-rating d-flex mb--20">
                                    <div class="star-rating star-four">
                                        <span>Rated <strong class="rating">5.00</strong> out of 5</span>
                                    </div>
                                </div> -->
                                <h3 class="product-title mb--20">${dto.productName }</h3>
                                <div class="product-price-wrapper mb--25">
                                <hr/>
                                    <span class="money">${dto.price }원</span>
                                </div>
                                <form action="#" class="variation-form mb--20">
                                    <div class="product-size-variations d-flex align-items-center mb--15">
                                        <p class="variation-label">Option:</p>   
                                        <div class="product-size-variation variation-wrapper">
                                        
                                       		 <c:if test="${dto.imageIndex>=15 && dto.imageIndex<=17 }">
                                       			<select>
                                        		    <option selected="selected">- [사이즈] 옵션을 선택해주세요 -</option>
                                      		      <option disabled="disabled">-----------------------------------</option>
                                      		      <option value="1400*800">1400*800</option>
                                    		    </select>
                                      		  	<select>
                                     		       <option selected="selected">- [색상] 옵션을 선택해주세요 -</option>
                                       			   <option disabled="disabled">-----------------------------------</option>
                                       			</select>
                                       		</c:if>
                                        
                                       		<c:if test="${dto.imageIndex>=18 && dto.imageIndex<=20 }">
                                       			<select>
                                            		<option selected="selected">- [색상] 옵션을 선택해주세요 -</option>
                                            		<option disabled="disabled">-----------------------------------</option>
                                            		<option value="딥그린">딥그린</option>
                                            		<option value="버건디">버건디</option>
                                            		<option value="다크그레이">다크그레이</option>
                                        		</select>
                                        	</c:if>
                                        
                                        	<c:if test="${dto.imageIndex==21 }">
                                       			<select>
                                           			<option selected="selected">- [색상] 옵션을 선택해주세요 -</option>
                                            		<option disabled="disabled">-----------------------------------</option>
                                            		<option value="크림">크림</option>
                                            		<option value="쿨그레이">쿨그레이</option>
                                            		<option value="화이트">화이트</option>
                                        		</select>
                                        		<select>
                                            		<option selected="selected">- [다리] 옵션을 선택해주세요 -</option>
                                            		<option disabled="disabled">-----------------------------------</option>
                                        		</select>
                                        	</c:if>
                                        	
                                        	<c:if test="${dto.imageIndex==22 }">
                                       			<select>
                                           			<option selected="selected">- [색상] 옵션을 선택해주세요 -</option>
                                            		<option disabled="disabled">-----------------------------------</option>
                                            		<option value="다크그린">다크그린</option>
                                            		<option value="블랙">블랙</option>
                                            		<option value="다크브라운">다크브라운</option>
                                        		</select>
                                        		<select>
                                            		<option selected="selected">- [쿠션색상] 옵션을 선택해주세요 -</option>
                                            		<option disabled="disabled">--------------------------------------</option>
                                        		</select>
                                         	</c:if>
                                         	
                                         	<c:if test="${dto.imageIndex==23 }">
                                       			<select>
                                           			<option selected="selected">- [색상] 옵션을 선택해주세요 -</option>
                                            		<option disabled="disabled">-----------------------------------</option>
                                            		<option value="민트그린">민트그린</option>
                                            		<option value="화이트">화이트</option>
                                            		<option value="쿨그레이">쿨그레이</option>
                                        		</select>
                                         	</c:if>
                                         	
                                         	<c:if test="${dto.imageIndex==24 }">
                                       			<select>
                                           			<option selected="selected">- [색상] 옵션을 선택해주세요 -</option>
                                            		<option disabled="disabled">-----------------------------------</option>
                                            		<option value="화이트">화이트</option>
                                            		<option value="쿨그레이">쿨그레이</option>
                                            		<option value="다크그레이">다크그레이</option>
                                        		</select>
                                         	</c:if>
                                         	
                                         	<c:if test="${dto.imageIndex==25 }">
                                       			<select>
                                           			<option selected="selected">- [색상] 옵션을 선택해주세요 -</option>
                                            		<option disabled="disabled">-----------------------------------</option>
                                            		<option value="오션블루">오션블루</option>
                                            		<option value="머스타드">머스타드</option>
                                            		<option value="레드">레드</option>
                                        		</select>
                                        		<select>
                                            		<option selected="selected">- [다리] 옵션을 선택해주세요 -</option>
                                            		<option disabled="disabled">-----------------------------------</option>
                                        		</select>
                                         	</c:if>
                                        
                                        </div>                                 
                                    </div>
                                    <a href="" class="reset_variations">Clear</a>
                                </form>
                                <div class="product-action d-flex flex-sm-row align-items-sm-center flex-column align-items-start mb--30">
                                    <div class="quantity-wrapper d-flex align-items-center mr--30 mr-xs--0 mb-xs--30">
                                        <label class="quantity-label" for="qty">Quantity:</label>
                                        <div class="quantity">
                                            <input type="number" class="quantity-input" name="qty" id="qty" value="1" min="1">
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-size-sm btn-shape-square" onclick="window.location.href='cart.fu'">
                                        Add To Cart
                                    </button>
                                </div>  
                                <!-- <div class="product-footer-meta">
                                    <p><span>Category:</span> 
                                        <a href="shop.jsp">Full Sweater</a>,
                                        <a href="shop.jsp">SweatShirt</a>,
                                        <a href="shop.jsp">Jacket</a>,
                                        <a href="shop.jsp">Blazer</a>
                                    </p>
                                </div> -->
                            </div>
                        </div>
                    </div>
                    
                    <!-- 상세정보 & 구매안내 & 사용후기 -->
                    <div class="row justify-content-center mb--77 mb-md--57">
                        <div class="col-12">
                            <div class="tab-style-2">
                                <div class="nav nav-tabs mb--35 mb-sm--25" id="product-tab" role="tablist">
                                    <a class="nav-link active" id="nav-description-tab" data-toggle="tab" href="#nav-description" role="tab" aria-selected="true"> 
                                        <span>상품상세정보</span>
                                    </a>
                                    <a class="nav-link" id="nav-info-tab" data-toggle="tab" href="#nav-info" role="tab" aria-selected="true">
                                        <span>상품구매안내</span>
                                    </a>
                                    <a class="nav-link" id="nav-reviews-tab" data-toggle="tab" href="#nav-reviews" role="tab" aria-selected="true">
                                        <span>상품사용후기</span>
                                    </a>
                                </div>
                                <div class="tab-content" id="product-tabContent">
                                
                                <!-- 상품상세정보 -->
                                    <div class="tab-pane fade show active" id="nav-description" role="tabpanel" aria-labelledby="nav-description-tab">
                                        <div class="product-description">
                                            <img alt="product" src="<%=cp %>/resources/images/dining/detail/rnl/${dto.imageIndex}_details_3.jpg"><br/>
                                            <img alt="product" src="<%=cp %>/resources/images/dining/detail/rnl/${dto.imageIndex}_details_4.jpg"><br/>
                                            <img alt="product" src="<%=cp %>/resources/images/dining/detail/rnl/${dto.imageIndex}_details_5.jpg"><br/>
                                        </div>
                                    </div>
                                    
                                    <!-- 상품구매안내 -->
                                    <div class="tab-pane fade" id="nav-info" role="tabpanel" aria-labelledby="nav-info-tab">
                                        <div class="table-content table-responsive">
                                            <table class="table shop_attributes">
                                                <tbody>
                                                    <tr>
                                                     <td>
                                                     	<img alt="" src="<%=cp %>/resources/images/dining/detail/rnl/15_buydetails.jpg">
                                                     	<img alt="" src="<%=cp %>/resources/images/dining/detail/rnl/15_buydetails_2.jpg">
                                                     </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    
                                    <!-- 상품사용후기 -->
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
                    <!-- end -->
                    
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
                                <!-- 아래 slide start -->
                             <c:forEach items="${catelists }" var="dto">
                                <div class="item">
                                    <div class="ft-product">
                                        <div class="product-inner">
                                            <div class="product-image">
                                                <figure class="product-image--holder">
                                                    <img src="<%=cp %>/resources/images/dining/${dto.saveFileName}" alt="Product">
                                                </figure>
                                                <a href="dining_rnl_details.fu?imageIndex=${dto.imageIndex}&cateEn=${dto.cateEn}" class="product-overlay"></a>
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
                                                    <a href="wishlist.fu?cate=${dto.cate }&itemname=<%=str %>&price=${dto.price }&imagepath=/resources/images/dining/${dto.saveFileName}" class="action-btn">       
                                                    	<i class="la la-heart-o"></i>
                                                    </a>
                                                    <%}else{ %>
                                                    <a href="wishlist.fu?cate=${dto.cate }&itemname=${dto.productName }&price=${dto.price }&imagepath=/resources/images/dining/${dto.saveFileName}" class="action-btn">       
                                                        <i class="la la-heart-o"></i>
                                                    </a>
                                                    <%} %>
                                                    <!-- <a href="wishlist.jsp" class="action-btn">
                                                        <i class="la la-repeat"></i>
                                                    </a> -->
                                                </div>
                                            </div>
                                            <div class="product-info">
                                                <div class="product-category">
                                                    <a href="dining_rnl_details.fu?imageIndex=${dto.imageIndex}&cateEn=${dto.cateEn}">${dto.cate }</a>
                                                </div>
                                                <h3 class="product-title"><a href="dining_rnl_details.fu?imageIndex=${dto.imageIndex}&cateEn=${dto.cateEn}">${dto.productName }</a></h3>
                                                <div class="product-info-bottom">
                                                    <div class="product-price-wrapper">
                                                        <span class="money">${dto.price }원</span>
                                                    </div>
                                                    <a href="cart.fu" class="add-to-cart pr--15">
                                                        <i class="la la-plus"></i>
                                                        <span>Add To Cart</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                              	</c:forEach>
                              	<!-- end(아래 div6개남기고) -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Content Wrapper End -->

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>