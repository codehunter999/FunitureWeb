<%@include file="/WEB-INF/views/header/fu_header.jsp" %>

        <!-- Main Wrapper Start -->
        <main class="main-content-wrapper">
            <div class="error-area pt--90 pt-xl--70 pb--120 pb-xl--100 pb-lg--95 pb-sm--90">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-7 col-lg-8 text-center">
                            <div class="error">
                                <h1>500</h1>
                                <h2>OPPS! ERROR CODE</h2>
                                <p>This page is not secure. Please enter valid data</p>
                                <a href="<%=cp%>/home.fu" class="btn">Back to home page</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!-- Main Wrapper End -->

<%@include file="/WEB-INF/views/footer/fu_footer.jsp"%>