<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/assets/img/bg/page_title_bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">Wishlist</h1>
                        <ul class="breadcrumb">
                            <li><a href="home.fu">Home</a></li>
                            <li class="current"><span>Wishlist</span></li>
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
                                    <thead>
                                        <tr>
                                            <th>&nbsp;</th>
                                            <th>&nbsp;</th>
                                            <th class="text-left">Product</th>
                                            <th> </th>
                                            <th>Price</th>
                                            <th>&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- <tr>
                                            <td class="product-remove text-left"><a href=""><i class="la la-remove"></i></a></td>
                                            <td class="product-thumbnail text-left">
                                                <img src="<%=cp %>/resources/assets/img/products/prod-01-70x88.jpg" alt="Product Thumnail">
                                            </td>
                                            <td class="product-name text-left wide-column">
                                                <h3>
                                                    <a href="product-details.html">Pinstripe slim-fit suit blazer</a>
                                                </h3>
                                            </td>
                                            <td class="product-stock">
                                                In Stock
                                            </td>
                                            <td class="product-price">
                                                <span class="product-price-wrapper">
                                                    <span class="money">$49.00</span>
                                                </span>
                                            </td>
                                            <td class="product-action-btn">
                                                <a href="cart.html" class="btn btn-size-md">Add to cart</a>
                                            </td>
                                        </tr> -->
                                        <%
                                        Map<String, String> wishitem;
                                        wishitem=(HashMap<String, String>)request.getAttribute("wishitem");
                                        if(wishitem!=null){
                                        for(String key:wishitem.keySet()){
                                        	int cut=key.indexOf(",");
                                        	String name=key.substring(0, cut);
                                        	String set=key.substring(cut+1, key.length());
                                        	String value=wishitem.get(key);
                                        	int cut1=value.indexOf(",");
                                        	String price=value.substring(0,cut1);
                                        	String img=value.substring(cut1+1,value.length());
                                        %>
                                        <tr>
                                            <td class="product-remove text-left"><a href="deletewishlist.fu?id=<%=key%>"><i class="la la-remove"></i></a></td>
                                            <td class="product-thumbnail text-left">
                                                <%-- <img src="<%=cp %>/resources/assets/img/products/prod-01-70x88.jpg" alt="Product Thumnail"> --%>
                                                <img src="<%=cp %><%=img %>" alt="Product Thumnail">
                                            </td>
                                            <td class="product-name text-left wide-column">
                                                <h3>
                                                    <a href="product-details.html"><%=name %> <%=set %></a>
                                                </h3>
                                            </td>
                                            <td class="product-stock">
                                                
                                            </td>
                                            <td class="product-price">
                                                <span class="product-price-wrapper">
                                                    <span class="money"><%=price %>원</span>
                                                </span>
                                            </td>
                                            <td class="product-action-btn">
                                                <a href="cart.html" class="btn btn-size-md">Add to cart</a>
                                            </td>
                                        </tr>
                                        <%}
                                        }%>
                                    </tbody>
                                </table>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Content Wrapper Start -->

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>