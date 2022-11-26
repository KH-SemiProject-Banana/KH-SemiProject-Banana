<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="boardList" value="${map.boardList}"></c:set>
<c:set var="pagination" value="${map.pagination}"></c:set>
<c:set var="boardName" value="${boardTypeList[boardCode-1].BOARD_NAME}" />
<c:set var="boardCode" value="3" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>

    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/board/boardList.css">
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>

</head>

<body>


    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
    </main>

    <div class="longMain">

        <div class="sidebar">
            <div>
                <div class="sidebar__title">바나나센터</div>
                <div class="sidebar__content">

                    <c:forEach var="boardType" items="${boardTypeList}">

                            <c:choose>
                                <c:when test="${boardType.BOARD_CODE == boardCode}">
                                    <a class="selected" href="/board/${boardType.BOARD_CODE}">${boardType.BOARD_NAME}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/board/${boardType.BOARD_CODE}">${boardType.BOARD_NAME}</a>
                                </c:otherwise>
                            
                            </c:choose>

                            
                        </c:forEach>
                </div>
            </div>


        </div>

        <section class="question-section">


            <div class="make-question">
                <button href="/board/${boardCode}" id="questionList">전체보기</button>
                <button href="/question/myQuestion" id="myQuestionList">나의 문의/안내 내역</button>
            </div>

           
            <section class="board-list">

                <%-- <div class="notice__title">
                    <p>고객센터</p>
                </div> --%>

                <h1 class="board-name">${boardName}</h1>


                <div class="list-wrapper">
                    <table class="list-table">
                        
                        <thead>
                            <tr>
                                <th>글번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회수</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:choose>
                                <c:when test="${empty boardList}">
                                    <tr>
                                        <th colspan="6">게시글이 존재하지 않습니다.</th>
                                    </tr>
                                </c:when>
                                <c:otherwise>

                                    <c:forEach var="board" items="${boardList}">
                                        <tr>
                                            <td>${board.boardNo}</td>
                                            <td> 
                                                <a href="/board/${boardCode}/${board.boardNo}">${board.boardTitle}</a>   
                                                [${board.commentCount}]                        
                                            </td>
                                            <td>${board.memberNickname}</td>
                                            <td>${board.boardCreateDate}</td>
                                            <td>${board.viewCount}</td>
                                        </tr>
                                    </c:forEach>

                                </c:otherwise>
                            </c:choose>
                            
                        </tbody>
                    </table>
                </div>


                <div class="btn-area">

                    
                    <button id="insertBtn">문의하기</button>                     
                </div>


                <div class="pagination-area">


                    <ul class="pagination">
                    
                        <!-- 첫 페이지로 이동( <<) -->
                        <li><a href="/question/myQuestion">&lt;&lt;</a></li>

                        <!-- 이전 목록 마지막 번호로 이동 ( < ) -->
                        <li><a href="/question/myQuestion?cp=${pagination.prevPage}">&lt;</a></li>

                        
                        <!-- 특정 페이지로 이동 -->
                        <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                            <c:choose>
                                <c:when test="${i == pagination.currentPage}">
                                    <%-- 현재 보고있는 페이지 --%>
                                    <li><a class="current">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <%-- 현재 페이지를 제외한 나머지 --%>
                                    <li><a href="/question/myQuestion?cp=${i}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        
                        <!-- 다음 목록 시작 번호로 이동 ( > )-->
                        <li><a href="/question/myQuestion?cp=${pagination.nextPage}">&gt;</a></li>

                        <!-- 끝 페이지로 이동 ( >> ) -->
                        <li><a href="/question/myQuestion?cp=${pagination.maxPage}">&gt;&gt;</a></li>

                    </ul>
                </div>


                <!-- 검색창 -->
                <form action="#" method="get" id="boardSearch" onsubmit="return false">

                    <select name="key" id="search-key">
                        <option value="t">제목</option>
                        <option value="c">내용</option>
                        <option value="tc">제목+내용</option>
                        <option value="w">작성자</option>
                    </select>

                    <input type="text" name="query"  id="search-query" placeholder="검색어를 입력해주세요.">

                    <button>검색</button>
                </form>

            </section>




            
            

        </section>
    
    </div>


    <script>
        const boardCode = "${boardCode}";
        const loginMember = "${loginMember}"
    </script>



   


   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
   <script src="/resources/js/board/myQuestionList.js"></script>
</body>

</html>