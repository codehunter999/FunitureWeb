<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String locationRoot = request.getContextPath();
%>
    <li class="mainmenu__item menu-item-has-children">
        <a href="#" class="mainmenu__link">
            <span class="mm-text">지점안내</span>
        </a>
        <ul class="megamenu">
            <li>
                <a class="megamenu-title" href="#">
                    <span class="mm-text">서울</span>
                </a>
                <ul>
                    <li>
                        <a href="<%=locationRoot%>/blog.fu?location=Gangnam">
                            <span class="mm-text">강남</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=locationRoot%>/blog.fu?location=Hongdae">
                            <span class="mm-text">홍대</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=locationRoot%>/blog.fu?location=MogDong">
                            <span class="mm-text">목동</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a class="megamenu-title" href="#">
                    <span class="mm-text">경기도</span>
                </a>
                <ul>
                    <li>
                        <a href="<%=locationRoot%>/blog.fu?location=Hanam">
                            <span class="mm-text">하남</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=locationRoot%>/blog.fu?location=BunDang">
                            <span class="mm-text">분당</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=locationRoot%>/blog.fu?location=Dongtan">
                            <span class="mm-text">동탄</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=locationRoot%>/blog.fu?location=Anyang">
                            <span class="mm-text">안양</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=locationRoot%>/blog.fu?location=Pyeongtaek">
                            <span class="mm-text">평택</span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </li>