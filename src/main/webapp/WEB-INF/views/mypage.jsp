<%@page import="com.funi.domain.PaymentDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/assets/img/payment/completion.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">마이페이지</h1>
                        <ul class="breadcrumb">
                            <li><a href="home.fu">Home</a></li>
                            <li class="current"><span>마이페이지</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section> 
        <!-- Breadcrumb area End -->

        <!-- Main Content Wrapper Start -->
        <div class="main-content-wrapper">
            <div class="page-content-inner ptb--80 ptb-md--60">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="table-content table-responsive">
                            <div class="tab-style-2">
                                <div class="nav nav-tabs mb--35 mb-sm--25" id="product-tab" role="tablist">
                                    <a class="nav-link active" id="nav-description-tab" data-toggle="tab" href="#nav-description" role="tab" aria-selected="true"> 
                                        <span>결제내역</span>
                                    </a>
                                    <a class="nav-link" id="nav-info-tab" data-toggle="tab" href="#nav-info" role="tab" aria-selected="true">
                                        <span>내정보수정</span>
                                    </a>
                                    <a class="nav-link" id="nav-reviews-tab" data-toggle="tab" href="#nav-reviews" role="tab" aria-selected="true">
                                        <span>상품사용후기</span>
                                    </a>
                                </div>
                                <div class="tab-content" id="product-tabContent">
                                    <div class="tab-pane fade show active" id="nav-description" role="tabpanel" aria-labelledby="nav-description-tab">
                                        <div class="product-description">     
  
                             <table class="table table-style-2 wishlist-table text-center">
                                    <thead>
                                        <tr>
                                            <th>구매날짜</th>
                                            <th>상품명</th> 
                                            <th>결제수단</th>
                                            <th>상품금액</th>
                                            <th>상품수량</th>
                                            <th>결제금액</th>                                            
                                           
                                        </tr>
                                    </thead>
                                    
                                    <%
                                    	                                    		
                                    	List<PaymentDTO> paylist = (List<PaymentDTO>)request.getAttribute("paylist");
                                   		
                                    	if(!paylist.equals("") || paylist != null){
                                    		
                                    		Iterator<PaymentDTO> it = paylist.iterator();
                                   			PaymentDTO paydto = null;
	                                   		while(it.hasNext()){
	                                   			paydto = it.next();
	                                 %>  			
	                                    
                                        <tr >
                                            <th class=""><%=paydto.getPaydate() %></th>
                                            <th class="">
                                            <img src="<%=cp%><%=paydto.getImagePath()%>" style="width: 10%;height: 10%">
                                            <%=paydto.getProductInfo() %></th> 
                                            <th class=""><%=paydto.getPaytype() %></th>
                                            <td class="product-price">
                                                <span class="product-price-wrapper">
                                                	<span><font color="#368AFF"><%=paydto.getProductPrice()/paydto.getProductEa() %>원</font></span>
                                                </span>
                                            </td>
                                            <th class=""><%=paydto.getProductEa() %></th>
                                            <td class="product-price">
                                                <span class="product-price-wrapper">
                                                	<span><font color="#368AFF"><%=paydto.getProductPrice() %>원</font></span>
                                                </span>
                                            </td>                                            
                                   	<%
									  		}
	                                   	}
                                   	%>
                                   			 
                                     </tbody>
                                </table>
                                           	
                               </div>
                                    </div>
                                    <div class="tab-pane fade" id="nav-info" role="tabpanel" aria-labelledby="nav-info-tab">
                                        <div class="table-content table-responsive">
                                        
                                       <!-- 회원정보수정 탭 -->  
                                           	                                      
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="nav-reviews" role="tabpanel" aria-labelledby="nav-reviews-tab">
                                        <div class="product-reviews">
                                        
                                        <!-- 상품후기 탭 -->
                                        
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
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Content Wrapper Start -->

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>
