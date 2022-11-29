<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<c:set var="boardName" value="${boardTypeList[boardCode-1].BOARD_NAME}"/>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>


    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/board/boardDetail.css">
    <link rel="stylesheet" href="/resources/css/board/comment.css">

    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
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

            <div class="boardNameArea">게시판 > ${boardName}</div>
            <section class="board-detail">  

                <!-- 버튼 영역-->
                <div class="board-btn-area">

                    <!-- 로그인한 회원과 게시글 작성자 번호가 같은 경우-->
                    <c:if test="${loginMember.memberNo == board.memberNo}">
                        <button id="updateBtn">수정</button>
                        <button id="deleteBtn">삭제</button>
                    </c:if>


                    <button id="goToListBtn">목록으로</button>
                </div>



                <!-- 제목 -->
                <h1 class="board-title">${board.boardTitle}</h1>

                <!-- 프로필 + 닉네임 + 작성일 + 조회수 -->
                <div class="board-header">
                    <div class="board-writer">

                        <!-- 프로필 이미지 -->
                        <c:if test="${empty board.profileImage}">
                            <img src="/resources/images/banana-logo.png"/>
                        </c:if>
                        <c:if test="${not empty board.profileImage}">
                            <img src="${board.profileImage}">
                        </c:if>

                        <span>${board.memberNickname}</span>

                    </div>

                    <div class="board-info">
                        <p> <span>작성일</span>${board.boardCreateDate}</p>     

                        <!-- 수정한 게시글인 경우 -->
                        <c:if test="${not empty board.boardUpdateDate}">
                            <p> <span>마지막 수정일</span>${board.boardUpdateDate}</p>   
                        </c:if>

                        <p> <span>조회수</span>${board.viewCount}</p>                    
                    </div>
                </div>



            
                <!-- 내용 -->
                <div class="board-content">
                    ${board.boardContent}
                </div>

                <!-- 이미지가 있을 경우 -->
                <c:if test="${not empty board.imageList}">

 
                        <div class="img-box">

                            <c:forEach var="img" items="${board.imageList}">
                                <div class="boardImg">
                                    <img src="${img.imagePath}${img.imageRename}">        
                                </div>
                            </c:forEach>
                        </div>
                    

                </c:if>
                


            </section>
        <!-- 댓글 include-->
        <jsp:include page="comment.jsp"/>
        </section>

        
    </div>

    <script>
        const boardCode = "${boardCode}";
        const boardNo = "${boardNo}";
        const loginMember = "${loginMember}";
        const memberNo = "${loginMember.memberNo}";

    </script>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <!-- jQuery CDN 방식으로 추가-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="/resources/js/board/boardDetail.js"></script>
    <script src="/resources/js/board/comment.js"></script>

</body>
</html>