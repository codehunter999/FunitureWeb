<%@page import="java.util.List"%>
<%@page import="com.funi.domain.QnADTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	List<QnADTO>lists=(List<QnADTO>)request.getAttribute("lists");
%>
<%@include file="/WEB-INF/views/header/fu_header2.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/image/QnaBackground.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">QnA Board</h1>
                        <ul class="breadcrumb">
                        	<li class="current"><span>상품 Q&A 입니다.</span></li>
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
                        	<div class="col-12">
                        		<h3>Question And Answers</h3>
							</div>
							<br/>
                       	</div>
                       	
                        <div class="row">
                        	<table class="table table-style-2 wishlist-table text-center">
                        		<thead>
                                	<tr>
                                		<th>&nbsp;</th>
                                        <th style="font-size: 16px"><b>내&nbsp;&nbsp;&nbsp;용</b></th>
                                        <th style="font-size: 16px"><b>작성자</b></th>
                                        <th style="font-size: 16px"><b>작성일</b></th>
                                    </tr>
                                </thead>
                             	<tbody>
                                <%for(QnADTO dto:lists){ %>
	                           		<tr>
                                       <td class="product-remove text-left">
                                       </td>
                                       <td class="product-name text-left wide-column">
                                           <h3>
                                               <a href="<%=cp %>/qnaarticle.fu?id=<%=dto.getId() %>"> <%=dto.getContent() %></a>
                                           </h3>
                                       </td>
                                       
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
                                
                                </tbody>
                                </table>

                                <div class="related-post__info">
                                	<div class="row">
	                                	<div class="col-12 text-center">
	                                    	<ul class="pagination">
			                                    <c:if test="${dataCount!=0 }">
													${pageIndexList }
												</c:if>
												<c:if test="${dataCount==0 }">
													등록된게시물이 없습니다.
												</c:if>
											</ul>
										</div>
										<div class="form__group mr--30">
	                                		<input id="image" type="submit" value="글쓰기" class="btn btn-size-sm">
	                            		</div>
									</div>
	                            </div>
                           	</div>
                        </div>
                    </div>
                </div>
            
        </main>
        <!-- Main Content Wrapper End -->
        
		
		<!-- Qicuk View Modal Start -->
		<div class="modal fade product-modal" id="qnaModal" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog" role="document"  style="width: 900px"><!-- 862 -->
				<div class="modal-content">
					<div class="modal-body">
						<div class="comment-respond" style="padding-left: 40px">
							<h1 class="comment-reply-title"><br><br>Create Question</h1>
							<form id="write_ok" action="qnawrite.fu" method="post" enctype="application/x-www-form-urlencoded" class="form comment-form">
								<div class="form__group mb--25 mb-sm--20">
									<div class="form-row">
										<div class="col-md-4 mb-sm--20">
											<input type="text" name="subject" id="subject" class="form__input" placeholder="제목" style="width: 820px">
										</div>
									</div>
								</div>
								<div class="form__group mb--25 mb-sm--20">
									<div class="form-row">
										<div class="col-12">
											<textarea style="width:820px" name="content" id="content" placeholder="궁금하신 내용을 적어주세요" rows="13"  cols="70"></textarea>
										</div>
									</div>
								</div>
								<div class="form__group">
									<div class="form-row" style="padding-bottom: 30px">
										<div class="col-12"><br>
											<button type="submit" class="btn btn-size-sm">글쓰기</button>
											<button type="button" class="btn btn-size-sm" id="closemodel" data-dismiss="modal">취소</button>
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