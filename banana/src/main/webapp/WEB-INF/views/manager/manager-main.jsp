<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon"  sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
        <title>바꾸고 나누자 나랑: 바나나 마켓</title>

        <%--폰트 어썸  https://fontawesome.com/ key --%>
        <script src="https://kit.fontawesome.com/f7459b8054.js"crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/1023652dd4.js" crossorigin="anonymous"></script>

        <%-- <script type="text/javascript" src="/resources/js/manager.js"></script> --%>

        <link rel="stylesheet" href="/resources/css/style.css">
        <link rel="stylesheet" href="/resources/css/manager/manager.css">

    </head>
    <body>
        <main>
            <!-- header 시작----------------------------------------------------------------------------------------- -->
            <header>
                <section class="section-topmenu">
                    <div>
                        <a href="/board/1" class="fa-regular fa-file-lines boardListLink"> 게시판</a>
                    </div>
                    <div class="talkAndlogin">
                        <a href="/member/bananaTalk" class="topmenu__talk fa-regular fa-comment">바나나톡</a>
                        
                        <div id="header-top-menu">
                        <c:choose>
                            <%-- 로그인 X 경우 --%>
                            <c:when test="${empty sessionScope.loginManager}">
                                <a href="/member/login" class="topmenu__login">로그인/회원가입</a>
                            </c:when>
                            <%-- 로그인 O인 경우 --%>
                            <c:otherwise>
                                <label for="header-menu-toggle">
                                    <div class="profileImgArea">
                                        <c:if test="${empty loginManager.profileImage}">
                                            <img src="/resources/images/banana-logo.png"  id="profileImg">
                                        </c:if>
                                        <c:if test="${not empty loginManager.profileImage}">
                                            <img src="${loginManager.profileImage}" id="profileImg">
                                        </c:if>

                                    </div>
                                    ${loginManager.memberNickname}
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
                        <form action="#">
                            <fieldset>
                                <input type="search" id="query" name="query" placeholder="검색어를 입력해주세요">
                                <button type="submit" id="search-btn" class="fa-solid fa-magnifying-glass">
                                </button>
                            </fieldset>
                        </form>
                    </article>
                    <a href="/goods/registerGoods" class="sellingMy">
                        <div>내 물건<br>판매하기</div>
                    </a>
                </section>
            </header>
            <!-- header 끝----------------------------------------------------------------------------------------- -->

            <section class="category-lists">
                <a href = "/manager/main" class="detail link-member activate">회원</a>
                <a href = "javascript:Getshow()" class="detail link-basic">기본설정</a>
                <a href = "/manager/goods" class="detail link-product">상품</a>
                <a href = "/manager/board" class="detail link-board">게시판</a>
                <a href = "javascript:Getshow()" class="detail link-service">service</a>
            </section>

            <section class="main-class">
                <div class="member-title">
                    <h3>회원 리스트</h3>
                    <button>+ 회원 등록</button>
                </div>

                <form id="frmSearchBase" method="get" class="member-search">
                    <input type="hidden" name="sort" value="entryDt asc">
                    <input type="hidden" name="sort" value="entryDt asc">
                    <input type="hidden" name="sort" value="entryDt asc">
                    <p class="search__title">회원 검색</p>
                    <div class="search-detail-box form-inline">
                        <div class="search-detail-div">
                            <div class="search-detail-keyword">검색어</div>
                            <div class="search-detail-select-box">
                                <select name="key" id="key" class="form-control">
                                    <option value="email">이메일</option>
                                    <option value="nickNm">닉네임</option>
                                    <option value="cellphone">휴대폰번호</option>
                                </select>
                                <input type="text" name="keyword" value class="form-control">
                            </div>
                        </div>

                        <div  class="search-detail-div">
                            <div class="search-detail-keyword">차단여부</div>
                            <div>
                                <label class="radio-inline">
                                    <input type="radio" name="isBlock" value="blockAll"  checked>전체
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="isBlock" value="notBlock">활동중
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="isBlock" value="yesBlock">차단중
                                </label>
                            </div>
                        </div>

                        <div  class="search-detail-div">
                            <div class="search-detail-keyword">탈퇴여부</div>
                            <div>
                                <label class="radio-inline">
                                    <input type="radio" name="isDelete" value="deleteAll"  checked>전체
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="isDelete" value="notDelete">활동중
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="isDelete" value="yesDelete">탈퇴
                                </label>
                            </div>
                        </div>
                        
                        <div class="search-detail-div">
                            <div class="search-detail-keyword">회원가입일</div>
                            <div>
                                <div class="input-group js-datepicker">
                                    <input type="date" id="btn-icon-calander" name="calander">
                                </div>
                                ~
                                <div class="input-group js-datepicker">
                                    <input type="date" id="btn-icon-calander" name="calander">
                            </div>
                        
                            </div>
                        </div>

                    </div>
                    <div class="table-btn">
                        <input type="submit" value="검색" class="btn btn-lg btn-black js-search-button">
                    </div>
                </form>

                <div class="pull-left">
                    검색
                    <strong>0</strong>
                    명 / 전체
                    <strong>6</strong>
                    명
                </div>
                <div class="search-result-area">
                    <div class="search-result-div" id="number">
                        <div class="search-result-tab">번호</div>
                        <div class="search-content">2</div>
                        <div  class="search-content">1</div>
                    </div>
                    <div class="search-result-div"  id="email">
                        <div class="search-result-tab">이메일</div>
                        <div class="search-content">ekdnjs113@naver.com</div>
                        <div class="search-content">dlapdlfdlek@gmail.com</div>
                    </div>
                    <div class="search-result-div" id="nickname">
                        <div class="search-result-tab">닉네임</div>
                        <div class="search-content">내용</div>
                        <div class="search-content">내용</div>
                    </div>
                    <div class="search-result-div" id="pay">
                        <div class="search-result-tab">바나나페이</div>
                        <div class="search-content">0원</div>
                        <div class="search-content">0원</div>
                    </div>
                    <div class="search-result-div" id="sellNo">
                        <div class="search-result-tab">판매</div>
                        <div class="search-content">0건</div>
                        <div class="search-content">0건</div>
                    </div>
                    <div class="search-result-div" id="buyNo">
                        <div class="search-result-tab">구매</div>
                        <div class="search-content">0건</div>
                        <div class="search-content">0건</div>
                    </div>
                    <div class="search-result-div" id="delFlag">
                        <div class="search-result-tab">탈퇴여부</div>
                        <div class="search-content">활동중</div>
                        <div class="search-content">탈퇴</div>
                    </div>
                    <div class="search-result-div" id="blockFlag">
                        <div class="search-result-tab">차단여부</div>
                        <div class="search-content">차단</div>
                        <div class="search-content">활동중</div>
                    </div>
                    <div class="search-result-div"id="changeData">
                        <div class="search-result-tab" >정보수정</div>
                        <div class="search-content">
                            <button type="button" class="btn btn-white btn-sm btnModify">수정</button>
                        </div>
                        <div class="search-content">
                            <button type="button" class="btn btn-white btn-sm btnModify">수정</button>
                        </div>
                    </div>

                    <div class="search-result-div"id="deleteData">
                        <div class="search-result-tab" >정보삭제</div>
                        <div class="search-content">
                            <button type="button" class="btn btn-white btn-sm btnDel">삭제</button>
                        </div>
                        <div class="search-content">
                            <button type="button" class="btn btn-white btn-sm btnDel">삭제</button>
                        </div>
                    </div>
                </div>

                <div class="center">
                    <nav>
                        <ul class="pagination pagination-sm">
                            <li class="active">
                                <span>1</span>
                            </li>
                        </ul>
                    </nav>
                </div>
            </section>
            
        </main>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    </body>
</html>