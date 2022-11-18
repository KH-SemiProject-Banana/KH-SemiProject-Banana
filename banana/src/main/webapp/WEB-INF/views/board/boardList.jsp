<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="boardList" value="${map.boardList}"></c:set>
<c:set var="pagination" value="${map.pagination}"></c:set>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${boardName}</title>

    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/board/boardList-style.css">

    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>

        <nav>
            <ul>
				<%-- items에서 값 하나씩 꺼내서(Map형태) 그걸 boardType이라 부르겠다 --%>
                <c:forEach var="boardType" items="${boardTypeList}">
                
                	<li>
                		<!-- 컬럼명 대문자 그대로 작성(KEY) => VALUE가 나옴 -->
                		<a href="/board/${boardType.BOARD_CODE}">${boardType.BOARD_NAME}</a>
                	</li>
                
                </c:forEach>
                
                
            </ul>
        </nav>

        
        <section class="board-list">

            <h1 class="board-name">${boardName}게시판이름 들어갈곳이다</h1>


            <div class="list-wrapper">
                <table class="list-table">
                    
                    <thead>
                        <tr>
                            <th>글번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                            <th>좋아요</th>
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
                                            <c:if test="${not empty board.thumbnail}">
                                                <img class="list-thumbnail" src="${board.thumbnail}">
                                            </c:if>
                                            <a href="#">${board.boardTitle}</a>   
                                            [${board.commentCount}]                        
                                        </td>
                                        <td>${board.memberNickname}</td>
                                        <td>${board.boardCreateDate}</td>
                                        <td>${board.viewCount}</td>
                                        <td>${board.commentCount}</td>
                                    </tr>
                                </c:forEach>

                            </c:otherwise>
                        </c:choose>
                   		
                    </tbody>
                </table>
            </div>


            <div class="btn-area">

				<!-- 로그인 상태일 경우 글쓰기 버튼 노출 -->
                <button id="insertBtn">글쓰기</button>                     

            </div>


            <div class="pagination-area">


                <ul class="pagination">
                
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="#">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="#">&lt;</a></li>

					
                    <!-- 특정 페이지로 이동 -->
                    
                    <!-- 현재 보고있는 페이지 -->
                    <li><a class="current">1</a></li>
                    
                    <!-- 현재 페이지를 제외한 나머지 -->
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">6</a></li>
                    <li><a href="#">7</a></li>
                    <li><a href="#">8</a></li>
                    <li><a href="#">9</a></li>
                    <li><a href="#">10</a></li>
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="#">&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="#">&gt;&gt;</a></li>

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
    </main>
    
    
    <%-- <!-- 썸네일 클릭 시 모달창 출력 -->
    <div class="modal">
        <span id="modal-close">&times;</span>
        <img id="modal-image" src="/resources/images/board/20221116105843_00001.gif">
    </div> --%>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>


</body>
</html>