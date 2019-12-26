<%@page import="com.funi.domain.QnADTO"%>
<%@page import="com.funi.domain.Re_QnADTO"%>
<%@page import="java.util.List"%>
<%
	request.setCharacterEncoding("UTF-8");
	QnADTO dto=(QnADTO)request.getAttribute("dto");
	List<Re_QnADTO>lists=(List<Re_QnADTO>)request.getAttribute("lists");
	String mode=(String)request.getAttribute("mode");
%>  
<%@include file="/WEB-INF/views/header/fu_header2.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

        <!-- Breadcrumb area Start -->
        
        <section class="page-title-area bg-image ptb--80"  data-bg-image="<%=cp %>/resources/image/QnaBackground.jpg">
            <div class="container" >
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">Question And Answer</h1>
                        <ul class="breadcrumb">
                        </ul>
                    </div>
                </div>
            </div>
        </section>
         
        <!-- Breadcrumb area End -->

        <!-- Main Content Wrapper Start -->
        <main class="main-content-wrapper">
            <div class="inner-page-content">
                <!-- Single Post Area Start -->
                <div class="single-post-area mb--75 mb-md--55">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-9">
                            <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                                <!-- Single Post Start -->
                                <article class="single-post mb--75 mb-md--55 pb--75 pb-md--55">
                                    <header class="single-post__header">
                                        <h5 style="font-size: 25px" class="single-post__title">고객님, 궁금한 사항이 있으신가요? 답변은 E-mail로 보내드립니다.</h5>
                                        
                                        
                                        <div class="single-post__header-meta">
                                            <span class="posted-on">Date: <%=dto.getCreated_at() %></span>
                                            <span class="post-category">
                                                <%=dto.getSubject() %>
                                            </span>
                                        </div>
                                    </header>
                                    <div class="single-post__info">
                                        <div class="row mb--43 mb-md-33">
                                            <div class="col-lg-4 col-md-4 pl--45 pl-sm--15">
                                                <div class="single-post__meta">
                                                    <div class="posted-by">
                                                        <span class="byline">by</span>
                                                        
                                                            <span><%=dto.getName() %>'s QnA</span>
                                                        
                                                    </div>
                                                    <div class="social">
                                                    	<a href="<%=cp %>/qnadelete.fu?id=<%=dto.getId() %>">
                                    						<img src="<%=cp %>/resources/assets/img/reviewimg/delete.jpg" width=50 height=50>
                                    					</a>
                                                        <!-- 
                                                        <a href="https://www.facebook.com" class="social__link">
                                                            <i class="la la-facebook"></i>
                                                        </a>
                                                        <a href="https://www.twitter.com" class="social__link">
                                                            <i class="la la-twitter"></i>
                                                        </a>
                                                        <a href="https://www.plus.google.com" class="social__link">
                                                            <i class="la la-google-plus"></i>
                                                        </a> 
                                                        -->
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-8 col-md-8">
                                                <p><%=dto.getContent() %></p>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                <!-- Single Post End -->
                                
                                <div class="form__group">
                                	<div class="form-row">
                                		<div class="col-12">
                                			<button type="button" class="btn btn-size-sm" onclick="window.location.href='qnaarticle.fu?id=<%=dto.getId()-1 %>&pageNum=<%=request.getParameter("pageNum")%>'" >이전글</button>
                                			<button type="button" class="btn btn-size-sm" onclick="window.location.href='qnamain.fu?pageNum=<%=request.getParameter("pageNum")%>'" >목 록</button>
                                			<button type="button" class="btn btn-size-sm" onclick="window.location.href='qnaarticle.fu?id=<%=dto.getId()+1 %>&pageNum=<%=request.getParameter("pageNum")%>'" >다음글</button>
                                		</div>
                                	</div>
                                </div>

                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
		</main>
        <!-- Main Content Wrapper End -->

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>