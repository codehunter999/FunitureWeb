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
                                		<td><img src="<%=cp %>/resources/assets/img/payment/order1.png"></td>
                                	</tr>
                                	<tr>
										<td><img src="<%=cp %>/resources/assets/img/payment/email1.png" ></td>
                                	</tr>
                                	<tr>
                                		<td>
                                		<div class="form__group mb--20">            
	                                    	 <input type="button" class="form__input" value="로그인창으로 돌아가기" style="background-color: #FF5151; font-size:13pt; color:#ffffff;width: 50%" onclick="location.href='<%=cp%>/login.fu'">    
	                                 	</div>
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
