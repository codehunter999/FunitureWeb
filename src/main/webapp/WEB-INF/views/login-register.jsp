<%@include file="/WEB-INF/views/header/fu_header.jsp" %>

        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="<%=cp %>/resources/assets/img/bg/page_title_bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">Login &amp; Register</h1>
                        <ul class="breadcrumb">
                            <li><a href="index.html">Home</a></li>
                            <li class="current"><span>Login &amp; Register</span></li>
                        </ul>
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
                        <div class="col-md-6 mb-sm--50">
                            <div class="login-box">
                                <h3 class="heading__tertiary mb--30">Login</h3>
                                <form class="form form--login">
                                    <div class="form__group mb--20">
                                        <label class="form__label" for="username_email">Username or email address <span class="required">*</span></label>
                                        <input type="text" class="form__input" id="username_email" name="username_email">
                                    </div>
                                    <div class="form__group mb--20">
                                       <label class="form__label" for="login_password">Password <span class="required">*</span></label>
                                        <input type="password" class="form__input" id="login_password" name="login_password">
                                    </div>
                                    <div class="d-flex align-items-center mb--20">
                                        <div class="form__group mr--30">
                                            <input type="submit" value="Log in" class="btn btn-size-sm">
                                        </div>
                                        <div class="form__group">
                                            <label class="form__label checkbox-label" for="store_session">
                                                <input type="checkbox" name="store_session" id="store_session">
                                                <span>Remember me</span>
                                            </label>
                                        </div>
                                    </div>
                                    <a class="forgot-pass" href="#">Lost your password?</a>
                                </form>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="register-box">
                                <h4 class="heading__tertiary mb--30">Register</h4>
                                <form class="form form--login">
                                    <div class="form__group mb--20">
                                        <label class="form__label" for="email">Email address <span class="required">*</span></label>
                                        <input type="email" class="form__input" id="email" name="email">
                                    </div>
                                    <div class="form__group mb--20">
                                       <label class="form__label" for="register_password">Password <span class="required">*</span></label>
                                        <input type="password" class="form__input" id="register_password" name="register_password">
                                    </div>
                                    <p class="privacy-text mb--20">Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our privacy policy.</p>
                                    <div class="form__group">
                                        <input type="submit" value="Register" class="btn btn-size-sm">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Content Wrapper Start -->

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>