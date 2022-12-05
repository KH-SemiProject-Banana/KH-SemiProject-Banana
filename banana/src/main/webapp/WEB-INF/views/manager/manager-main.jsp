<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="memberList" value="${map.memberList}"/>
<c:set var="allMemberCount" value="${map.allMemberCount}"/>
<c:set var="listCount" value="${map.listCount}"/>

<c:set var="sURL" value="sort=${param.sort}&key=${param.key}&query=${param.query}&isBlock=${param.isBlock}&isDelete=${param.isDelete}&calanderBefore=${param.calanderBefore}&calanderAfter=${param.calanderAfter}"/>



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
            
            <jsp:include page="/WEB-INF/views/common/header.jsp"/>

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


                <form id="frmSearchBase" method="get" class="member-search" action="/manager/memberSearch">
                    <input type="hidden" name="sort" id="order1" value="M.MEMBER_NO ASC">
                    <p class="search__title">회원 검색</p>
                    <div class="search-detail-box form-inline">
                        <div class="search-detail-div">
                            <div class="search-detail-keyword">검색어</div>
                            <div class="search-detail-select-box">
                                <select name="key" id="key" class="form-control">


                                <c:if test="${param.key == 'email'}">
                                    <c:set var="emailChk" value="selected"></c:set>
                                </c:if>

                                <c:if test="${param.key == 'nickname'}">
                                    <c:set var="nicknameChk" value="selected"></c:set>
                                </c:if>
                                    
                                <option value="email" ${emailChk} >이메일</option>
                                <option value="nickname" ${nicknameChk}>닉네임</option>
                                        
                                        
                                </select>
                                    <input type="text" name="query" class="form-control" value="${param.query}">
                            </div>
                        </div>

                        <div  class="search-detail-div">
                            <div class="search-detail-keyword">차단여부</div>
                            <div>

                                <c:set var="allBlockChk" value="checked"/>
                                <c:if test="${param.isBlock == 'notBlock'}">
                                    <c:set var="notBlockChk" value="checked"></c:set>
                                    <c:set var="allBlockChk" value=""/>
                                </c:if>

                                <c:if test="${param.isBlock == 'yesBlock'}">
                                    <c:set var="yesBlockChk" value="checked"></c:set>
                                    <c:set var="allBlockChk" value=""/>
                                </c:if>

                                <label class="radio-inline">
                                    <input type="radio" name="isBlock" value="allBlock" ${allBlockChk}>전체
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="isBlock" value="notBlock" ${notBlockChk}>활동중
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="isBlock" value="yesBlock" ${yesBlockChk}>차단중
                                </label>
                            </div>
                        </div>

                                <c:set var="allDeleteChk" value="checked"/>
                                <c:if test="${param.isDelete == 'notDelete'}">
                                    <c:set var="notDeleteChk" value="checked"></c:set>
                                    <c:set var="allDeleteChk" value=""/>
                                </c:if>

                                <c:if test="${param.isDelete == 'yesDelete'}">
                                    <c:set var="yesDeleteChk" value="checked"></c:set>
                                    <c:set var="allDeleteChk" value=""/>
                                </c:if>

                        <div  class="search-detail-div">
                            <div class="search-detail-keyword">탈퇴여부</div>
                            <div>
                                <label class="radio-inline">
                                    <input type="radio" name="isDelete" value="allDelete" ${allDeleteChk}>전체
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="isDelete" value="notDelete" ${notDeleteChk}>활동중
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="isDelete" value="yesDelete" ${yesDeleteChk}>탈퇴
                                </label>
                            </div>
                        </div>
                        
                        <div class="search-detail-div">
                            <div class="search-detail-keyword">회원가입일</div>
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

                    <c:set var="order1" value="checked"/>
                    <c:if test="${param.sort == '2'}">
                        <c:set var="order2" value="checked"></c:set>
                        <c:set var="order1" value=""/>
                    </c:if>
                    <c:if test="${param.sort == '3'}">
                        <c:set var="order3" value="checked"></c:set>
                        <c:set var="order1" value=""/>
                    </c:if>
                    <c:if test="${param.sort == '4'}">
                        <c:set var="order4" value="checked"></c:set>
                        <c:set var="order1" value=""/>
                    </c:if>

                    


                    <select onchange="orderBy()" id="orderBy">
                        <option value="order1" ${order1}>가입일순</option>
                        <option value="order2" ${order2}>가입일 역순</option>
                        <option value="order3" ${order3}>판매순</option>
                        <option value="order4" ${order4}>구매순</option>
                    </select>
                </div>

                <div class="pull-left">
                    검색
                    <strong>${listCount}</strong>
                    명 / 전체
                    <strong>${allMemberCount}</strong>
                    명
                </div>

                
                
                <div class="search-result-area">
                    <div class="search-result-div" id="number">
                        <div class="search-result-tab">번호</div>
                        <c:forEach var="member" items="${memberList}">
                            <div class="search-content">${member.memberNo}</div>
                        </c:forEach>
                    </div>
                    <div class="search-result-div"  id="email">
                        <div class="search-result-tab">이메일</div>
                        <c:forEach var="member" items="${memberList}">
                            <div class="search-content">${member.memberEmail}</div>
                        </c:forEach>
                    </div>
                    <div class="search-result-div" id="nickname">
                        <div class="search-result-tab">닉네임</div>
                        <c:forEach var="member" items="${memberList}">
                            <div class="search-content">${member.memberNickname}</div>
                        </c:forEach>
                    </div>
                    <div class="search-result-div" id="pay">
                        <div class="search-result-tab">바나나페이</div>
                        <c:forEach var="member" items="${memberList}">
                            <div class="search-content">${member.remainPay}원</div>
                        </c:forEach>
                    </div>
                    <div class="search-result-div" id="sellNo">
                        <div class="search-result-tab">판매</div>
                        <c:forEach var="member" items="${memberList}">
                            <div class="search-content">${member.sellCount}건</div>
                        </c:forEach>
                    </div>
                    <div class="search-result-div" id="buyNo">
                        <div class="search-result-tab">구매</div>
                        <c:forEach var="member" items="${memberList}">
                            <div class="search-content">${member.buyCount}건</div>
                        </c:forEach>
                    </div>
                    <div class="search-result-div" id="signDate">
                        <div class="search-result-tab">회원 가입일</div>
                        <c:forEach var="member" items="${memberList}">
                            <div class="search-content">${member.enrollDate}</div>
                        </c:forEach>
                    </div>
                    <div class="search-result-div" id="boardBlock">
                        <div class="search-result-tab">게시글차단</div>
                        <c:forEach var="member" items="${memberList}">
                            <div class="search-content">${member.boardBlockCount}건</div>
                        </c:forEach>
                    </div>
                    <div class="search-result-div" id="userBlock">
                        <div class="search-result-tab">유저차단</div>
                        <c:forEach var="member" items="${memberList}">
                            <div class="search-content">${member.userBlockCount}건</div>
                        </c:forEach>
                    </div>
                    <div class="search-result-div" id="blockFlag">
                        <div class="search-result-tab">차단여부</div>
                        <c:forEach var="member" items="${memberList}">
                            <c:if test="${member.blockFlag == 'Y'}">
                                <div class="search-content">차단</div>
                            </c:if>
                            <c:if test="${member.blockFlag == 'N'}">
                                <div class="search-content">활동중</div>
                            </c:if>
                        </c:forEach>
                        
                    </div>
                    <div class="search-result-div" id="delFlag">
                        <div class="search-result-tab">탈퇴여부</div>
                        <c:forEach var="member" items="${memberList}">
                            <c:if test="${member.memberDeleteFlag == 'N'}">
                                <div class="search-content">활동중</div>
                            </c:if>
                            <c:if test="${member.memberDeleteFlag == 'Y'}">
                                <div class="search-content">탈퇴</div>
                            </c:if>
                        </c:forEach>

                    </div>
                    <div class="search-result-div"id="changeData">
                        <div class="search-result-tab" >정보수정</div>
                        <c:forEach var="member" items="${memberList}">
                            <div class="search-content">
                                <button type="button" class="btn btn-white btn-sm btnModify" id="${member.memberNo}">수정</button>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="search-result-div"id="deleteData">
                        <div class="search-result-tab" >정보삭제</div>
                        <c:forEach var="member" items="${memberList}">
                            <div class="search-content">
                                <button type="button" class="btn btn-white btn-sm btnDel">삭제</button>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                
                
                <div class="pagination-area">


                    <ul class="pagination">
                    
                        <!-- 첫 페이지로 이동( <<) -->
                        <li><a href="/manager/memberSearch?${sURL}">&lt;&lt;</a></li>

                        <!-- 이전 목록 마지막 번호로 이동 ( < ) -->
                        <li><a href="/manager/memberSearch?cp=${pagination.prevPage}&${sURL}">&lt;</a></li>

                        
                        <!-- 특정 페이지로 이동 -->
                        <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                            <c:choose>
                                <c:when test="${i == pagination.currentPage}">
                                    <%-- 현재 보고있는 페이지 --%>
                                    <li><a class="current">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <%-- 현재 페이지를 제외한 나머지 --%>
                                    <li><a href="/manager/memberSearch?cp=${i}&${sURL}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        
                        <!-- 다음 목록 시작 번호로 이동 ( > )-->
                        <li><a href="/manager/memberSearch?cp=${pagination.nextPage}&${sURL}">&gt;</a></li>

                        <!-- 끝 페이지로 이동 ( >> ) -->
                        <li><a href="/manager/memberSearch?cp=${pagination.maxPage}&${sURL}">&gt;&gt;</a></li>

                    </ul>
                </div>



                <%-- <div class="center">
                    <nav>
                        <ul class="pagination pagination-sm">
                            <li class="active">
                                <span>1</span>
                            </li>
                        </ul>
                    </nav>
                </div> --%>
            </section>
            
        </main>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        <script src="/resources/js/manager/manager-main.js"></script>
    </body>
</html>