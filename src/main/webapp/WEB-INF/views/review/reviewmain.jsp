<%@page import="java.util.List"%>
<%@page import="com.funi.domain.ReviewDTO"%>
<%
	request.setCharacterEncoding("UTF-8");
	List<ReviewDTO>lists=(List<ReviewDTO>)request.getAttribute("lists"); 
%>
<%@include file="/WEB-INF/views/header/fu_header2.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80"  data-bg-image="<%=cp %>/resources/assets/img/reviewimg/backgroundimages.jpg">
            <div class="container" >
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">리뷰 게시판</h1>
                        <ul class="breadcrumb">
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb area End -->

        <!-- Main Content Wrapper Start -->
        <main class="main-content-wrapper">
            <div class="inner-page-content ptb--80 ptb-md--60">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-9">
                            <div class="row">
                            
                                <table class="table table-style-2 wishlist-table text-center">
                                <thead>
                                        <tr>
                                            <th>&nbsp;</th>
                                            <th>&nbsp;</th>
                                            <th style="font-size: 16px"><b>내&nbsp;&nbsp;&nbsp;용</b></th>
                                            <th></th>
	                                        <th style="font-size: 16px"><b>작성자</b></th>
	                                        <th style="font-size: 16px"><b>작성일</b></th>
                                        </tr>
                                    </thead>
                                <tbody>
                                <%for(ReviewDTO dto:lists){ %>
	                           		<tr>
	                           			<td></td>
	                           			<td class="product-remove text-left">
	                           				<figure class="image">
	                           					<%if(dto.getPhoto()!=null){ %>
                                        	    	<img src="/img/<%=dto.getPhoto() %>" alt="Blog" class="w-100">
                                        	    <%}else{ %>
                                        	    	<img src="<%=cp %>/resources/assets/img/reviewimg/images.png" alt="Blog" >
                                        	    <%} %>
                                        	    	<a href="<%=cp %>/reviewarticle.fu?id=<%=dto.getId() %>" class="item-overlay"></a>
											</figure>
										</td>
										<td class="product-name text-left wide-column">
                                        	<h3>
                                            	<a href="<%=cp %>/reviewarticle.fu?id=<%=dto.getId() %>"> <%=dto.getContent() %></a>
                                           	</h3>
                                       	</td>
                                       	<td class="product-stock"></td>
                                       	<td class="product-price">
                                       		<span class="product-price-wrapper">
                                       			<span class="money"><%=dto.getName() %></span>
                                           	</span>
                                       	</td>
                                       	<td class="product-price">
                                        	<span class="product-price-wrapper">
                                            	<span class="money"><%=dto.getCreated_at() %></span>
                                            </span>
                                       	</td>
	                                </tr>
                                <%} %>
                                <tr>
	                                <td class="product-remove text-left"></td>
	                                <td class="product-thumbnail text-left"></td>
	                                <td class="product-name text-left wide-column"></td>
	                                <td class="product-stock"></td>
	                                <td class="product-price"></td>
	                                <td class="product-price"></td>
                                </tr>
                                </tbody>
                                </table>

                       
                            </div>
                            
                            <div class="row">
                                <div class="col-12 text-center">
                                    <!-- <ul class="pagination">
                                        <li><span class="page-number current">1</span></li>
                                        <li><a href="#" class="page-number">2</a></li>
                                        <li><span class="dot"></span></li>
                                        <li><span class="dot"></span></li>
                                        <li><span class="dot"></span></li>
                                        <li><a href="#" class="page-number">16</a></li>
                                    </ul> -->
                                    
                                    <ul class="pagination">
                                    <c:if test="${dataCount!=0 }">
										${pageIndexList }
									</c:if>
									<c:if test="${dataCount==0 }">
										등록된게시물이 없습니다.
									</c:if>
									</ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!-- Main Content Wrapper End -->
		
		<!-- Qicuk View Modal Start -->
		<div class="modal fade product-modal" id="productModal" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog" role="document"  style="width: 900px"><!-- 862 -->
				<div class="modal-content">
					<div class="modal-body">
						<div class="comment-respond">
						<h1 class="comment-reply-title"><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;리뷰 작성</h1>
						<form id="write_ok" action="reviewwrite.fu" method="post" enctype="multipart/form-data" class="form comment-form">
							<div class="form__group mb--25 mb-sm--20">
								<div class="form-row">
									<input type="file" id="upload" name="upload" class="upload" style="display:none;">
									<div class="col-md-4 mb-sm--20">
										<input type="text" name="subject" id="subject" class="form__input" placeholder="제목" style="width: 700px">
									</div>
									<div class="col-md-4 mb-sm--20" align="right">
										<label for="upload" class="btn_file">
											<img src="<%=cp %>/resources/assets/img/reviewimg/picture.png" width="50" height="50">
										</label>
									</div>
								</div>
							</div>
							<div class="form__group mb--25 mb-sm--20">
								<div class="form-row">
									<div class="col-12" style="height: 500px;margin-left: 30px">
										<textarea name="content" id="content" placeholder="내용을 적어주세요" rows="20"  cols="101"></textarea>
									</div>
								</div>
							</div><br>
									<div class="form__group">
									<div class="form-row">
									<div class="col-12"><br>
										<button type="submit" class="btn btn-size-sm">작성</button>
										<button type="reset" class="btn btn-size-sm">다시쓰기</button>
										<button type="button" class="btn btn-size-sm" id="closemodel" data-dismiss="modal">작성 취소</button>
										<br><br>
									</div>
								</div>
							</div>
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
        <!-- Qicuk View Modal End -->

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>