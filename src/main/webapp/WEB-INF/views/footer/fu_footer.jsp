<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp1 = request.getContextPath();
%>
        <!-- Footer Start-->
        <footer class="footer bg-color" data-bg-color="#ffffff">
            <div class="footer-top">
                <div class="container-fluid">
                    <div class="row border-bottom pt--70 pb--70">
                        <div class="col-lg-3 col-sm-6 offset-md-1 offset-lg-0 mb-md--45">
                            <div class="footer-widget">
                                <div class="textwidget">
                                    <figure class="footer-logo mb--30">
                                        <img src="<%=cp1%>/resources/assets/img/logo/kaare.jpg" alt="Logo">
                                    </figure>
                                    <p>KAARE KLINT의 브렌드 아이덴티티는 3개의 손가락을 형상화한 형태이며, 단순한 기능주의가 아닌 실용적 아이디어와 감성이 담겨 있습니다. </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-3 offset-lg-1 offset-sm-2 mb-md--45">
                            <div class="footer-widget">
                                <h3 class="widget-title mb--35 mb-sm--20">Company</h3>
                                <div class="footer-widget">
                                    <ul class="footer-menu">
                                        <li><a href="company.fu">About Us</a></li>
                                        <li><a href="blog.fu">location</a></li> <!-- *************실행X -->
                                        <!-- <li><a href="company.fu">Careers</a></li> -->
                                        <li><a href="contact-us.fu">Contact</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-4 offset-md-1 offset-lg-0 mb-xs--45">
                            <div class="footer-widget">
                                <h3 class="widget-title mb--35 mb-sm--20">Product</h3>
                                <div class="footer-widget">
                                    <ul class="footer-menu">
                                        <li><a href="living_total.fu">거실 / 리빙룸</a></li>
                                        <li><a href="dininigfull.fu">주방 / 다이닝룸</a></li>
                                        <li><a href="bed_total.fu">침실 / 베드룸</a></li>
                                        <li><a href="decofull.fu">홈데코 / 리빙</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-4 mb-xs--45">
                            <div class="footer-widget">
                                <h3 class="widget-title mb--35 mb-sm--20">Helps</h3>
                                <div class="footer-widget">
                                    <ul class="footer-menu">
                                        <!-- <li><a href="#">Introduction</a></li> -->
                                        <!-- <li><a href="#">Feedback</a></li> -->
                                        <li><a href="qnamain.fu">Q&A</a></li>
                                        <!-- <li><a href="#">Network Status</a></li> -->
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-3 col-sm-4">
                            <div class="footer-widget">
                                <h3 class="widget-title mb--35 mb-sm--20">Social Network</h3>
                                <div class="footer-widget">
                                    <ul class="footer-menu">
                                        <li><a href="https://www.facebook.com/kaareklintstory/">Facebook</a></li>
                                        <li><a href="https://www.instagram.com/explore/tags/%EC%B9%B4%EB%A0%88%ED%81%B4%EB%A6%B0%ED%8A%B8/">Instagram</a></li>
                                        <!-- <li><a href="#">Twitter</a></li> -->
                                        <!-- <li><a href="#">Linkedin</a></li> -->
                                        <!-- <li><a href="#">Google +</a></li> -->
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
                                <div class="taglist" style="font-size: 10pt; color: gray;">
                                    <!-- <span>Tags:</span>
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
                                    <a href="#">Template</a> -->
                                    (주)카레클린트&nbsp;&nbsp;|&nbsp;&nbsp;대표자: 김동철 박난주 박제선 신준석 조유록 최효은&nbsp;&nbsp;|&nbsp;&nbsp;사업자 등록번호 안내:[211-88-75657]&nbsp;&nbsp;|&nbsp;&nbsp;통신판매업 신고 2012-서울강남-03297&nbsp;&nbsp;&nbsp;&nbsp;[사업자정보확인]<br/>
                                    대표번호: 1599-4797 A/S서비스센터: 1644-2908 서비스센터 운영시간:평일 10:00-17:00&nbsp;&nbsp;|&nbsp;&nbsp;주소: 135948 서울 강남구 청담동 3-11 개인정보관리책임자:김동철-신준석<br/>
                                    |&nbsp;&nbsp;Contact <b>kaareklint@naver.com</b> for more information
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
                            <p class="copyright-text">Copyright &copy; 2016 <b>(주)카레클린트</b> All rights reserved.</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer End-->
        <!-- OffCanvas Menu Start -->
		<%@include file="/WEB-INF/views/footer/fu_offCanvas.jsp" %>
        <!-- OffCanvas Menu End -->

        <!-- Mini Cart Start -->
        <aside class="mini-cart" id="miniCart">
            <div class="mini-cart-wrapper">
                <div class="mini-cart__close">
                    <a href="#" class="btn-close"><i class="la la-remove"></i></a>
                </div>
               <div class="mini-cart-inner">
                    <h3 class="mini-cart__heading mb--45"><font size="5">Shopping Cart</font></h3>
                    <div class="mini-cart__content">
                        <ul class="mini-cart__list">
		               	<c:if test="${empty cartlist}">
								 <li><font size="5">주문한 상품이 없습니다.</font></li><br/>
						</c:if> 
				 <c:if test="${!empty cartlist }">
		              	<%
		                	 	List<String> minicartlist = (List<String>)session.getAttribute("cartlist");
		                       	if(minicartlist!=null){
		                       		Iterator iterator=minicartlist.iterator();
		                       		int buttonIndex = 0; 
		                       		int i=0;
		                       		while(iterator.hasNext()){
		                       			String result=(String)iterator.next();
		                       			String[] value = result.split(":");
		                       			value[2]  = value[2].replaceAll(",","");			                                        			
						                                   
		              	%>
                        	
	                        <li class="mini-cart__product">
	                            <div class="mini-cart__product-image">
	                                <img src="<%=cp1 %><%=value[3] %>" alt="products">
	                            </div>
	                            <div class="mini-cart__product-content">
	                                <div class="mini-cart__product-title"><%=value[1]%></div>                       
	                            </div>
	                        </li>
								<%
			                       }
								%>
							<%
		                      }
							%>
                        </c:if>
                		</ul>
                        <div class="mini-cart__buttons">
                            <a href="wishlist.fu" class="btn btn-fullwidth btn-bg-primary mb--20"><font size="5">Wish List</font></a>
                            <a href="cartlist.fu" class="btn btn-fullwidth btn-bg-primary mb--20"><font size="5">View Cart</font></a>
                            <!-- <a href="payment.fu" class="btn btn-fullwidth btn-bg-primary"><font size="5">Payment</font></a> -->
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
                <p>검색할 제품 이름을 입력하세요.</p>
                <form name="searchForm" class="searchform">
                    <input type="text" name="searchValue" id="search" class="searchform__input" placeholder="Search Entire Store...">
                    <input type="hidden" name="cate" value="${cate }">
                    <input type="hidden" name="cateEn" value="${cateEn }">
                    <button type="submit" class="searchform__submit"><i class="la la-search"></i></button>
                    <!-- <input type="button" id="searchV" class="searchform__submit la la-search" value="◈" style="font-size: 20pt; color: green; border: 2px solid; border-color: green;"/> -->
                </form>
            </div>
        </div>
        <!-- Searchform Popup End -->
		 <!-- Global Overlay Start -->
        <div class="global-overlay"></div>
        <!-- Global Overlay End -->

        <!-- Global Overlay Start -->
        <a class="scroll-to-top" href=""><i class="la la-angle-double-up"></i></a>
        <!-- Global Overlay End -->
   
    <!-- Main Wrapper End -->
 
	<!-- Qicuk View Modal Start -->
        <div class="modal fade product-modal" id="cartModal" tabindex="-1" role="dialog" aria-hidden="true">
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
    <!-- ************************* JS Files ************************* -->

    <!-- jQuery JS -->
    <script src="<%=cp1 %>/resources/assets/js/vendor.js"></script>

    <!-- Main JS -->
    <script src="<%=cp1 %>/resources/assets/js/main.js"></script>
</body>

</html>