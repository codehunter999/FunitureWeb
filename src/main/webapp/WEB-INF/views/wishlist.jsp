<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.TreeMap"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

   <script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
   
<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="zxx">
 
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Beck - Furniture eCommerce Bootstrap 4 Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicons -->
    <link rel="shortcut icon" href="<%=cp %>/resources/assets/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="<%=cp %>/resources/assets/img/icon.png">

    <!-- ************************* CSS Files ************************* -->

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="<%=cp %>/resources/assets/css/vendor.css">

    <!-- style css -->
    <link rel="stylesheet" href="<%=cp %>/resources/assets/css/main.css">
    
    
    <script type="text/javascript">
	 
	    var data;
	    
		function clickevent(eventdata){
			data=eventdata;
			$('div.modal').modal();
		}
		function cartsubmit(){
			location.href="<%=cp%>/cartlist_input.fu?data="+data;
		}
    </script>
    
</head>
<body>
    <!-- Preloader Start -->
    <div class="ft-preloader active">
        <div class="ft-preloader-inner h-100 d-flex align-items-center justify-content-center">
            <div class="ft-child ft-bounce1"></div>
            <div class="ft-child ft-bounce2"></div>
            <div class="ft-child ft-bounce3"></div>
        </div>
    </div>
    <!-- Preloader End -->

    <!-- Main Wrapper Start -->
    <div class="wrapper">

        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/assets/img/reviewimg/backgroundimage.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">Wishlist</h1>
                        <ul class="breadcrumb">
                            <li><a href="index.html">Home</a></li>
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
                                                    <a href="product-details.html"> <%=value[0] %>
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
                                            <%  
		                                             if(value[1].contains("[")){       
		                                                value[1]=value[1].replace("[", "%5B");
		                                                value[1]=value[1].replace("]", "%5D"); 
		                                             }
		                                     %>
                                            
                                                <div name="addcart" class="btn btn-size-md" onclick="clickevent('<%=value[0] %>:<%=value[1] %>:<%=value[2] %>:<%=value[3] %>')">Add to cart</div>
                                               
                                            </td>
                                        </tr>
                                        <%
                            			i++;
                                        }
                                        }%>
                                    </tbody>
                                </table>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
        <!-- Main Content Wrapper Start -->

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%> 