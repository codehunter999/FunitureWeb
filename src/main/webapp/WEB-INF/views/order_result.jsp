<%@page import="com.funi.domain.PaymentDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@include file="/WEB-INF/views/header/fu_header2.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/assets/img/payment/completion1.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">completion</h1>
                        <ul class="breadcrumb">
                            <li><a href="home.fu">Home</a></li>
                            <li class="current"><span>completion</span></li>
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
                               <table class="table table-style-2 wishlist-table text-center">              
                                	<tr>
                                		<td><img src="<%=cp %>/resources/assets/img/payment/order1.png">
                                		<img src="<%=cp %>/resources/assets/img/payment/order2.png"></td>
                                	</tr>
                               	</table>
                               	<table>
                               		<tr>
                               			<td><font>&nbsp;&nbsp;&nbsp;결제정보</font></td>
                               		</tr>
                               	</table>
                                <table class="table table-style-2 wishlist-table text-center">
                                <tr height="20"></tr>
                                	<thead>
                                        <tr class="order-total">
                                            <th >최종결제금액</th>
                                            <th class="text-left" style="background-color: white">
                                            <font size="4">
                                            <fmt:formatNumber value="${paySumAndpayType.paysum}" pattern="###,###,###"/>
                                            </font>원</th>
                                            <th class="text-left"style="background-color: white"></th> 
                                            <th style="background-color: white"></th>
                                            <th style="background-color: white"></th>                                            
                                            <th style="background-color: white"></th>
                                        </tr>
                                        <tr height="30">
                                            <th>결제수단</th>
                                            <th class="text-left" style="background-color: white">${paySumAndpayType.paytype }</th>
                                            <th class="text-left"style="background-color: white"></th> 
                                            <th style="background-color: white"></th>
                                            <th style="background-color: white"></th>                                            
                                            <th style="background-color: white"></th>
                                        </tr>
                                    </thead>
                                    <tr height="20"></tr>
                                    <tr height="20"></tr>
                             </table>     
                             <table>
                               		<tr>
                               			<td><font>&nbsp;&nbsp;&nbsp;주문상품정보</font></td>
                               		</tr>
                               	</table>  
                             <table class="table table-style-2 wishlist-table text-center">
                                	<thead>    
                                    <thead>
                                        <tr>
                                            <th class="text-right"></th>
                                            <th class="">상품정보</th> 
                                            <th class="text-left">&nbsp;</th>
                                            <th>판매가</th>
                                            <th>수량</th>                                            
                                            <th>합계</th>
                                        </tr>
                                    </thead>
                                        <%
                                         		List<PaymentDTO> paylist = (List<PaymentDTO>)request.getAttribute("paylist");
	                                   			for(int i=0;i<paylist.size();i++) {
	                                   				PaymentDTO dto = paylist.get(i);
                                   		 %>
                                   			 <tr>
                                            <td class="product-thumbnail text-left">
                                                <img src="<%=cp %><%=dto.getImagePath() %>" alt="Product Thumnail">
                                            </td>
                                            <td class="product-name text-left wide-column">
                                                <h3>
                                                    <%=dto.getProductInfo() %>
                                                </h3>
                                            </td>
                                            <td ></td>
                                            <td class="product-price">
                                                <span class="product-price-wrapper">
                                                    <span class="money">
                                                    <fmt:formatNumber value="<%=dto.getProductPrice()/dto.getProductEa() %>" pattern="###,###,###"/>
				                                    원</span>
                                                </span>
                                            </td>
                                            <td class="product-stock">
												<%=dto.getProductEa() %>
                                            </td>
                                            <td class="product-stock">
                                                <span class="product-price-wrapper">
                                                    <span class="money">
                                                    <fmt:formatNumber value="<%=dto.getProductPrice() %>" pattern="###,###,###"/>
                                                    원</span>
                                                </span>
                                            </td>
                                        </tr>                                                          			 
                                   		 <%
                                   			 }
                                   		 %>
                                     </tbody>
                                </table><hr/><br/><br/><br/>
                                <table style="align-self: center;">
                                	<tr align="center">
                                		<td style="padding-left: 170%;">
                                			<a href="home.fu"><input type="submit" value="홈" class="btn btn-bg-white btn-hover-2"/></a>
                                		</td>
                                		<td style="padding-left: 190%;">
                                			<a href="mypage.fu"><input type="submit" value="구매내역" class="btn btn-bg-white btn-hover-2"/></a>
                                		</td>
                                	</tr>
                                </table>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Content Wrapper Start -->

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>
