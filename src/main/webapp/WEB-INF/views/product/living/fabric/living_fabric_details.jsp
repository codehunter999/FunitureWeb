<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                                                                <input type="hidden" name="photo" id="photo" value="<%=cp %>/resources/images/livingroom/${dto.imageIndex}.jpg">
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
                                            	<%-- ${dto.imageIndex } --%>
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

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>