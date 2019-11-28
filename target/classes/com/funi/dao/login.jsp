<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
    $(function(){
        var responseMessage = "<c:out value="${message}" />";
        if(responseMessage != ""){
            alert(responseMessage)
        }
    }) 
</script>
   
        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/assets/img/bg/page_title_bg.jpg">
            <div class="container">
                <div class="row">
                 	<div class="col-6 col-md-4" style="text-align: center">
                    </div> 
                    <div class="col-6 col-md-4" style="text-align: center">
                        <h1 class="page-title">로그인</h1>
                    </div>     
                </div>
              </div>
        </section>
        <!-- Breadcrumb area End -->
        
        <!-- Main Content Wrapper Start -->
        <div class="main-content-wrapper">
            <div class="page-content-inner pt--75 pb--80">
                <div class="container">
                	<div class="row">
                		<div class="col-md-4">       			
                		</div>
                		<div class="col-md-4">
                			<div class="login-box">
                				<h3 class="heading__terriary mb--30" style="text-align: center">로그인</h3>
               					<form class="form form--login" action="<%=cp%>/login_ok.fu" method="post">
               						  <div class="form__group mb--20">
                                        <label class="form__label" for="username_email"><b>이메일주소</b></label>
                                        <input type="text" class="form__input" id="username_email" name="email" style="size: 50px">
                                    </div>
                                    <div class="form__group mb--20">
                                       <label class="form__label" for="login_password"><b>패스워드</b></label>
                                        <input type="password" class="form__input" id="login_password" name="pwd">
                                    </div>
                                    <div class="d-flex align-items-center mb--20">
                                        <div class="form__group mr--30">
                                            <input type="submit" value="로그인" class="btn btn-size-sm">
                                        </div>
                                        <div class="form__group">
                                            <label class="form__label checkbox-label" for="store_session">
                                                <input type="checkbox" name="store_session" id="store_session">
                                                <span>아이디 저장</span>
                                            </label>
                                        </div>
                                    </div>
                                    <a class="forgot-pass" href="<%=cp%>/register.fu"><b>&nbsp;&nbsp;회원가입&nbsp;&nbsp;</b></a>
                                    <a class="forgot-pass" href="#"><b>&nbsp;&nbsp;패스워드 찾기&nbsp;</b></a>
               					</form>
               					<br/>
               					<a href="https://kauth.kakao.com/oauth/authorize?client_id=31d857a43c06796d21fa6fd041d12cd6&redirect_uri=http://192.168.16.12:8080<%=cp%>/login.fu&response_type=code">
               					<img src="<%=cp%>/resources/assets/img/login/kakao_login.png" style="outline: none">
               					</a> 
               					</div>
                			</div>
                		</div>
                		<div class="col-md-4">
                			
                		</div>
                	</div>
                </div>
            </div>
        </div>
        <!-- Main Content Wrapper Start -->
<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>