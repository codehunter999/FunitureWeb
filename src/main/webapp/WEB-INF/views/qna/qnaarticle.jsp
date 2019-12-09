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
        
        <section class="page-title-area-2 bg-image" data-bg-image="<%=cp %>/resources/image/QnaBackground.jpg">
        <!-- <section class="page-title-area-2 bg-image"> -->
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
                                <!-- Single Post Start -->
                                <article class="single-post mb--75 mb-md--55 pb--75 pb-md--55">
                                	<%if((String)request.getParameter("mode")==null){ %>
                                    <header class="single-post__header">
                                        <h2 class="single-post__title"><%=dto.getSubject() %></h2>
                                        <div class="single-post__media">
                                            <figure class="image">
                                            		
                                                <%-- <img src="/img/<%=dto.getPhoto() %>" alt="Single Post Title" class="w-100"> --%>
                                            </figure>
                                        </div>
                                        <div class="single-post__header-meta">
                                            <span class="posted-on"><%=dto.getCreated_at() %></span>
                                            <span class="post-category">
                                                <%=dto.getName() %>
                                            </span>
                                        </div>
                                    </header>
                                    <div class="single-post__info">
                                        <div class="row mb--43 mb-md-33">
                                            <div class="col-lg-8 col-md-8">
                                            <textarea rows="10" cols="105" readonly="readonly"><%=dto.getContent() %></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    
	                                    <%if(dto.getName().equals(session.getAttribute("name"))){ %>
		                                    <a href="<%=cp %>/qnarewrite.fu?id=<%=dto.getId() %>&mode=1">
		                               		    <img src="<%=cp %>/resources/assets/img/reviewimg/rewrite.png" width=50 height=50>
		                                    </a>
	                                    	<a href="<%=cp %>/qnadelete.fu?id=<%=dto.getId() %>">
	                                    		<img src="<%=cp %>/resources/assets/img/reviewimg/delete.jpg" width=50 height=50>
	                                    	</a>
	                                    <%}
                                    }else {%>
	                                   <form action="qnarewrite_ok.fu?id=<%=dto.getId() %>" method="post" enctype="application/x-www-form-urlencoded">
	                                   <header class="single-post__header">
	                                       <input type="text" name="subject" id="subject" class="form__input" value="<%=dto.getSubject() %>" style="width: 700px">
	                                       <div class="single-post__media">
	                                            <figure class="image">
                                            		
                                                <%-- <img src="/img/<%=dto.getPhoto() %>" alt="Single Post Title" class="w-100"> --%>
                                           		</figure>
                                           	</div>
	                                        <div class="single-post__header-meta">
	                                            <span class="posted-on"><%=dto.getCreated_at() %></span>
	                                            <span class="post-category">
	                                                <%=dto.getName() %>
	                                            </span>
	                                        </div>
                                    	</header>
                                    <div class="single-post__info">
                                        <div class="row mb--43 mb-md-33">
                                            <div class="col-lg-8 col-md-8">
                                            <textarea rows="10" cols="105" name="content" id="content"><%=dto.getContent() %></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-size-sm">작성</button>
                                   </form>
                                   <%} %>																																																																																																																																																																																																																																																																																																																													```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
                                </article>
                                <!-- Single Post End -->

                                <!-- Comment Area Start -->
                                <section class="comment">
                                    <h2 class="comment-title"><%=lists.size() %> comments</h2>
                                    <ul class="comment-list mb--45">
                                        <%for(Re_QnADTO re_dto:lists){ %>
                                        <li>
                                            <div class="single-comment">
                                                <figure class="comment-avatar">
                                                    <img src="<%=cp %>/resources/assets/img/others/avatar-large-2.png" alt="Avatar">
                                                </figure>
                                                <div class="comment-info">
                                                    <div class="comment-meta">
                                                        <h4><%=re_dto.getName() %></h4>
                                                        <div class="metadata">
                                                            <span class="comment-date"><%=re_dto.getCreated_at() %></span>
                                                        </div>
                                                    </div>
                                                    <div class="comment-content">
                                                        <p><%=re_dto.getContent() %></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <%} %>
                                    </ul>
                                    <div class="comment-respond">
                                        <h3 class="comment-reply-title">Write a Reply or Comment</h3>
                                        <form action="qnaarticlewrite.fu" class="form comment-form" method="post">
                                        <input type="hidden" name="qaboard_id" value="<%=dto.getId()%>">
                                            <div class="form__group mb--25 mb-sm--20">
                                                <div class="form-row">
                                                </div>
                                            </div>
                                            <div class="form__group mb--25 mb-sm--20">
                                                <div class="form-row">
                                                    <div class="col-12">
                                                        <textarea name="content" id="review" class="form__input form__input--textarea" placeholder="댓글 작성하기"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form__group">
                                                <div class="form-row">
                                                    <div class="col-12">
                                                    <%if(session.getAttribute("name")!=null){ %>
                                                        <button type="submit" class="btn btn-size-sm">댓글 작성하기</button>
                                                        <%} %>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </section>
                                <!-- Comment Area End -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Post Area End -->

                <!-- Related Post Area Start -->
                <section class="related-post-area mb--80 mb-md--60">
                    <div class="container">
                        <div class="row mb--50">
                            <div class="col-12 text-center">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="element-carousel slick-dot-mt-40 related-post-carousel" data-slick-options='{
                                    "spaceBetween": 30,
                                    "slidesToShow": 2,
                                    "slidesToScroll": 1,
                                    "dots": true,
                                    "infinite": true, 
                                    "centerMode": true
                                }' data-slick-responsive='[
                                    {"breakpoint": 768, "settings": {"slidesToShow": 1}}
                                ]'>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Related Post Area End -->
            </div>
        </main>
        <!-- Main Content Wrapper End -->

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>