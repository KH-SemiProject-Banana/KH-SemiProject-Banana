<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>

    <link rel="stylesheet" href="../../resources/css/style.css">
    <link rel="stylesheet" href="../../resources/css/board/myBoardList.css">
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
                                    <a class="selected" href="${boardType.BOARD_CODE}">${boardType.BOARD_NAME}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${boardType.BOARD_CODE}">${boardType.BOARD_NAME}</a>
                                </c:otherwise>
                            
                            </c:choose>

                            
                        </c:forEach>
                </div>
            </div>


        </div>

        <section class="question-section">
            <div class="make-question">
                <a href="question-answer.html">나의 문의/안내 내역</a>
                <a href="question.html">전체보기</a>
            </div>

           


            
            <div class="make-question__section">
                <div class="question-bundle">
                    <div class="question__title">
                        <a href="#" class="title__content">내 정보가 안전하다는 확신은 어디서 얻을 수 있을까요?</a>
                    </div>
                    <div class="question__status">
                        <p class="status__answer fa-solid fa-check"> 답변완료</p>
                        <p class="status__date">2022-10-19</p>
                    </div>
                </div>

            </div>

        </section>
    
    </div>







   


   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>

</html>