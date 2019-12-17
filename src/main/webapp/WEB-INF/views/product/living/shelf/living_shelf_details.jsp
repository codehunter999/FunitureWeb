<%@page import="com.funi.domain.FurnitureDTO"%>
<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	
	var data; 
	
	function clickevent(eventdata){
			data = eventdata;
			data += ":"+$("[id = 'optionV']").val(); //주소 창에 session으로 옵션을 붙엿습니다 옵션 넘어갑니다 짱짱	
			data += ":" + $("[id = 'qty']").val();
			$('div.modal').modal();	
			alert(data);
	}
	function cartsubmit(){
		location.href="<%=cp%>/cartlist_input.fu?data="+data;
	}
	
</script>
        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/images/livingroom/livingroomImage.jpg">
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
                                	<!-- 선반 -->
                                	<c:if test="${dto.imageIndex == 271 }">
	                                    <div class="product-size-variations d-flex align-items-center mb--15">
	                                        <p class="variation-label">프레임 선택:</p> 
	                                        <div class="product-size-variation variation-wrapper">
	                                        	<select id="optionV">
	                                            	<option selected="selected">- [필수] 옵션을 선택해주세요 -</option>
	                                            	<option disabled="disabled">-----------------------------------</option>
	                                            	<option value="철제 프레임 black">철제 프레임 black</option>
	                                            </select>
	                                        </div>                                 
	                                    </div>
                                    </c:if>
                                    <c:if test="${dto.imageIndex == 272}">
                                    	<div class="product-size-variations d-flex align-items-center mb--15">
	                                        <p class="variation-label">옵션:</p> 
	                                        <div class="product-size-variation variation-wrapper">
	                                        	<select id="optionV">
	                                            	<option selected="selected">- [필수] 옵션을 선택해주세요 -</option>
	                                            	<option disabled="disabled">수종 및 사이즈 선택</option>
	                                            	<option disabled="disabled">-----------------------------------</option>
	                                            	<option value="오크 / W 860">오크 / W 860</option>
	                                            	<option value="오크 / W 1000">오크 / W 1000</option>
	                                            	<option value="월넛 / W 860">월넛 / W 860</option>
	                                            	<option value="월넛 / W 1000">월넛 / W 1000</option>
	                                            </select>
	                                        </div>                                 
	                                    </div>
                                    </c:if>
                                    <!-- 104 -->
                                    <c:if test="${dto.imageIndex == 273 }">
                                    	<div class="product-size-variations d-flex align-items-center mb--15">
	                                        <p class="variation-label">색상:</p> 
	                                        <div class="product-size-variation variation-wrapper">
	                                        	<select id="optionV">
	                                            	<option selected="selected">- [필수] 색상을 선택해주세요 -</option>
	                                            	<option disabled="disabled">-----------------------------------</option>
	                                            	<option value="민트">민트</option>
	                                            	<option value="화이트">화이트</option>
	                                            </select>
	                                        </div>                                 
	                                    </div>
                                    </c:if>
                                    <a href="" class="reset_variations">Clear</a>
                                </form>
                                <div class="product-action d-flex flex-sm-row align-items-sm-center flex-column align-items-start mb--30">
                                    <div class="quantity-wrapper d-flex align-items-center mr--30 mr-xs--0 mb-xs--30">
                                        <label class="quantity-label" for="qty">Quantity:</label>
                                        <div class="quantity">
                                            <input type="number" class="quantity-input" name="qty" id="qty" value="1" min="1">
                                        </div>
                                    </div>
                                    <%  
                                   				 FurnitureDTO dto1=(FurnitureDTO)request.getAttribute("dto");
	                                             if(dto1.getProductName().contains("[")){       
	                                            	 dto1.setProductName(dto1.getProductName().replace("[", "%5B"));
	                                            	 dto1.setProductName(dto1.getProductName().replace("]", "%5D"));
	                                             } 
	                                             dto1.setPrice(dto1.getPrice().trim());
                                     %>
                                    <button type="button" class="btn btn-size-sm btn-shape-square" onclick="clickevent('${dto.cateEn}:<%=dto1.getProductName() %>:<%=dto1.getPrice()%>:/resources/images/livingroom/${dto.imageIndex}.jpg');">
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
  											<c:if test="${dto.imageIndex == 271 || dto.imageIndex == 272 || dto.imageIndex == 273 }">
                                        		<embed style="width: 900px; height: 550px;" src="https://www.youtube.com/embed/HIhyC4GdbqY"> 
  												<img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail1.jpg">	
	                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail2.jpg">	
	                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail3.jpg">	
	                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail4.jpg">	
	                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail5.jpg">	
	                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail6.jpg">	
	                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail7.jpg">	
	                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail8.jpg">	
	                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail9.jpg">
  											</c:if>	                                      
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="nav-info" role="tabpanel" aria-labelledby="nav-info-tab">
                                        <div class="table-content table-responsive">
                                            <img alt="" src="<%=cp %>/resources/images/livingroom/${dto.imageIndex }_goo1.jpg">
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
                                                    <%
                                                            FurnitureDTO dto=(FurnitureDTO)pageContext.getAttribute("dto");
                                                            
                                                            if(dto.getProductName().contains("[")){
                                                    	        String str=dto.getProductName();
                                                    	        str=str.replace("[", "%5B");
                                                    	        str=str.replace("]", "%5D");
                                                    	%>
                                                   		 <a href="wishlist.fu?cate=${dto.cate }&itemname=<%=str %>&price=${dto.price }&imagepath=/resources/images/livingroom/${dto.imageIndex}.jpg" class="action-btn">       
                                                            <i class="la la-heart-o"></i>
                                                        </a>
                                                            <%}else{ %>
                                                                <a href="wishlist.fu?cate=${dto.cate }&itemname=${dto.productName }&price=${dto.price }&imagepath=/resources/images/livingroom/${dto.imageIndex}.jpg" class="action-btn">       
                                                                    <i class="la la-heart-o"></i>
                                                                </a>
                                                            <%} %>
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