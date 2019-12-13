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
                                  <%--   <div class="product-gallery__nav-image">
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
                                                <a href="dining_clean_details.fu?imageIndex=${dto.imageIndex }&cate=${dto.cate}">
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
                                	<c:if test="${dto.imageIndex>=26 && dto.imageIndex<=43 }">
                                    <span class="money">${dto.price }원</span>
                                    </c:if>
                                    <c:if test="${dto.imageIndex>=44 && dto.imageIndex<=45 }">
                                    <span class="money">일시품절</span>
                                    </c:if>
                                </div>
                                <form action="#" class="variation-form mb--20">
                                    <div class="product-size-variations d-flex align-items-center mb--15">
                                        <p class="variation-label">Option:</p>   
                                        <div class="product-size-variation variation-wrapper">
                                        	<c:if test="${dto.imageIndex>=26 && dto.imageIndex<=29}">
                                        	<select>
                                            	<option selected="selected">- [사이즈] 옵션을 선택해주세요 -</option>
                                            	<option disabled="disabled">-----------------------------------</option>
                                            	<option value="1400*800">1400*800</option>
                                            </select>
                                            <br/>
                                            <select>
                                            	<option selected="selected">- [색상] 옵션을 선택해주세요 -</option>
                                            	<option disabled="disabled">-----------------------------------</option>
                                            </select>
                                            </c:if>
                                            <c:if test="${dto.imageIndex==30}">
                                        	<select>
                                            	<option selected="selected">- [사이즈] 옵션을 선택해주세요 -</option>
                                            	<option disabled="disabled">-----------------------------------</option>
                                            </select>
                                            </c:if>
                                            <c:if test="${dto.imageIndex==31 }">
                                        	<select>
                                            	<option selected="selected">- [사이즈] 옵션을 선택해주세요 -</option>
                                            	<option disabled="disabled">-----------------------------------</option>
                                            	<option value="1500*500">1500*500</option>
                                            </select>
                                            </c:if>
                                            <c:if test="${dto.imageIndex>=32 && dto.imageIndex<=33}">
                                        	<select>
                                            	<option selected="selected">- [사이즈] 옵션을 선택해주세요 -</option>
                                            	<option disabled="disabled">-----------------------------------</option>
                                            	<option value="1400*800">1400*800</option>
                                            </select>
                                            <br/>
                                            <select>
                                            	<option selected="selected">- [색상] 옵션을 선택해주세요 -</option>
                                            	<option disabled="disabled">-----------------------------------</option>
                                            </select>
                                            </c:if>
                                            <c:if test="${dto.imageIndex==34 }">
                                        	<select>
                                            	<option selected="selected">- [사이즈] 옵션을 선택해주세요 -</option>
                                            	<option disabled="disabled">-----------------------------------</option>
                                            	<option value="OAK/1400*800">OAK/1400*800</option>
                                            </select>
                                            </c:if>
                                            <c:if test="${dto.imageIndex>=35 && dto.imageIndex<=37 }">
                                        	<select>
                                            	<option selected="selected">- [사이즈] 옵션을 선택해주세요 -</option>
                                            	<option disabled="disabled">-----------------------------------</option>
                                            	<option value="1500*500">1500*500</option>
                                            </select>
                                            </c:if>
                                            <c:if test="${dto.imageIndex==38 }">
                                        	<select>
                                            	<option selected="selected">- [수종] 옵션을 선택해주세요 -</option>
                                            	<option disabled="disabled">-----------------------------------</option>
                                            	<option value="Oak">Oak</option>
                                            	<option value="Walnut">Walnut</option>
                                            </select><br/>
                                            <select>
                                            	<option selected="selected">- [사이즈] 옵션을 선택해주세요 -</option>
                                            	<option disabled="disabled">-----------------------------------</option>
                                            </select><br/>
                                            <select>
                                            	<option selected="selected">- [색상] 옵션을 선택해주세요 -</option>
                                            	<option disabled="disabled">-----------------------------------</option>
                                            </select><br/>
                                            </c:if>
                                            <c:if test="${dto.imageIndex>=39 && dto.imageIndex<=41 }">
                                        	<select>
                                            	<option selected="selected">- [사이즈] 옵션을 선택해주세요 -</option>
                                            	<option disabled="disabled">-----------------------------------</option>
                                            	<option value="1400*800">1400*800</option>
                                            </select>
                                            </c:if>
                                            <c:if test="${dto.imageIndex>=42 && dto.imageIndex<=43 }">
                                        	<select>
                                            	<option selected="selected">- [사이즈] 옵션을 선택해주세요 -</option>
                                            	<option disabled="disabled">-----------------------------------</option>
                                            	<option value="1600*800">1600*800</option>
                                            </select>
                                            </c:if>
                                            <c:if test="${dto.imageIndex==44 }">
                                        	<select>
                                            	<option selected="selected">- [사이즈] 옵션을 선택해주세요 -</option>
                                            	<option disabled="disabled">-----------------------------------</option>
                                            	<option value="1500*500">1500*500</option>
                                            </select>
                                            </c:if>
                                            <c:if test="${dto.imageIndex==45 }">
                                        	<select>
                                            	<option selected="selected">- [색상] 옵션을 선택해주세요 -</option>
                                            	<option disabled="disabled">-----------------------------------</option>
                                            	<option value="월넛">월넛</option>
                                            </select>
                                            </c:if>
                                            <%-- <c:if test="${dto.productName eq 'WAVE 원형 테이블' }">
                                        	<select>
                                            	<option selected="selected">- [색상] 옵션을 선택해주세요 -</option>
                                            	<option disabled="disabled">-----------------------------------</option>
                                            	<option value="1400*800">화이트</option>
                                            </select>
                                            </c:if> --%>
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
                                    <!-- add cart버튼(+품절) -->
                                    <c:if test="${dto.imageIndex>=26 && dto.imageIndex<=43 }">
                                    <button type="button" class="btn btn-size-sm btn-shape-square" onclick="window.location.href='cart.jsp'">
                                        Add To Cart
                                    </button>
                                    </c:if>
                                    <c:if test="${dto.imageIndex>=44 && dto.imageIndex<=45 }">
                                    <button type="button" class="btn btn-size-sm btn-shape-square">
                                        Sold Out
                                    </button>
                                    </c:if>
                                    <!-- add cart end -->
                                </div>  
                               <!--  <div class="product-footer-meta">
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
                                            <img alt="" src="<%=cp %>/resources/images/dining/detail/table/${dto.imageIndex}_details_3.jpg"><br/>
                                            <img alt="" src="<%=cp %>/resources/images/dining/detail/table/${dto.imageIndex}_details_4.jpg"><br/>
                                            <img alt="" src="<%=cp %>/resources/images/dining/detail/table/${dto.imageIndex}_details_5.jpg"><br/>
                                            <img alt="" src="<%=cp %>/resources/images/dining/detail/table/${dto.imageIndex}_details_6.jpg"><br/>
                                            <img alt="" src="<%=cp %>/resources/images/dining/detail/table/${dto.imageIndex}_details_7.jpg"><br/>
                                            <img alt="" src="<%=cp %>/resources/images/dining/detail/table/${dto.imageIndex}_details_8.jpg"><br/>
                                            <img alt="" src="<%=cp %>/resources/images/dining/detail/table/${dto.imageIndex}_details_9.jpg"><br/>
                                            <img alt="" src="<%=cp %>/resources/images/dining/detail/table/${dto.imageIndex}_details_10.jpg"><br/>
                                            <img alt="" src="<%=cp %>/resources/images/dining/detail/table/${dto.imageIndex}_details_11.jpg"><br/>
                                            <img alt="" src="<%=cp %>/resources/images/dining/detail/table/${dto.imageIndex}_details_12.jpg"><br/>
                                            <img alt="" src="<%=cp %>/resources/images/dining/detail/table/${dto.imageIndex}_details_13.jpg"><br/>
                                            <img alt="" src="<%=cp %>/resources/images/dining/detail/table/${dto.imageIndex}_details_14.jpg"><br/>
                                            <img alt="" src="<%=cp %>/resources/images/dining/detail/table/${dto.imageIndex}_details_15.jpg"><br/>
                                            <img alt="" src="<%=cp %>/resources/images/dining/detail/table/${dto.imageIndex}_details_16.jpg"><br/>
                                            <img alt="" src="<%=cp %>/resources/images/dining/detail/table/${dto.imageIndex}_details_17.jpg"><br/>
                                        </div>
                                    </div>
                                    
                                    <!-- 상품구매안내 -->
                                    <div class="tab-pane fade" id="nav-info" role="tabpanel" aria-labelledby="nav-info-tab">
                                        <div class="table-content table-responsive">
                                            <table class="table shop_attributes">
                                                <tbody>
                                                    <tr>
                                                     <td>
                                                     	<img alt="" src="<%=cp %>/resources/images/dining/detail/table/26_buydetails.jpg"><br/>
                                                     	<img alt="" src="<%=cp %>/resources/images/dining/detail/table/26_buydetails_2.jpg">
                                                     </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    
                                    <!-- 상품사용후기 -->
                                    <div class="tab-pane fade" id="nav-reviews" role="tabpanel" aria-labelledby="nav-reviews-tab">
                                        <div class="product-reviews">
                                            <div class="review-form-wrapper">
                                                <div class="row">
                                                    <div class="col-lg-8">
                                                        <span class="reply-title">상품에 대한 후기를 남겨주세요</span>
                                                        <form action="reviewwrite.fu" class="form pr--30"  enctype="multipart/form-data" method="post">
                                                            <div class="form-notes mb--20">
                                                                <p> <span class="required"></span></p>
                                                            </div>
                                                            
                                                            <div class="form__group mb--20">
                                                                <label class="form__label d-block" for="subject">제목<span class="required">*</span></label>
                                                                <input type="text" name="subject" id="subject" class="form__input">
															</div>
                                                            <div class="form__group mb--10">
                                                                <label class="form__label d-block" for="review">상품후기<span class="required">*</span></label>
                                                                <textarea name="content" id="content" class="form__input form__input--textarea"></textarea>
                                                            </div>
                                                            <div class="form__group mb--20">
                                                                <label class="form__label d-block" for="name">이름<span class="required">*</span></label>
                                                                <input type="text" name="name" id="name" class="form__input" value="">
                                                            </div>
                                                            <div class="form__group mb--20">
                                                                <input type="hidden" name="photo" id="photo" value="<%=cp %>/resources/images/dining/${dto.saveFileName}">
                                                            </div>
                                                            <div class="form__group">
                                                                <div class="form-row">
                                                                    <div class="col-12">
                                                                        <input type="submit" value="글쓰기" class="btn btn-size-md">
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
                                                <a href="dining_table_details.fu?imageIndex=${dto.imageIndex}&cate=${dto.cate}" class="product-overlay"></a>
                                                <div class="product-action">
                                                    <a data-toggle="modal" data-target="#productModal" class="action-btn">
                                                        <i class="la la-eye"></i>
                                                    </a>
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
                                                    <a href="dining_table_details.fu?imageIndex=${dto.imageIndex}&cate=${dto.cate}">${dto.cate }</a>
                                                </div>
                                                <h3 class="product-title"><a href="dining_table_details.fu?imageIndex=${dto.imageIndex}&cate=${dto.cate}">${dto.productName }</a></h3>
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
                              	<!-- end(아래 div6개남기고) -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Content Wrapper End -->

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>