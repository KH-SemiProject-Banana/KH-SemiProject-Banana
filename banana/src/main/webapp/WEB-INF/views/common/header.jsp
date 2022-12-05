<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



        <header>
            <section class="section-topmenu">
                <div>
                    <%-- <a href="/board/1" class="fa-regular fa-file-lines boardListLink"> 게시판</a> --%>
                </div>
                
                <div class="talkAndlogin">
                    <a href="/chatting" class="topmenu__talk fa-regular fa-comment">바나나톡</a>
                    
                    <div id="header-top-menu">
                    <c:choose>
                        <%-- 로그인 X 경우 --%> 
                        <c:when test="${empty sessionScope.loginMember}">
                            <a href="/member/login" class="topmenu__login">로그인/회원가입</a>
                        </c:when>
                        <%-- 로그인 O인 경우 --%>
                        <c:otherwise>
                            <label for="header-menu-toggle">
                                <div class="profileImgArea">
                                    <c:if test="${empty loginMember.profileImage}">
                                        <img src="/resources/images/banana-logo.png"  id="profileImg">
                                    </c:if>
                                    <c:if test="${not empty loginMember.profileImage}">
                                        <img src="${loginMember.profileImage}" id="profileImg">
                                    </c:if>
                                </div>
                                ${loginMember.memberNickname}
                                <i class="fa-solid fa-caret-down"></i>
                                <div>
                                    <input type="checkbox" id="header-menu-toggle">

                                    <div id="header-menu">
                                        <a href="/member/myPage/main">내 정보</a>
                                        <a href="/member/logout">로그아웃</a>
                                    </div>
                                </div>
                            </label>

                        </c:otherwise>
                    </c:choose>
                </div>

            </section>
            <section class="section-query">
                <div class="query__area">
                    <a href="/">
                        <img src="/resources/images/banana-logo.png" id="logo-img"/>
                    </a>
                    <div class="query__logo">
                        <p>바꾸고 나누자 나랑</p>
                        <p id="query__banana">Banana Market</p>
                    </div>
                </div>
                
                <article class="search-area">
            
                    <!-- form : 내부 input태그의 값을 서버 또는 페이지로 전달(제출) -->
                    <form action="/category" id="searchFrm">
                        <fieldset>
                            <input type="search" id="query" name="query" placeholder="검색어를 입력해주세요">
                            <button type="submit" id="search-btn" class="fa-solid fa-magnifying-glass">
                            </button>
                        </fieldset>
                    </form>
                </article>
                <a href="/goods/registerGoods" class="sellingMy" id=sellingMy>
                    <div>내 물건<br>판매하기</div>
                </a>
            </section>
        </header>

        <script src="/resources/js/현진/search.js"></script>