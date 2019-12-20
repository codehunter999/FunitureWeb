<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.TreeMap"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
   
<%@include file="/WEB-INF/views/header/fu_header2.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
    
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
    
        <!-- Main Content Wrapper Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/image/주방다이닝룸.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">wishlist</h1>
                        <ul class="breadcrumb">
                            <li><a href="home.fu">Home</a></li>
                            <li class="current"><span>wishlist</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
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
                                                
                                                <c:set var="cateEn" value="<%=value[0] %>"/>
                                                <c:choose> 
                                                <c:when test="${cateEn eq 'BED' }">
                                                    <a href="bed_BED_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'chiff' }">
                                                    <a href="bed_chiff_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'dressingTable' }">
                                                    <a href="bed_dressingTable_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'ht' }">
                                                    <a href="bed_ht_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                
                                                
                                                <c:when test="${cateEn eq 'light' }">
                                                    <a href="deco_light_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'monthly' }">
                                                    <a href="deco_monthly_details.fu?imageIndex=<%=value[4]%>&cateEn=<%=value[0] %>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'plasticch' }">
                                                    <a href="deco_plasticch_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                
                                                
                                                <c:when test="${cateEn eq 'chair' }">
                                                    <a href="dining_chair_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'clean' }">
                                                    <a href="dining_clean_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'deco' }">
                                                    <a href="dining_deco_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'desk' }">
                                                    <a href="dining_desk_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'rnl' }">
                                                    <a href="dining_rnl_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'sunbrella' }">
                                                    <a href="dining_sunbrella_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'table' }">
                                                    <a href="dining_table_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>

                                                <c:when test="${cateEn eq 'bookcase' }">
                                                    <a href="living_bookcase_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'deus' }">
                                                    <a href="living_deus_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'fabric' }">
                                                    <a href="living_fabric_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'leather' }">
                                                    <a href="living_leather_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'shelf' }">
                                                    <a href="living_shelf_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'sideTable' }">
                                                    <a href="living_sideTable_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'sunb' }">
                                                    <a href="living_sunb_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                <c:when test="${cateEn eq 'TV' }">
                                                    <a href="living_TV_details.fu?cateEn=<%=value[0] %>&imageIndex=<%=value[4]%>">
                                                    <br><br/><%=value[1] %></a>
                                                </c:when>
                                                </c:choose>
                                                </h3>
                                            </td>
                                            <td class="product-stock">
                                                
                                            </td>
                                            <td class="product-price">
                                                <span class="product-price-wrapper">
                                                    <span class="money"><br/><b><%=value[2] %>원</b></span>
                                                </span>
                                            </td>
                                            <td class="product-action-btn">
                                            <%-- <%  
		                                             if(value[1].contains("[")){       
		                                                value[1]=value[1].replace("[", "%5B");
		                                                value[1]=value[1].replace("]", "%5D"); 
		                                             }
		                                     %>
                                            
                                                <div name="addcart" class="btn btn-size-md" onclick="clickevent('<%=value[0] %>:<%=value[1] %>:<%=value[2] %>:<%=value[3] %>')">Add to cart</div> --%>
                                               
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
        <!-- Main Content Wrapper Start -->

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%> 