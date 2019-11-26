<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="<%=cp%>/resources/assets/js/register_check.js"></script>
<!-- Breadcrumb area Start -->
      <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/assets/img/bg/page_title_bg.jpg">
          <div class="container">
              <div class="row">
               	<div class="col-6 col-md-4" style="text-align: center">
                  </div> 
                  <div class="col-6 col-md-4" style="text-align: center">
                      <h1 class="page-title">회원가입</h1>
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
              				<h3 class="heading__terriary mb--30" style="text-align: center">회원가입</h3>
             					<form class="form form--login" name="register" action="">
             						<div class="form__group mb--20">
                                  &nbsp;
                                  </div>
             						<div class="form__group mb--20">
                                      <label class="form__label" for="email"><b>이메일주소</b></label>
                                      <input type="text" class="form__input" id="email" name="email" style="size: 50px" >
                                  </div>
                                  <div class="form__group mb--20">
                                     <label class="form__label" for="password"><b>패스워드</b></label>
                                      <input type="password" class="form__input" id="password" name="pwd">
                                  </div>
                                  <div class="form__group mb--20">
                                     <label class="form__label" for="name"><b>이  름</b></label>
                                      <input type="text" class="form__input" id="name" name="name" >
                                  </div>
                                  <div class="form__group mb--20">
                                     <label class="form__label" ><b>휴대전화</b></label>
                                      <select id="phone1" name="phone1" class="form__input">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
								<input type="text" class="form__input" id="phone2" name="phone2" maxlength="8" placeholder="'-'를 제외하고 입력하세요">
                                  </div>
                                  
                                  <div class="form__group mb--20">
                                  &nbsp;
                                  </div>
                                  
                                  <div class="form__group mb--20">
                                  	
                                      <input type="button" class="form__input" value="회원가입" style="background-color: #FF5151; font-size:13pt; color:#ffffff;" onclick="check();">
                                      
                                      <a href="home.fu">
                                      <input type="button" class="form__input" value="회원가입취소" style="background-color: #FF5151; font-size:13pt; color:#ffffff;">
                                      </a>
                                  </div>
             					</form>
             					<br/>
              			</div>
              		</div>
              	</div>
              </div>
          </div>
      </div>
    <!-- Main Content Wrapper Start -->
<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>