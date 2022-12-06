<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="goodsList" value="${map.goodsList}"/>
<c:set var="allGoodsCount" value="${map.allGoodsCount}"/>
<c:set var="listCount" value="${map.listCount}"/>

<c:set var="sURL" value="sort=${param.sort}&key=${param.key}&query=${param.query}&isSell=${param.isSell}&calanderBefore=${param.calanderBefore}&calanderAfter=${param.calanderAfter}"/>




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

    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/manager/manager.css">
    <link rel="stylesheet" href="/resources/css/manager/manager-goods.css">

    </head>
    <body>
        <main>
            
            <jsp:include page="/WEB-INF/views/common/header.jsp"/>

            <section class="category-lists">
            <a href = "/manager/main" class="detail link-member">회원</a>
            <a href = "/manager/goods" class="detail link-product activate">상품</a>
            <a href = "/manager/board" class="detail link-board">게시판</a>
            </section>

            
            <section class="main-class">
                <div class="member-title">
                    <h3>상품 거래 리스트</h3>
                    <%-- <button>+ 거래글 등록</button> --%>
                </div>

                <form id="frmSearchBase" method="get" class="member-search" action="/manager/goodsSearch">
                    <input type="hidden" name="sort" id="orderInput">
                    <p class="search__title">거래글 검색</p>
                    <div class="search-detail-box form-inline">
                        <div class="search-detail-div">
                            <div class="search-detail-keyword">검색어</div>

                            <div class="search-detail-select-box">
                                <select name="key" id="key" class="form-control">

                                <c:if test="${param.key == 'title'}">
                                    <c:set var="titleChk" value="selected"></c:set>
                                </c:if>

                                <c:if test="${param.key == 'category'}">
                                    <c:set var="categoryChk" value="selected"></c:set>
                                </c:if>

                                <c:if test="${param.key == 'sellerNickname'}">
                                    <c:set var="nicknameChk" value="selected"></c:set>
                                </c:if>


                                    <option value="title" ${titleChk}>제목</option>
                                    <option value="category" ${categoryChk}>카테고리</option>
                                    <option value="sellerNickname" ${nicknameChk}>판매자(닉네임)</option>
                                </select>
                                <input type="text" name="query" class="form-control" value="${param.query}">
                            </div>
                            
                        </div>
                        <div  class="search-detail-div">
                            <div class="search-detail-keyword">판매여부</div>
                            <div>

                                <c:set var="allSellChk" value="checked"/>
                                <c:if test="${param.isSell == 'noSell'}">
                                    <c:set var="noSellChk" value="checked"></c:set>
                                    <c:set var="allSellChk" value=""/>
                                </c:if>

                                <c:if test="${param.isSell == 'yesSell'}">
                                    <c:set var="yesSellChk" value="checked"></c:set>
                                    <c:set var="allSellChk" value=""/>
                                </c:if>

                                <label class="radio-inline">
                                    <input type="radio" name="isSell" value="allSell" ${allSellChk}>전체
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="isSell" value="yesSell" ${yesSellChk}>판매중
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="isSell" value="noSell" ${noSellChk}>판매완료
                                </label>
                            </div>
                        </div>
                        <div class="search-detail-div">
                            <div class="search-detail-keyword">게시글작성일</div>
                            <div>
                                <div class="input-group js-datepicker">
                                    <input type="date" id="btn-icon-calander" name="calanderBefore" value="${param.calanderBefore}">
                                </div>
                                ~
                                <div class="input-group js-datepicker">
                                    <input type="date" id="btn-icon-calander" name="calanderAfter" value="${param.calanderAfter}">
                            </div>
                        
                            </div>
                        </div>

                    </div>

                    <div class="table-btn">
                        <input type="submit" value="검색" class="btn btn-lg btn-black js-search-button">
                    </div>
                </form>
                
                <div class="selectBox">

                    <c:set var="order1" value="selected"/>
                    <c:if test="${param.sort == '2'}">
                        <c:set var="order2" value="selected"></c:set>
                        <c:set var="order1" value=""/>
                    </c:if>
                    <c:if test="${param.sort == '3'}">
                        <c:set var="order3" value="selected"></c:set>
                        <c:set var="order1" value=""/>
                    </c:if>
                    <c:if test="${param.sort == '4'}">
                        <c:set var="order4" value="selected"></c:set>
                        <c:set var="order1" value=""/>
                    </c:if> 

                    


                    <select onchange="orderBy()" id="order">
                        <option value="order1" ${order1}>가입일순</option>
                        <option value="order2" ${order2}>가입일 역순</option>
                        <option value="order3" ${order3}>금액 낮은순</option>
                        <option value="order4" ${order4}>금액 높은순</option>
                    </select>
                </div>


                <div class="pull-left">
                    검색
                    <strong>${listCount}</strong>
                    명 / 전체
                    <strong>${allGoodsCount}</strong>
                    명
                </div>


                <div class="search-result-area">
                    <div class="search-result-div" id="goodsNumber">
                        <div class="search-result-tab">번호</div>
                        <c:forEach var="goods" items="${goodsList}">
                            <div class="search-content">${goods.goodsNo}</div>
                        </c:forEach>
                    </div>

                    <div class="search-result-div" id="category">
                        <div class="search-result-tab">카테고리</div>
                        <c:forEach var="goods" items="${goodsList}">
                            <c:choose>
                                <c:when test="${goods.categoryNo == 1}">
                                    <div class="search-content">전자기기</div>
                                </c:when>
                                <c:when test="${goods.categoryNo == 2}">
                                    <div class="search-content">가구/인테리어</div>
                                </c:when>
                                <c:when test="${goods.categoryNo == 3}">
                                    <div class="search-content">생활/주방</div>
                                </c:when>
                                <c:when test="${goods.categoryNo == 4}">
                                    <div class="search-content">유아용품</div>
                                </c:when>
                                <c:when test="${goods.categoryNo == 5}">
                                    <div class="search-content">의류/잡화</div>
                                </c:when>
                                <c:when test="${goods.categoryNo == 6}">
                                    <div class="search-content">뷰티/미용</div>
                                </c:when>
                                <c:when test="${goods.categoryNo == 7}">
                                    <div class="search-content">취미/게임/음반</div>
                                </c:when>
                                <c:when test="${goods.categoryNo == 8}">
                                    <div class="search-content">티켓/도서</div>
                                </c:when>
                                <c:when test="${goods.categoryNo == 9}">
                                    <div class="search-content">반려동물용품</div>
                                </c:when>
                                <c:when test="${goods.categoryNo == 10}">
                                    <div class="search-content">기타중고물품</div>
                                </c:when>
                                <c:when test="${goods.categoryNo == 11}">
                                    <div class="search-content">삽니다</div>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </div>

                    <div class="search-result-div" id="title">
                        <div class="search-result-tab">제목</div>
                        <c:forEach var="goods" items="${goodsList}">
                            <c:if test="${fn:length(goods.title) > 10}">
                                <div class="search-content">${fn:substring(goods.title, 0, 10)}...</div>
                            </c:if>
                            <c:if test="${fn:length(goods.title) <= 10}">
                                <div class="search-content">${goods.title}</div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="search-result-div" id="sellStatus">
                        <div class="search-result-tab">판매상태</div>
                        <c:forEach var="goods" items="${goodsList}">
                            <c:if test="${goods.sellStatus == 'Y'}">
                                <div class="search-content">판매중</div>
                            </c:if>
                            <c:if test="${goods.sellStatus == 'N'}">
                                <div class="search-content">판매완료</div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="search-result-div" id="seller">
                        <div class="search-result-tab">판매자</div>
                        <c:forEach var="goods" items="${goodsList}">
                            <div class="search-content">${goods.sellerNickname}</div>
                        </c:forEach>
                    </div>

                    <div class="search-result-div" id="buyer">
                        <div class="search-result-tab">금액(원)</div>
                        <c:forEach var="goods" items="${goodsList}">
                            <div class="search-content">
                                <fmt:formatNumber value="${goods.sellPrice}" type="number"/>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="search-result-div" id="enrollDate">
                        <div class="search-result-tab">등록(끌올)시간</div>
                        <c:forEach var="goods" items="${goodsList}">
                            <div class="search-content">${goods.createdAt}</div>
                        </c:forEach>
                    </div>

                    <div class="search-result-div" id="goodsDelFlag">
                        <div class="search-result-tab">상품 삭제 여부</div>
                        <c:forEach var="goods" items="${goodsList}">
                            <c:if test="${goods.goodsDelFlag == 'Y'}">
                                <div class="search-content disabled">삭제된 상품</div>
                            </c:if>
                            <c:if test="${goods.goodsDelFlag == 'N'}">
                                <div class="search-content">유효한 상품</div>
                            </c:if>
                        </c:forEach>
                    </div>



                    <%-- <div class="search-result-div" id="changeBoard">
                        <div class="search-result-tab">글 수정</div>
                        <c:forEach var="goods" items="${goodsList}">
                            <div class="search-content">
                                <button type="button" class="btn btn-white btn-sm btnModify" 
                                id="${goods.goodsNo}">수정</button>
                            </div>
                        </c:forEach>
                    </div> --%>

                    <div class="search-result-div" id="deleteBoard">
                        <div class="search-result-tab">글 삭제</div>
                        <c:forEach var="goods" items="${goodsList}">
                            <div class="search-content">
                                <c:if test="${goods.goodsDelFlag == 'Y'}">
                                    <button type="button" class="btn btn-white btn-sm btnDelBack disabled"
                                    id="${goods.goodsNo}">삭제취소</button>
                                </c:if>
                                <c:if test="${goods.goodsDelFlag == 'N'}">
                                    <button type="button" class="btn btn-white btn-sm btnDel"
                                    id="${goods.goodsNo}">삭제</button>
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="pagination-area">


                    <ul class="pagination">
                    
                        <!-- 첫 페이지로 이동( <<) -->
                        <li><a href="/manager/goodsSearch?${sURL}">&lt;&lt;</a></li>

                        <!-- 이전 목록 마지막 번호로 이동 ( < ) -->
                        <li><a href="/manager/goodsSearch?cp=${pagination.prevPage}&${sURL}">&lt;</a></li>

                        
                        <!-- 특정 페이지로 이동 -->
                        <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                            <c:choose>
                                <c:when test="${i == pagination.currentPage}">
                                    <%-- 현재 보고있는 페이지 --%>
                                    <li><a class="current">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <%-- 현재 페이지를 제외한 나머지 --%>
                                    <li><a href="/manager/goodsSearch?cp=${i}&${sURL}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        
                        <!-- 다음 목록 시작 번호로 이동 ( > )-->
                        <li><a href="/manager/goodsSearch?cp=${pagination.nextPage}&${sURL}">&gt;</a></li>

                        <!-- 끝 페이지로 이동 ( >> ) -->
                        <li><a href="/manager/goodsSearch?cp=${pagination.maxPage}&${sURL}">&gt;&gt;</a></li>

                    </ul>
                </div>
                
            </section>
        </main>
        
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
                <!-- jQuery CDN 방식으로 추가-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="/resources/js/manager/manager-goods.js"></script>

    </body>
</html>