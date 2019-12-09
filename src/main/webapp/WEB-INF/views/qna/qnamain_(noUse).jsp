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
                        	<li class="current"><span>선브렐라 소파│가죽 소파│데우스 소파│사이드 테이블│TV 장│선반│북케이스</span></li>
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
                                <%for(QnADTO dto:lists){ %>
                                <div class="col-12 mb--45">
                                    <article class="blog format-standard">
                                        <div class="blog__inner">
                                            <div class="blog__media">
	                                            <div class="blog__info">
	                                                <h2 class="blog__title"><a href="<%=cp %>/qnaarticle.fu?id=<%=dto.getId() %>"><%=dto.getSubject() %></a></h2>
	                                                <div class="blog__meta">
	                                                    <span class="posted-on"><%=dto.getCreated_at() %></span>
	                                                    <span class="posted-by"><span>작성자:<%=dto.getName() %> </span><a href="blog-details-image.html"></a></span>
	                                                </div>
	                                                <div class="blog__desc">
	                                                    <p><%=dto.getContent() %></p>
	                                                </div>
	                                                <a href="<%=cp %>/qnaarticle.fu?id=<%=dto.getId() %>" class="read-more-btn">댓글 보기</a>
	                                            </div>
	                                         </div>
                                        </div>
                                    </article>                               
                                </div>
                                <%} %>
                                
                            
                            
							<main class="main-content-wrapper">
    							<div class="inner-page-content ptb--80 ptb-md--60">
        							<div class="container">
            							<div class="row justify-content-center">
                							<div class="col-lg-9">
                    							<div class="row">
                    								<%for(QnADTO dto:lists){ %>
						                                <div class="col-12 mb--45">
						                                    <article class="blog format-standard">
						                                        <div class="blog__inner">
						                                            <div class="blog__media">
							                                            <div class="blog__info">
							                                                <h2 class="blog__title"><a href="<%=cp %>/qnaarticle.fu?id=<%=dto.getId() %>"><%=dto.getSubject() %></a></h2>
							                                                <div class="blog__meta">
							                                                    <span class="posted-on"><%=dto.getCreated_at() %></span>
							                                                    <span class="posted-by">작성자:<%=dto.getName() %></span>
							                                                </div>
							                                                <div class="blog__desc">
							                                                    <p><%=dto.getContent() %></p>
							                                                </div>
							                                                <a href="<%=cp %>/qnaarticle.fu?id=<%=dto.getId() %>" class="read-more-btn">댓글 보기</a>
							                                            </div>
							                                         </div>
						                                        </div>
						                                    </article>                               
						                                </div>
						                            <%} %>
                    							</div>
                    						</div>
                    					</div>
                    				</div>
                    			</div>
                    		</main>
                    		
                    		<div class="related-post__info">
                                <%if(session.getAttribute("name")!=null){ %>
                            		<img src="<%=cp %>/resources/assets/img/reviewimg/write.jpg" width="50" height="50" id="image">
                          		<%} %>
                            </div>
                                                								
                            
                            
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
                	<h1 class="comment-reply-title"><br><br>QnA 작성</h1>
                <form id="write_ok" action="qnawrite.fu" method="post" enctype="application/x-www-form-urlencoded" class="form comment-form">
                    <div class="form__group mb--25 mb-sm--20">
                        <div class="form-row">
                            <div class="col-md-4 mb-sm--20">
                                <input type="text" name="subject" id="subject" class="form__input" placeholder="제목" style="width: 700px">
                            </div>  
                            <div class="col-md-4 mb-sm--20" align="right"></div> 
                               
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