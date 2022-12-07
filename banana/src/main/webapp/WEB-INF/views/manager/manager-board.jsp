<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="boardList" value="${map.boardList}"/>
<c:set var="allBoardCount" value="${map.allBoardCount}"/>
<c:set var="listCount" value="${map.listCount}"/>

<%-- <c:set var="sURL" value="sort=${param.sort}&key=${param.key}&query=${param.query}&isBlock=${param.isBlock}&isDelete=${param.isDelete}&calanderBefore=${param.calanderBefore}&calanderAfter=${param.calanderAfter}"/> --%>


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

    </head>
    <body>
        <main>

            <jsp:include page="/WEB-INF/views/common/header.jsp"/>
            
            <section class="category-lists">
                <a href = "/manager/main" class="detail link-member ">회원</a>
                <a href = "/manager/goods" class="detail link-product">상품</a>
                <a href = "/manager/board" class="detail link-board activate">게시판</a>

            </section>
            
            <section class="main-class">
                <div class="member-title">
                    <h3>게시판</h3>
                </div>

                <form id="frmSearchBase" method="get" class="member-search" action="/manager/boardSearch">
                    <input type="hidden" name="sort" id="orderInput">
                    <p class="search__title">게시글 검색</p>
                    <div class="search-detail-box form-inline">
                        <div class="search-detail-div">
                            <div class="search-detail-keyword">검색어</div>
                            <div class="search-detail-select-box">

                                <select name="key" id="key" class="form-control">
                                    <c:if test="${param.key == 'boardTitle'}">
                                        <c:set var="titleChk" value="selected"></c:set>
                                    </c:if>

                                    <c:if test="${param.key == 'memberNickname'}">
                                        <c:set var="nicknameChk" value="selected"></c:set>
                                    </c:if>

                                    <option value="boardTitle" ${titleChk}>제목</option>
                                    <option value="memberNickname" ${nicknameChk}>작성자</option>
                                </select>

                                <input type="text" name="query" value class="form-control" value="${param.query}">
                            </div>
                            
                        </div>
                        <div  class="search-detail-div">
                            <div class="search-detail-keyword">게시판</div>
                            <div>

                                <c:set var="allBoardChk" value="checked"/>
                                <c:if test="${param.boardCode == '1'}">
                                    <c:set var="board1Chk" value="checked"></c:set>
                                    <c:set var="allBoardChk" value=""/>
                                </c:if>
                                <c:if test="${param.boardCode == '2'}">
                                    <c:set var="board2Chk" value="checked"></c:set>
                                    <c:set var="allBoardChk" value=""/>
                                </c:if>
                                <c:if test="${param.boardCode == '3'}">
                                    <c:set var="board3Chk" value="checked"></c:set>
                                    <c:set var="allBoardChk" value=""/>
                                </c:if>
                                <c:if test="${param.boardCode == '4'}">
                                    <c:set var="board4Chk" value="checked"></c:set>
                                    <c:set var="allBoardChk" value=""/>
                                </c:if>

                                
                                <label class="radio-inline">
                                    <input type="radio" name="boardCode"  ${allBoardChk}>전체
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="boardCode" value="1" ${board1Chk}>자주 묻는 질문
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="boardCode" value="2" ${board2Chk}>운영정책
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="boardCode" value="3" ${board3Chk}>일반문의
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="boardCode" value="4" ${board4Chk}>공지사항
                                </label>
                            </div>
                        </div>
                        <div  class="search-detail-div">
                            <div class="search-detail-keyword">답변여부</div>
                            <div>

                                <c:set var="allAnswerChk" value="checked"/>
                                <c:if test="${param.isAnswer == 'answered'}">
                                    <c:set var="answeredChk" value="checked"></c:set>
                                    <c:set var="allAnswerChk" value=""/>
                                </c:if>
                                <c:if test="${param.isAnswer == 'notAnswered'}">
                                    <c:set var="notAnsweredChk" value="checked"></c:set>
                                    <c:set var="allAnswerChk" value=""/>
                                </c:if>



                                <label class="radio-inline">
                                    <input type="radio" name="isAnswer" value="allAnswer" ${allAnswerChk}>전체
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="isAnswer" value="answered" ${answeredChk}>답변완료
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="isAnswer" value="notAnswered" ${notAnsweredChk}>미답변
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
                        <option value="order1" ${order1}>작성일순</option>
                        <option value="order2" ${order2}>작성일 역순</option>
                        <option value="order3" ${order3}>조회수 순</option>
                        <option value="order4" ${order4}>조회수 역순</option>
                    </select>
                </div>

                <div class="pull-left">
                    검색
                    <strong>${listCount}</strong>
                    개 / 전체
                    <strong>${allBoardCount}</strong>
                    개
                </div>
                <div class="search-result-area">
                    <div class="search-result-div" id="goodsNumber">
                        <div class="search-result-tab">번호</div>
                        <c:forEach var="board" items="${boardList}">
                            <div class="search-content">${board.boardNo}</div>
                        </c:forEach>        
                    </div>

                    <div class="search-result-div" id="category">
                        <div class="search-result-tab">게시판종류</div>
                        <c:forEach var="board" items="${boardList}">
                            <c:choose>
                                <c:when test="${board.boardCode == 1}">
                                    <div class="search-content">자주 묻는 질문</div>
                                </c:when>
                                <c:when test="${board.boardCode == 2}">
                                    <div class="search-content">운영정책</div>
                                </c:when>
                                <c:when test="${board.boardCode == 3}">
                                    <div class="search-content">일반 문의</div>
                                </c:when>
                                <c:when test="${board.boardCode == 4}">
                                    <div class="search-content">공지사항</div>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </div>

                    <div class="search-result-div" id="title">
                        <div class="search-result-tab">제목</div>
                        <c:forEach var="board" items="${boardList}">
                            <c:if test="${fn:length(board.boardTitle) > 10}">
                                <c:if test="${board.boardCode == 1}">
                                    <a href="/board/${board.boardCode}">
                                        <div class="search-content">${fn:substring(board.boardTitle, 0, 10)}...</div>
                                    </a>    
                                </c:if>
                                <c:if test="${board.boardCode != 1}">
                                    <a href="/board/${board.boardCode}/${board.boardNo}">
                                        <div class="search-content">${fn:substring(board.boardTitle, 0, 10)}...</div>
                                    </a>    
                                </c:if>
                            </c:if>
                            <c:if test="${fn:length(board.boardTitle) <= 10}">
                                <c:if test="${board.boardCode == 1}">
                                    <a href="/board/${board.boardCode}">
                                        <div class="search-content">${board.boardTitle}</div>
                                    </a>    
                                </c:if>
                                <c:if test="${board.boardCode != 1}">
                                    <a href="/board/${board.boardCode}/${board.boardNo}">
                                        <div class="search-content">${board.boardTitle}</div>
                                    </a>    
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="search-result-div" id="managerComment">
                        <div class="search-result-tab">답변상태</div>
                        <c:forEach var="board" items="${boardList}">
                            <c:if test="${board.boardCode == 3 && board.managerComment == 'N' }">
                                <div class="search-content notAnswered">미답변</div>
                            </c:if>
                            <c:if test="${board.boardCode == 3 && board.managerComment == 'Y' }">
                                <div class="search-content">답변완료</div>
                            </c:if>
                            <c:if test="${board.boardCode != 3}">
                                <div class="search-content"> - </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="search-result-div" id="memberNickname">
                        <div class="search-result-tab">작성자</div>
                        <c:forEach var="board" items="${boardList}">
                            <div class="search-content">${board.memberNickname}</div>
                        </c:forEach>
                    </div>

                    <div class="search-result-div" id="viewCount">
                        <div class="search-result-tab">조회수</div>
                        <c:forEach var="board" items="${boardList}">
                            <div class="search-content">${board.viewCount}회</div>
                        </c:forEach>
                    </div>

                    <div class="search-result-div" id="commentCount">
                        <div class="search-result-tab">댓글수</div>
                        <c:forEach var="board" items="${boardList}">
                            <div class="search-content">${board.commentCount}회</div>
                        </c:forEach>
                    </div>

                    <div class="search-result-div" id="boardCreateDate">
                        <div class="search-result-tab">등록시간</div>
                        <c:forEach var="board" items="${boardList}">
                            <div class="search-content">${board.boardCreateDate}</div>
                        </c:forEach>
                    </div>

                    <div class="search-result-div" id="boardDelFlag">
                        <div class="search-result-tab">글 상태</div>
                        <c:forEach var="board" items="${boardList}">
                            <c:if test="${board.boardDelFlag == 'Y'}">
                                <div class="search-content disabled">삭제된 게시글</div>
                            </c:if>
                            <c:if test="${board.boardDelFlag == 'N'}">
                                <div class="search-content">유효한 게시글</div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="search-result-div" id="deleteBoard">
                        <div class="search-result-tab">글 삭제</div>
                        <c:forEach var="board" items="${boardList}">
                            <div class="search-content">
                                <c:if test="${board.boardDelFlag == 'Y'}">
                                    <button type="button" class="btn btn-white btn-sm btnDelBack disabled"
                                    id="${board.boardNo}">삭제취소</button>
                                </c:if>
                                <c:if test="${board.boardDelFlag == 'N'}">
                                    <button type="button" class="btn btn-white btn-sm btnDel"
                                    id="${board.boardNo}">삭제</button>
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </div>


                <div class="pagination-area">


                    <ul class="pagination">
                    
                        <!-- 첫 페이지로 이동( <<) -->
                        <li><a href="/manager/boardSearch?${sURL}">&lt;&lt;</a></li>

                        <!-- 이전 목록 마지막 번호로 이동 ( < ) -->
                        <li><a href="/manager/boardSearch?cp=${pagination.prevPage}&${sURL}">&lt;</a></li>

                        
                        <!-- 특정 페이지로 이동 -->
                        <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                            <c:choose>
                                <c:when test="${i == pagination.currentPage}">
                                    <%-- 현재 보고있는 페이지 --%>
                                    <li><a class="current">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <%-- 현재 페이지를 제외한 나머지 --%>
                                    <li><a href="/manager/boardSearch?cp=${i}&${sURL}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        
                        <!-- 다음 목록 시작 번호로 이동 ( > )-->
                        <li><a href="/manager/boardSearch?cp=${pagination.nextPage}&${sURL}">&gt;</a></li>

                        <!-- 끝 페이지로 이동 ( >> ) -->
                        <li><a href="/manager/boardSearch?cp=${pagination.maxPage}&${sURL}">&gt;&gt;</a></li>

                    </ul>
                </div>
                
            </section>
        </main>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        <!-- jQuery CDN 방식으로 추가-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

        <script src="/resources/js/manager/manager-board.js"></script>
    </body>
</html>