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

    <link rel="stylesheet" href="/resources/css/style.css">
    
    <link rel="stylesheet" href="/resources/css/lsy/myPage_review_good.css">


    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>



</head>
<body>
    <main>
        
        <%-- header.jsp.include --%>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <section class = "title">
        <a href="/member/myPage/selectAllReview"><i id = "back" class="fa-solid fa-angle-right"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매너 상세</a>
    </section>      
    <section class = "content">
        <div class= "side">
            <a class= "side1" id = "side1" href="/member/myPage/review/good?mannerCt=1">
                <div><i class="fa-regular fa-face-smile-beam imo1"></i></div>
                <p>받은 매너 칭찬</p> 
            </a>
            <a class= "side2" id = "side2" href="/member/myPage/review/good?mannerCt=2">
                <div><i class="fa-regular fa-face-angry imo1"></i></div>
                <p>받은 비매너 후기</p> 
            </a>
        </div>

        <div class="goodBadMain">
            <div class="goodBadBox"><%-- div0 --%>
                <div class = "mainGood" id = "mainGood"> <%-- divG1 --%>
                    <div class = "main_title"><%-- divG2 --%>
                        <div><%-- divG2_1div --%>
                            <i class="fa-regular fa-face-smile-beam imo"></i><%-- divG2_1div_i --%>
                        </div>
                        <h2>받은 매너 칭찬</h2> <%-- divG2_2p --%>
                    </div>
                </div>

            </div>


            <div class = "main_content">
                <c:forEach var = "review" items = "${reviewList}">
                <div class = "review">
                    <div>
                        <c:choose>
                            <c:when test="${review.mannerNo == 1}">
                                <div class="iconBox"><i class="fa-solid fa-hand-holding-hand mannerPic"></i></div>
                            </c:when>
                            <c:when test="${review.mannerNo == 2}">
                                <div class="iconBox"><i class="fa-solid fa-wand-magic-sparkles mannerPic"></i></div>
                            </c:when>
                            <c:when test="${review.mannerNo == 3}">
                                <div class="iconBox"><i class="fa-solid fa-arrow-up-short-wide mannerPic"></i></div>
                            </c:when>
                            <c:when test="${review.mannerNo == 4}">
                                <div class="iconBox"><i class="fa-solid fa-money-bill-1-wave mannerPic"></i></div>
                            </c:when>
                            <c:when test="${review.mannerNo == 5}">
                                <div class="iconBox"><i class="fa-solid fa-clock mannerPic"></i></div>
                            </c:when>
                            <c:when test="${review.mannerNo == 6}">
                                <div class="iconBox"><i class="fa-solid fa-truck-fast mannerPic"></i></div>
                            </c:when>
                            <c:when test="${review.mannerNo == 7}">
                                <div class="iconBox"><i class="fa-solid fa-thumbs-up mannerPic"></i></div>
                            </c:when>


                            <c:when test="${review.mannerNo == 8}">
                                <div class="iconBox"><i class="fa-solid fa-hand-holding-dollar mannerPic"></i></div>
                            </c:when>
                            <c:when test="${review.mannerNo == 9}">
                                <div class="iconBox"><i class="fa-solid fa-clock-rotate-left mannerPic"></i></div>
                            </c:when>
                            <c:when test="${review.mannerNo == 10}">
                                <div class="iconBox"><i class="fa-solid fa-question mannerPic"></i></div>
                            </c:when>
                            <c:when test="${review.mannerNo == 11}">
                                <div class="iconBox"><i class="fa-solid fa-ban mannerPic"></i></div>
                            </c:when>
                            <c:when test="${review.mannerNo == 12}">
                                <div class="iconBox"><i class="fa-solid fa-phone-slash mannerPic"></i></div>
                            </c:when>
                            <c:when test="${review.mannerNo == 13}">
                                <div class="iconBox"><i class="fa-solid fa-person-circle-question mannerPic"></i></div>
                            </c:when>
                            <c:when test="${review.mannerNo == 14}">
                                <div class="iconBox"><i class="fa-solid fa-certificate mannerPic"></i></div>
                            </c:when>
                            <c:when test="${review.mannerNo == 15}">
                                <div class="iconBox"><i class="fa-solid fa-person-harassing mannerPic"></i></div>
                            </c:when>
                            <c:when test="${review.mannerNo == 16}">
                                <div class="iconBox"><i class="fa-solid fa-face-frown mannerPic"></i></div>
                            </c:when>
                        </c:choose>
                    <p>${review.mannerDescription}</p>
                    </div>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p class="mannerCount">${review.mannerCount}</p>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
</main>


    <%-- footer.jsp.include --%>
    <jsp:include page = "/WEB-INF/views/common/footer.jsp" />

    <script>
        let mannerCt

        if(${param.mannerCt != null}) {
            mannerCt = ${param.mannerCt};
        } else {
            mannerCt = 1;
        }

        switch(mannerCt){
            case 1: document.getElementById("side1").style.fontWeight = "bold"; break;
            case 2: document.getElementById("side2").style.fontWeight = "bold"; break;
        }
    </script>

    <script src="/resources/js/lsy/myPage_review_good.js"></script>
</body>
</html>