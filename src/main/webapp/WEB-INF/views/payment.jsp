<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	 <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/assets/img/product/shop1.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">Payment</h1>
                        <ul class="breadcrumb">
                            <li><a href="index.html">Home</a></li>
                            <li class="current"><span>Payment</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb area End -->

        <!-- Main Content Wrapper Start -->
        <div class="main-content-wrapper">
            <div class="page-content-inner pt--80 pt-md--60 pb--72 pb-md--60">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <!-- User Action Start 
                            <div class="user-actions user-actions__coupon">
                                <div class="message-box mb--30">
                                    <p><i class="la la-exclamation-circle"></i> Have A Coupon? <a class="expand-btn" href="#coupon_info"> Click Here To Enter Your Code.</a></p>
                                </div>
                                <div id="coupon_info" class="user-actions__form hide-in-default">
                                    <form action="#" class="form">
                                        <p>If you have a coupon code, please apply it below.</p>
                                        <div class="form__group d-sm-flex">
                                            <input type="text" name="coupon" id="coupon" class="form__input mr--20 mr-xs--0" placeholder="Coupon Code">
                                            <button type="submit" class="btn btn-size-sm">Apply Coupon</button>
                                        </div>
                                    </form>
                                </div>
                            </div>-->
                            <!-- User Action End -->
                        </div>
                    </div> 
                    <div class="row">
                        <!-- Checkout Area Start -->  
                        <div class="col-lg-6">
                            <div class="checkout-title mt--10">
                                <h2>주문자 정보</h2>
                            </div>
                            <div class="checkout-form">
                                <form action="#" class="form form--checkout">
                                    <div class="form-row mb--20">
                                        <div class="form__group col-md-6 mb-sm--30">
                                            <label for="billing_fname" class="form__label">주문하시는 분  <span class="required">*</span></label>
                                            <input type="text" value="${memberdto.name }" name="billing_fname" id="billing_fname" class="form__input" placeholder="">              
                                        </div>
                                    </div>
                                    <div class="form-row mb--20">
                                        <div class="form__group col-12">
                                            <label for="billing_streetAddress" class="form__label">주소 <span class="required">*</span></label>

                                            <input type="text" value="${memberdto.addr1 }" name="billing_streetAddress" id="billing_streetAddress" class="form__input mb--30" placeholder="">

                                            <input type="text" value="${memberdto.addr2 }${memberdto.addr3 }" name="billing_apartment" id="billing_apartment" class="form__input" placeholder="">
                                        </div>
                                    </div>
                            
                                    <div class="form-row mb--20">
                                        <div class="form__group col-12">
                                            <label for="billing_company" class="form__label">전화번호 <span class="required">*</span></label>
                                            <input type="text" value="010${memberdto.phone }"  name="billing_company" id="billing_company" class="form__input">
                                        </div>
                                    </div>
                                    <div class="form-row mb--20">
                                        <div class="form__group col-12">
                                            <label for="billing_company" class="form__label">이메일 <span class="required">*</span></label>
                                            <input type="text" value="${memberdto.email }"  name="billing_company" id="billing_company" class="form__input">
                                        </div>
                                        <div class="payment-info" data-method="bank">
                                            <p>이메일을 통해 주문처리과정을 보내드립니다.<br/>
											이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.</p>
                                        </div>
                                    </div>                               
                                   
                                    <div class="form-row">
                                        <div class="form__group col-12">
                                            <div class="custom-checkbox mb--20">
                                                <input type="checkbox" name="shipdifferetads" id="shipdifferetads" class="form__checkbox">
                                                
                                                <label for="shipdifferetads" class="form__label shipping-label">새로운 배송지</label>
                                            </div>
                                            <div class="ship-box-info hide-in-default mt--30">
                                                <div class="form-row mb--20">
                                        <div class="form__group col-md-6 mb-sm--30">
                                            <label for="billing_fname" class="form__label">주문하시는 분  <span class="required">*</span></label>
                                            <input type="text" name="billing_fname" id="billing_fname" class="form__input" placeholder="이름">              
                                        </div>
                                    </div>
                                                 <div class="form-row mb--20">
                                        <div class="form__group col-12">
                                            <label for="billing_streetAddress" class="form__label">주소 <span class="required">*</span></label>

                                            <input type="text" value="" name="billing_streetAddress" id="billing_streetAddress" class="form__input mb--30" placeholder="주소">

                                            <input type="text" value="" name="billing_apartment" id="billing_apartment" class="form__input" placeholder="상세주소">
                                        </div>
                                    </div>
                            
                                    <div class="form-row mb--20">
                                        <div class="form__group col-12">
                                            <label for="billing_company" class="form__label">전화번호 <span class="required">*</span></label>
                                            <input type="text" name="billing_company" id="billing_company" class="form__input">
                                        </div>
                                    </div>
                                    <div class="form-row mb--20">
                                        <div class="form__group col-12">
                                            <label for="billing_company" class="form__label">이메일 <span class="required">*</span></label>
                                            <input type="text" name="billing_company" id="billing_company" class="form__input">
                                        </div>
                                        <div class="payment-info" data-method="bank">
                                            <p>이메일을 통해 주문처리과정을 보내드립니다.<br/>
											이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.</p>
                                        </div>
                                    </div>            
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="form-row">
                                        <div class="form__group col-12">
                                            <label for="orderNotes" class="form__label">배송 메세지</label>
                                            <textarea class="form__input form__input--textarea" id="orderNotes" name="orderNotes" placeholder=""></textarea>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-xl-5 offset-xl-1 col-lg-6 mt-md--40">
                            <div class="order-details">
                                <div class="checkout-title mt--10">
                                    <h2>주문정보</h2>
                                </div>
                                <div class="table-content table-responsive mb--30">
                                    <table class="table order-table order-table-2">
                                       <tr>
                                            <th><font size="3pt;"><strong>상품정보</strong></font></th>
                                            <th class="text-right"><font size="3pt;"><strong>판매가</strong></font></th>
                                        </tr>
                                        <tr>
                                            <c:if test="${cartlist != null}">
											<c:forEach var="row" items="${map.list}" varStatus="i">
                                            
                                                <th>${row.productName}
                                                    <strong><span>&#10005;</span>${row.amount}</strong>
                                                </th>
                                                <td class="text-right">
                                                <fmt:formatNumber value="${row.money }" pattern="###,###,###"/>
                                                원</td>
                                            
                                            </c:forEach>
											</c:if>
											<c:if test="${cartlist == null}">
												<td>주문한 상품이 없습니다.</td>
											</c:if>
                                        </tr>    
                                            <%
				                                
											 	List<String> cartlist=(List<String>)request.getAttribute("cartlist");
                                            	String qty_TotalItem = (String)request.getAttribute("qty_TotalItem");
	                                        	if(cartlist!=null){
	                                        		Iterator iterator=cartlist.iterator();
	                                        		int buttonIndex = 0; 
	                                        		int i=0;
	                                        		while(iterator.hasNext()){
	                                        			String result=(String)iterator.next();
	                                        			String[] value=result.split(":");
	                                        			value[2]  = value[2].replaceAll(",","");
	                                        			
	                               			%>
                                            <!-- 예제 삭제하기 -->
                                            <tr>
                                                <th><%=value[0] %><%=value[1] %>
                                                    <strong><span>&#10005;</span>1</strong>
                                                </th>
                                                <td class="text-right"><%=value[2] %>원</td>
                                            </tr>
                                            <!-- 예제 삭제하기 -->   
                                            	<%}       	
                                   			}%> 
                                                                                    
                                        <tfoot>
                                            <tr class="cart-subtotal">
                                                <th>총 상품 금액</th>
                                                <td class="text-right">
                                                <fmt:formatNumber value="${map.sumMoney }" pattern="###,###,###"/>
                                                원</td>
                                            </tr>
                                            <tr class="shipping">
                                                <th>배송비</th>
                                                <td class="text-right">
                                                    <span>[무료]</span>
                                                </td>
                                            </tr>
                                            <tr class="order-total">
                                                <th>총 결제 예정 금액</th>
                                                <td class="text-right"><span class="order-total-ammount">
                                                <fmt:formatNumber value="${map.sumMoney }" pattern="###,###,###"/>원
                                                </span></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                
                                <div class="checkout-payment">
                                    <form action="#" class="payment-form">
                                        <div class="payment-group mb--10">
                                            <div class="payment-radio">
                                                <input type="radio" value="bank" name="payment-method" id="bank" checked>
                                                <label class="payment-label" for="bank">카드결제</label>
                                            </div>
                                            <div class="payment-info" data-method="bank">
												<select name="cardType">
													<option value="국민카드" >카드를 선택하세요</option>
													<option value="KB카드">KB카드</option>
													<option value="BC카드">BC카드</option>
													<option value="삼성카드">삼성카드</option>
													<option value="신한카드">신한카드</option>
													<option value="외환카드">외환카드</option>
													<option value="하나카드">하나카드</option>
													<option value="롯데카드">롯데카드</option>
													<option value="씨티(한미)카드">씨티(한미)카드</option>
													<option value="광주카드">광주카드</option>
													<option value="현대카드">현대카드</option>
													<option value="전북카드">전북카드</option>
													<option value="NH카드">NH카드</option>
													<option value="수협카드">수협카드</option>
													<option value="제주카드">제주카드</option>
													<option value="신협체크카드">신협체크카드</option>
													<option value="우리(평화)카드">우리(평화)카드</option>
													<option value="카카오페이">카카오페이</option>			
												</select>
                                                <p>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</p>
                                                <p>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</p>
                                            </div>
                                        </div>
                                        <div class="payment-group mb--10">
                                            <div class="payment-radio">
                                                <input type="radio" value="cheque" name="payment-method" id="cheque">
                                                <label class="payment-label" for="cheque">
                                                    실시간 계좌이체
                                                </label>
                                            </div>
                                            <div class="payment-info cheque hide-in-default" data-method="cheque">
                                                <p>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</p>
                                            </div>
                                        </div>
                                        <div class="payment-group mb--10">
                                            <div class="payment-radio">
                                                <input type="radio" value="cash" name="payment-method" id="cash">
                                                <label class="payment-label" for="cash">
                                                    무통장입금
                                                </label>
                                            </div>
                                            <div class="payment-info cash hide-in-default" data-method="cash">
                                                <p>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</p>
                                            </div>
                                        </div>
                                        <div class="payment-group mt--20">
                                            <p class="mb--15">	</p>
                                            <button type="submit" class="btn btn-size-md btn-fullwidth"><strong> 결제하기</strong></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Checkout Area End -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Content Wrapper Start -->

        <!-- Footer Start-->
        <footer class="footer bg-color" data-bg-color="#f4f8fa">
            <div class="footer-top">
                <div class="container-fluid">
                    <div class="row border-bottom pt--70 pb--70">
                        <div class="col-lg-3 col-sm-6 offset-md-1 offset-lg-0 mb-md--45">
                            <div class="footer-widget">
                                <div class="textwidget">
                                    <figure class="footer-logo mb--30">
                                        <img src="<%=cp %>/resources/assets/img/logo/logo.png" alt="Logo">
                                    </figure>
                                    <p>On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms. </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-3 offset-lg-1 offset-sm-2 mb-md--45">
                            <div class="footer-widget">
                                <h3 class="widget-title mb--35 mb-sm--20">Company</h3>
                                <div class="footer-widget">
                                    <ul class="footer-menu">
                                        <li><a href="index.html">About Us</a></li>
                                        <li><a href="blog.html">Blogs</a></li>
                                        <li><a href="#">Careers</a></li>
                                        <li><a href="contact-us.html">Contact</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-4 offset-md-1 offset-lg-0 mb-xs--45">
                            <div class="footer-widget">
                                <h3 class="widget-title mb--35 mb-sm--20">Product</h3>
                                <div class="footer-widget">
                                    <ul class="footer-menu">
                                        <li><a href="#">Pricing</a></li>
                                        <li><a href="#">Features</a></li>
                                        <li><a href="#">Customers</a></li>
                                        <li><a href="#">Demos</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-4 mb-xs--45">
                            <div class="footer-widget">
                                <h3 class="widget-title mb--35 mb-sm--20">Helps</h3>
                                <div class="footer-widget">
                                    <ul class="footer-menu">
                                        <li><a href="#">Introduction</a></li>
                                        <li><a href="#">Feedback</a></li>
                                        <li><a href="#">Referals</a></li>
                                        <li><a href="#">Network Status</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-3 col-sm-4">
                            <div class="footer-widget">
                                <h3 class="widget-title mb--35 mb-sm--20">Social Network</h3>
                                <div class="footer-widget">
                                    <ul class="footer-menu">
                                        <li><a href="#">Facebook</a></li>
                                        <li><a href="#">Twitter</a></li>
                                        <li><a href="#">Linkedin</a></li>
                                        <li><a href="#">Google +</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-middle ptb--40">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-11">
                            <div class="footer-widget">
                                <div class="taglist">
                                    <span>Tags:</span>
                                    <a href="#">Minimal eCommerce</a>
                                    <a href="#">Marketing</a>
                                    <a href="#">User Exprience</a>
                                    <a href="#">Ali Express</a>
                                    <a href="#">Web</a>
                                    <a href="#">Digital Expo</a>
                                    <a href="#">Web Search</a>
                                    <a href="#">Affiliate</a>
                                    <a href="#">UCWeb</a>
                                    <a href="#">Support</a>
                                    <a href="#">Template</a>
                                    <a href="#">Best Queality</a>
                                    <a href="#">Mobile</a>
                                    <a href="#">24 Support</a>
                                    <a href="#">Ali Express</a>
                                    <a href="#">Web</a>
                                    <a href="#">Laptop</a>
                                    <a href="#">Web Search</a>
                                    <a href="#">Affiliate</a>
                                    <a href="#">Photoshop</a>
                                    <a href="#">Support</a>
                                    <a href="#">Template</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="container-fluid">
                    <div class="row border-top ptb--20">
                        <div class="col-12 text-center">
                            <p class="copyright-text">Beck &copy; 2019 all rights reserved</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
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