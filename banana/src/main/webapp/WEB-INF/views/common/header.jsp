<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



        <header>
            <section class="section-topmenu">
                <a href="#" class="topmenu__talk fa-regular fa-comment">바나나톡</a>
                
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
                                <img src="images/banana-logo.png"  id="profileImg">
                            </div>
                            ${loginMember.memberNickname}
                            <i class="fa-solid fa-caret-down"></i>
                            <div>
                                <input type="checkbox" id="header-menu-toggle">

                                <div id="header-menu">
                                    <a href="#">내 정보</a>
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
                        <img src="images/banana-logo.png" id="logo-img"/>
                    </a>
                    <div class="query__logo">
                        <p>바꾸고 나누자 나랑</p>
                        <p id="query__banana">Banana Market</p>
                    </div>
                </div>
                
                <article class="search-area">
            
                    <!-- form : 내부 input태그의 값을 서버 또는 페이지로 전달(제출) -->
                    <form action="#">
                        <fieldset>
                            <input type="search" id="query" name="query" placeholder="검색어를 입력해주세요">
                            <button type="submit" id="search-btn" class="fa-solid fa-magnifying-glass">
                            </button>
                        </fieldset>
                    </form>
                </article>
                <div class="sellingMy">
                    <div>내 물건<br>판매하기</div>
                </div>
            </section>
            
        </header>

        <nav>
            
            <ul>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-heart"></i>
                            <p>인기매물</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-computer"></i>
                            <p>전자기기</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-couch"></i>
                            <p>가구/인테리어</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-kitchen-set"></i>
                            <p>생활/주방</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-baby"></i>
                            <p>유아용품</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-shirt"></i>
                            <p>의류/잡화</p>
                        </div>
                    </a></li>
            
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-wand-magic-sparkles"></i>
                            <p>뷰티/미용</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-icons"></i>
                            <p>취미/게임/음반</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-book"></i>
                            <p> 티켓/도서</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-dog"></i>
                            <p>반려동물용품</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-brands fa-stack-overflow"></i>
                            <p>기타중고물품</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-hand-holding"></i>
                            <p>삽니다</p>
                        </div>
                    </a></li>
            </ul>
        </nav>
