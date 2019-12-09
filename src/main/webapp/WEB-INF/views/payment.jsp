<%@page import="java.util.ArrayList"%>
<%@page import="com.funi.domain.PaymentDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
PaymentDTO paymentdto = null;
List<PaymentDTO> paylist = new ArrayList<PaymentDTO>();
%>
<script type="text/javascript">
		
	var data;
	
	function payment() {	
		//var f = document.paymentInfo;
		$('div.modal').modal();
		data = paylist;
		f.action = "<%=cp%>/payment_input.fu";
		f.submit();
	}
	function cartsubmit(){
		location.href="<%=cp%>/payment_input.fu";
		
	}
	
</script>

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
        <!-- Main Content Wrapper Start -->
        <div class="main-content-wrapper">
            <div class="page-content-inner pt--80 pt-md--60 pb--72 pb-md--60">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
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
				                                int totalSum = 0;
                                            	List<String> cartlist=(List<String>)request.getAttribute("cartlist");
                                           		//List<PaymentDTO> paylist = new ArrayList<PaymentDTO>();
                                            	if(cartlist!=null){
	                                        		Iterator iterator=cartlist.iterator();
	                                        		int buttonIndex = 0; 
	                                        		int i=0;
	                                        		//PaymentDTO paymentdto = null;
	                                        		int Itemtotal = 0;
	                                        		while(iterator.hasNext()){
	                                        			paymentdto = new PaymentDTO();
	                                        			String result=(String)iterator.next();
	                                        			String[] value=result.split(":");
	                                        			value[2]  = value[2].replaceAll(",","");
	                                        			Itemtotal = Integer.parseInt(value[4])*Integer.parseInt(value[2]);
	                                        			totalSum += Itemtotal;
	                                        			//paymentdto 상품정보 상품별 가격,상품 수량
	                                        			paymentdto.setProductInfo(value[1]);
	                                        			paymentdto.setProductEa(Integer.parseInt(value[4]));
	                                        			paymentdto.setProductPrice(Integer.parseInt(value[2]));  			
	                               			%>                  
                                            <tr>
                                                <th><%=value[0] %><%=value[1] %>
                                                    <strong><span>&#10005;</span><%=value[4]%></strong>
                                                </th>
                                                <td class="text-right"><%=Itemtotal %></td>
                                            </tr>
                                            <%
	                                            	i++; 
	                                            	paylist.add(paymentdto); 
                                            	}       	
                                   			}%> 
                                                                                    
                                        <tfoot>
                                            <tr class="cart-subtotal">
                                                <th>총 상품 금액</th>
                                                <td class="text-right">
                                                <fmt:formatNumber value="<%=totalSum %>" pattern="###,###,###"/>
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
                                                <fmt:formatNumber value="<%=totalSum%>" pattern="###,###,###"/>원
                                                </span></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>                           
                                <div class="checkout-payment">
                                    <form action="" class="payment-form" name="paymentInfo" method="post">
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
                                            <input type="button" class="btn btn-size-md btn-fullwidth" 
                                            			onclick="payment('<%=paylist %>')" value="결제하기"/>
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
<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>   