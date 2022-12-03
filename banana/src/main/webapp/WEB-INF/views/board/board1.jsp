<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="boardName" value="${boardTypeList[boardCode-1].BOARD_NAME}"/>
<c:set var="boardList" value="${map.boardList}"></c:set>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>

    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/board/board1.css">

    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"> </script>

    
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
                        <a href="/board/${boardType.BOARD_CODE}">${boardType.BOARD_NAME}</a>
                    </c:forEach>
                </div>
            </div>


        </div>
        <div>
            <section class="notice-content"> 
                <div class="notice__title">
                    <p>고객센터</p>
                </div>
                
                
                <div class ="frequent-question__title">
                    <p>${boardName}</p>
                    <div class="foldBtnArea">
                        <c:if test="${loginMember.authority == 2}">
                            <button type="button" id="editBoard1">글 작성하기</button>
                        </c:if>
                        <button type="button" id="foldAll">모두 접기</button>
                    </div>
                </div>

                
                <c:forEach var="board" items="${boardList}">
                    <div class="frequent-question__content">
                        <a  class="frequent-question__content-detail"  onclick="this.nextElementSibling.style.display=(this.nextElementSibling.style.display=='none')?'block':'none'; ">                    
                            <i class="fa-solid fa-circle-question"></i>
                            <div  class="frequent-question__content">
                                <p>${board.boardTitle}</P>
                            </div>
                        </a>
                        <div class="area" style="display:none">
                            <div class="profile">
                                <div class="profile-img">
                                    <img src="/resources/images/banana-logo.png" class="admin-img">
                                </div>
                                <div class="name-date">
                                    <p class= "nickname" id="admin-name">바나나마켓_운영지원팀</p>
                                    <!-- <p id="question-date">2022.10.21 오후 6:22</p> -->
                                </div>
                            </div>
                            <div class="question-content">
                                <p name="content" id="user-content" >
                                    ${board.boardContent}<br>
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                    

                    <div class="alarm-or-question">
                        <a href="#" class="notice__alarm">신고하기</a>
                        <a  class="notice__question" id="insertBtn">문의하기</a>
                    </div>
                </div>
            </section>
        </div>
        <div></div>
    </div> 


  	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script>
        const boardCode = "${boardCode}";
        const loginMember = "${loginMember}";
    </script>

    <script src="/resources/js/board/boardList.js"></script>

</body>

</html>