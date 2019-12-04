<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/assets/img/reviewimg/backgroundimage.jpg">
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
                                        <%
                                        	//Use List
                                        	List<String> wishitem=(List<String>)request.getAttribute("wishitem");
                                        	
                                        	if(wishitem!=null){
                                        		Iterator iterator=wishitem.iterator();
                                        		int i=0;
                                        		
                                        		while(iterator.hasNext()){
                                        			String result=(String)iterator.next();
                                        			String[] value=result.split(":");
                                        %>
                                        <tr>
                                            <td class="product-remove text-left"><a href="deletewishlist.fu?id=<%=i%>"><i class="la la-remove"></i></a></td>
                                            <td class="product-thumbnail text-left">
                                                <%-- <img src="<%=cp %>/resources/assets/img/products/prod-01-70x88.jpg" alt="Product Thumnail"> --%>
                                                <img src="<%=cp %><%=value[3] %>" alt="Product Thumnail">
                                            </td>
                                            <td class="product-name text-left wide-column">
                                                <h3>
                                                    <%=value[0] %>
                                                    <br><%=value[1] %></a>
                                                </h3>
                                            </td>
                                            <td class="product-stock">
                                                
                                            </td>
                                            <td class="product-price">
                                                <span class="product-price-wrapper">
                                                    <span class="money"><%=value[2] %>원</span>
                                                </span>
                                            </td>
                                            <td class="product-action-btn">
                                                <div name="addcart" class="btn btn-size-md" onclick="clickevent('<%=value[0] %>,<%=value[1] %>,<%=value[2] %>,<%=value[3] %>')">Add to cart</div>
                                               
                                            </td>
                                        </tr>
                                        <%
	                            					i++;
	                                        	}
	                                        }
                                        %>
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
