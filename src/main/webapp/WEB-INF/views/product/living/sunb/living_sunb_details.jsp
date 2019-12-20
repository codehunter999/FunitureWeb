<%@page import="com.funi.domain.FurnitureDTO"%>
<%@include file="/WEB-INF/views/header/fu_header2.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	
	var data; 
	
	function clickevent(eventdata){
			
			data = eventdata;
			
			//alert(eventdata);
			//alert($("[id = 'optionV']").val());
			
			if($("[id = 'optionV']").val()=="default"){
				alert("옵션을 선택하세요.");
				return;
			}else{
				data += ":"+$("[id = 'optionV']").val();
			}
			
			//data += ":"+$("[id = 'optionV']").val(); //주소 창에 session으로 옵션을 붙엿습니다 옵션 넘어갑니다 짱짱	
			data += ":1";
			data += ":" + ${dto.imageIndex};
			
			$('div#productModal').modal();	
			
			//alert(data);
	}	
	function cartsubmit(){
		location.href="<%=cp%>/cartlist_input.fu?data="+data;
	}
	
</script>

        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/images/bedroom/bedroomImage.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">${dto.productName }</h1>
                        <ul class="breadcrumb">
                            <li><a href="/furnitureweb/home.fu">Home</a></li>
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
                               	<!-- 선브렐라 -->
                                    <div class="product-size-variations d-flex align-items-center mb--15">
                                        <p class="variation-label">색상 옵션:</p> 
                                        <div class="product-size-variation variation-wrapper">
                                        	<select id="optionV">
                                            	<option selected="selected" value="default">- [필수] 옵션을 선택해주세요 -</option>
                                            	<option disabled="disabled">-----------------------------------</option>
                                            	<option value="캔버스">캔버스</option>
                                            	<option value="코코넛">코코넛</option>
                                            	<option value="징크">징크</option>
                                            </select>
                                        </div>                                 
                                    </div>
                                    <a href="" class="reset_variations">Clear</a>
                                </form>
                                <div class="product-action d-flex flex-sm-row align-items-sm-center flex-column align-items-start mb--30">
                                    <!-- <div class="quantity-wrapper d-flex align-items-center mr--30 mr-xs--0 mb-xs--30">
                                        <label class="quantity-label" for="qty">Quantity:</label>
                                        <div class="quantity">
                                            <input type="number" class="quantity-input" name="qty" id="qty" value="1" min="1">
                                        </div>
                                    </div> -->
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
  											<c:if test="${dto.imageIndex == 201 || dto.imageIndex == 202 }">
  												<img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail1.jpg">	
	                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail2.jpg">	
	                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail3.jpg">	
	                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail4.jpg">	
	                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail5.jpg">	
  											</c:if>	                                      
                                           	<c:if test="${dto.imageIndex == 203}">
                                        		<embed style="width: 900px; height: 550px;" src="https://www.youtube.com/embed/czyP_vZyhHw"> 
	                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail1.jpg">	
	                                            <img alt="" src="<%=cp%>/resources/images/livingroom/${dto.imageIndex}_detail2.jpg">	
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
                                                            <a href="wishlist.fu?cate=${dto.cate }&itemname=<%=str %>&price=${dto.price }&imagepath=/resources/images/livingroom/${dto.saveFileName}" class="action-btn">       
                                                                <i class="la la-heart-o"></i>
                                                            </a>
                                                            <%}else{ %>
                                                            <a href="wishlist.fu?cate=${dto.cate }&itemname=${dto.productName }&price=${dto.price }&imagepath=/resources/images/livingroom/${dto.saveFileName}" class="action-btn">       
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
                                                    <a href="living_${dto.cateEn }_details.fu?imageIndex=${dto.imageIndex }&cateEn=${dto.cateEn }">${dto.cate }</a>
                                                </div>
                                                <h3 class="product-title"><a href="living_${dto.cateEn }_details.fu?imageIndex=${dto.imageIndex }&cateEn=${dto.cateEn }">${dto.productName }</a></h3>
                                                <div class="product-info-bottom">
                                                    <div class="product-price-wrapper">
                                                        <span class="money">${dto.price }원</span>
                                                    </div>
                                                    <%-- <a href="<%=cp%>/cart.fu" class="add-to-cart pr--15">
                                                        <i class="la la-plus"></i>
                                                        <span>Add To Cart</span>
						                      
                                                    </a> --%>
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
              <!-- Qicuk View Modal Start -->
        <div class="modal fade product-modal" id="productModal" tabindex="-1" role="dialog" aria-hidden="true">
        	<div class="modal-dialog" role="document" style="width: 300">
        		<div class="modal-content">
        			<div class="modal-body" align="center"><br><br><br>
    					카트에 담으시겠습니까?<br>
    					<button class="btn btn-size-sm" onclick="cartsubmit()">예</button>
    					<button class="btn btn-size-sm"  data-dismiss="modal">아니오</button>
    					<br><br><br>
    				</div>
    			</div>
    		</div>
    	</div>
        <!-- Qicuk View Modal End -->

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>