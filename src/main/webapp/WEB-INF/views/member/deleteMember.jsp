<%@include file="/WEB-INF/views/header/fu_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript">
	
	function checkEmail(cp){
		
		var f = document.searchPassword;
		var email = f.email.value;
		if(email=="" || email==null){
			alert("Email을 입력하세요");
			f.email.focus();
			return;
		}
		
		f.action = cp+"/deleteMember_ok.fu";
		f.submit();
	}	
	
</script>

      <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp%>/resources/assets/img/bg/page_title_bg.jpg">
            <div class="container">
                <div class="row">
                 	<div class="col-6 col-md-4" style="text-align: center">
                    </div> 
                    <div class="col-6 col-md-4" style="text-align: center">
                        <h1 class="page-title">회원탈퇴</h1>
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
                				<h3 class="heading__terriary mb--30" style="text-align: center">회원탈퇴</h3>
               					<form class="form form--login"  method="post" name="searchPassword">
               						  <div class="form__group mb--20">
                                        <label class="form__label" for="username_email"><b>이메일주소</b></label>
                                        <input type="text" class="form__input" id="username_email" name="email" style="size: 50px">
                                    </div>
									<div class="form__group mb--20">            
	                                     <input type="button" class="form__input" value="회원탈퇴하기" style="background-color: #FF5151; font-size:13pt; color:#ffffff;" onclick="checkEmail('<%=cp%>');">    
	                                 </div>
                             	</form>
               					<br/>
                			</div>
                		</div>
                	</div>
                </div>
            </div>
<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>