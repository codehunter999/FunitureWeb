<<<<<<< HEAD
=======
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
>>>>>>> 11c78fb7a4ea45b1bc3587180d0ad35c1580cd70
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%	
	request.setCharacterEncoding("UTF-8");
	int map_sumMoney = 0;	
%> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script type="text/javascript">

	$(document).ready(function(){
			
			$("[id^='add']").click(function(e){
				var id_check = $(this).attr("id");			
				var lastNum = id_check.substr(id_check.length - 1)
				e.preventDefault();				
				var stat = $('#qty'+lastNum).val();				
				var num = parseInt(stat,10);
				num++;

				if(num>5){
				alert('더이상 늘릴수 없습니다.');
				num = 5;	
				}
				$('#qty'+lastNum).val(num);
				//버튼별 데이터 움직이는거 확인 
				var item_price = $("#item_price"+lastNum).val();	
				item_price = item_price.substr(0, item_price.length -1); 
				item_price = Number(item_price)

				var totalItem_price_Num = item_price*num;		
				totalItem_price = String(totalItem_price_Num)+"원"
				$('#totalItem_price'+lastNum).val(totalItem_price);
				var map_sumMoney = $('#map_sumMoney').val();
				var map_sumMoney_Num = Number(map_sumMoney); 
				var totalNum = map_sumMoney_Num + item_price;
				$('#map_sumMoney').val(totalNum);
				$('#map_allSum').val(totalNum);

			});	
		
			$("[id^='min']").click(function(e){
				
				var id_check = $(this).attr("id");
				var lastNum = id_check.substr(id_check.length-1)
				e.preventDefault();
				var stat = $('#qty'+lastNum).val();		
				var num = parseInt(stat,10);
				num--;
				if(num<1){
				
					alert('더이상 내릴수 없습니다.');
					num = 1;	
				}
				
				$('#qty'+lastNum).val(num);		
				var item_price = $("#item_price"+lastNum).val();	
				item_price = item_price.substr(0, item_price.length -1); 
				item_price = Number(item_price)
				var totalItem_price = item_price*num;
				totalItem_price = String(totalItem_price)+"원"				
				
				$('#totalItem_price'+lastNum).val(totalItem_price);				
				var map_sumMoney = $('#map_sumMoney').val();
				var map_sumMoney_Num = Number(map_sumMoney); 
				var totalNum = map_sumMoney_Num -item_price;
				$('#map_sumMoney').val(totalNum);
				$('#map_allSum').val(totalNum);
			});
		
	});		
</script>

<script type="text/javascript">


	var data;
	
	function clickevent(eventdata){
		
		data = new Array();
		
		$('div.modal').modal();
		//반복하여 다가져오기 
		var arrayQty =  new Array();
		var arraytotalItem_price =  new Array();
		
		$("[id^='qty']").each(function(indexQty){
			arrayQty[indexQty] = $(this).val();
		});
		
		$("[id^='totalItem_price']").each(function(indexSumMoney){
			arraytotalItem_price[indexSumMoney] = $(this).val();
		});
		for (var i = 0; i < arrayQty.length; i++) {		
			data[i]= "";		
			data[i] = arrayQty[i]+":"+arraytotalItem_price[i];
		}
		
	}
	
	function cartsubmit(){
		location.href="<%=cp%>/payment.fu?data="+data;
		
	}
	
	function cleanCart() {
		var f = document.clearCartAll;
		f.action = "<%=cp%>/removeAllcart.fu";
		f.submit();
	
	}
</script>

 <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/assets/img/bg/page_title_bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">Cart</h1>
                        <ul class="breadcrumb">
                            <li><a href="index.html">Home</a></li>
                            <li class="current"><span>Cart</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb area End -->
		<!--  Modal start  -->
	    <!-- Main Content Wrapper Start -->
        <div class="main-content-wrapper">
            <div class="page-content-inner ptb--80 pt-md--40 pb-md--60">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 mb-md--50">
                          <c:choose >
                             <c:when test="${cartlist == null}">
                                  <b>장바구니가 비어있습니다.</b>
                             </c:when>
                              <c:otherwise>
                              <form action=""  name="form" method="post">
                                <div class="row no-gutters">
                                    <div class="col-12">
                                        <div class="table-content table-responsive">
                                            <table class="table text-center">
                                                <thead>
                                                    <tr>
                                                        <th>&nbsp;</th>
                                                        <th>&nbsp;</th>
                                                        <th class="text-left">상품정보</th>
                                                        <th>판매가</th>
                                                        <th style="text-align: center">수량</th>
                                                        <th style="text-align: center">합계</th>
                                                    </tr>
                                                </thead>
                                                <tbody>				                                
													<%
				                                	 	List<String> cartlist=(List<String>)request.getAttribute("cartlist");
			                                        	if(cartlist!=null){
			                                        		Iterator iterator=cartlist.iterator();
			                                        		int buttonIndex = 0; 
			                                        		int i=0;
			                                        		while(iterator.hasNext()){
			                                        			String result=(String)iterator.next();
			                                        			String[] value=result.split(":");
			                                        			value[2]  = value[2].replaceAll(",","");
			                                        			
				                                    %>
													<tr>
                                                        <td class="product-remove text-left"><a href="<%=cp%>/deletecart.fu?id=<%=buttonIndex%>"><i class="la la-remove"></i></a></td>
                                                        <td class="product-thumbnail text-left">
                                                             <img src="<%=cp %><%=value[3] %>" alt="Product Thumnail">
                                                        </td>
                                                        <td class="product-name text-left wide-column">
                                                            <h3>
                                                                <a href="product-details.html"><%=value[0] %><%=value[1] %></a>
                                                            </h3>
                                                        </td>
                                                        <td class="product-price">
                                                            <span class="product-price-wrapper">
                                                                	<input type="text" value="<%=value[2] %>원" id="item_price<%=buttonIndex%>" style="border: none;text-align: left"/>
                                                                </span>
                                                            </span>
                                                        </td>
                                                        
                                                        <td class="product-quantity">     
                                                         	<button type="button" id="add<%=buttonIndex%>" class="btn-light" style="width: 15px;height: 20px;border: none"><b>+</b></button>                                                                                                                                      	   		
                                                	   		<input  type="text"   id="qty<%=buttonIndex %>" name="qty-2" value="1" min="1" style="width: 10px;height: 20px;border: none;text-align: right">                    
                                                	   		<button type="button" id="min<%=buttonIndex %>" class="btn-light" style="width: 13px;height: 20px;border: none"><b><font size="5">-</font></b></button>   
                                                        <td class="product-total-price">
                                                            <span class="product-price-wrapper">
                                                                <span class="money">
                                                                	<input type="text" value="<%=value[2] %>원" id="totalItem_price<%=buttonIndex%>" style="border: none;text-align: center"/>
                                                              </span>
                                                            </span>
                                                        </td>
                                                    </tr>
   													<% 
   													  map_sumMoney += Integer.parseInt(value[2]); 													  
   													%>
   													<%}       	
                                   				    }%> 			   
	                                                </tbody>
	                                            </table>
	                                        </div>  
	                                    </div>
	                                </div>
	                                <div class="row no-gutters border-top pt--20 mt--20">
	                                    <div class="col-sm-6">
	                                        <div class="coupon">
	                                            <input type="text" id="coupon" name="coupon" class="cart-form__input" placeholder="Coupon Code">
	                                            <button type="submit" class="cart-form__btn">Apply Coupon</button>
	                                      	 </div>
		                                    </div>
		                                </div>
		                            </form>
                                    <form method="post" name="clearCartAll" action="">
	                                    <div class="col-sm-6 text-sm-right">
	                                        <button type="submit" class="cart-form__btn" onclick="cleanCart();">카트비우기</button>
	                                    </div>
	                                </form>
                          	</c:otherwise>
                          </c:choose>
                        </div>
                        
                        <!-- Qicuk View Modal Start -->
				        <div class="modal fade product-modal" id="productModal" tabindex="-1" role="dialog" aria-hidden="true">
				          <div class="modal-dialog" role="document" style="width: 150">
				            <div class="modal-content">
				              <div class="modal-body" align="center">
				              <br><br><br>
				                	결제를 진행하겠습니까?			                	
				                <br>
				                <button class="btn btn-size-sm" onclick="cartsubmit()">예</button>&nbsp;
				                <button class="btn btn-size-sm"  data-dismiss="modal">아니오</button>     
				              	<br><br><br>                      
				              </div>
				            </div>
				          </div>
				        </div>
				        
				        <!-- Qicuk View Modal End -->
                        <div class="col-lg-4">
                            <div class="cart-collaterals">
                                <div class="cart-totals">
                                    <h5 class="font-size-14 font-bold mb--15">Cart totals</h5>
                                    <div class="cart-calculator">
                                        <div class="cart-calculator__item">
                                            <div class="cart-calculator__item--head">
                                                <span>총 상품금액</span>
                                            </div>
                                            <div class="cart-calculator__item--value">
                                                <span>
	                                            	<input type="text" value="<%=map_sumMoney%>"  id="map_sumMoney" style="border: none" /> 
                                                </span>
                                            </div>
                                        </div>
                                        <div class="cart-calculator__item">
                                            <div class="cart-calculator__item--head">
                                                <span>배송비</span>
                                            </div>
                                            <div class="cart-calculator__item--value">
                                                <span>+0원</span>
                                            </div>
                                        </div>
                                        <div class="cart-calculator__item order-total">
                                            <div class="cart-calculator__item--head">
                                                <span>결제예정금액 </span>
                                            </div>
                                            <div class="cart-calculator__item--value">
                                                <span class="product-price-wrapper">
                                              		<input type="text" value="<%=map_sumMoney %>" style="border: none" id="map_allSum"/>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>                             
                               	<div name="addcart" class="btn btn-size-lg" onclick="clickevent()" style="width: 355px">
	                                   상품주문
	                            </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Content Wrapper Start -->
<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>