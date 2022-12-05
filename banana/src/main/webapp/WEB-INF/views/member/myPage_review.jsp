<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="reviewNewestList" value="${map.reviewNewestList}" />
<c:set var="mannerTopList" value="${map.mannerTopList}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>

    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/lsy/myPage_review.css ">

    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class = "myBanana" id = "reviewss">
        <section class = "myBanana-reviewList">
            <section class = "title_section_1">
                <a href="/member/myPage/review/good">받은 매너 평가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-angle-right"></i></a>
            </section>
            </section>
            <section class ="review_section_1">
                <section class = "row1">
                    <c:forEach var = "manner" items = "${mannerTopList}">
                    <div class = "row"><p class = "row1col1">${manner.mannerDescription}</p></div>
                    </c:forEach>
                    <%-- <div class = "row"><p class = "row1col2">좋은 상품을 저렴하게 판매해요</p></div>
                    <div class = "row"><p class = "row1col3">시간 약속을 잘 지켜요</p></div>
                    <div class = "row"><p class = "row1col4">응답이 빨라요</p></div>
                    <div class = "row"><p class = "row1col5">제가 있는 곳까지 와서 거래했어요</p></div> --%>
                </section>
                <section class = "row2">
                    
                    <div class="iconBox"><i class="fa-solid fa-face-smile circle"></i></div>
                    <div class="iconBox"><i class="fa-solid fa-sack-dollar circle"></i></div>
                    <div class="iconBox"><i class="fa-solid fa-clock circle"></i></div>
                    <div class="iconBox"><i class="fa-solid fa-bolt circle"></i></div>
                    <div class="iconBox"><i class="fa-solid fa-person-walking circle"></i></div>
                </section>
                <section class = "row3">
                    <c:forEach var = "manner" items = "${mannerTopList}">
                    <div class = "row33"><p class = "row3col2">${manner.mannerCount}</p></div>
                    </c:forEach>
                    <%-- <div class = "row33"><p class = "row3col1">40</p></div>
                    <div class = "row33"><p class = "row3col2">30</p></div>
                    <div class = "row33"><p class = "row3col3">20</p></div>
                    <div class = "row33"><p class = "row3col4">10</p></div>
                    <div class = "row33"><p class = "row3col5">5</p></div> --%>
                </section>
            </section>
            <section class = "title_section_2">
                <a href="/member/myPage/review/detail">받은 거래 후기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-angle-right"></i></a>
            </section>
            <section class = "review_section_2">
                <c:forEach var = "review" items = "${reviewNewestList}">
                    <div class = "review_2">
                        <div class = "userphoto">
                            <img  src="${review.profileImage}" alt="">
                        </div>
                        <div class="memberInfoBox">     
                            <div class="memberInfo">
                                <div class = "row2_1">
                                    <div class = "name">${review.memberNickname}</div>
                                </div>
                                <div class = "row2_2">
                                    <div class = "address">${review.address}</div>
                                    <div class = "date">${review.createdAt}</div>
                                </div>
                            </div>
                        </div>

                        <div class = "content">
                            <div class = "row2_3">
                                <pre class = "message Scroll">
                                ${review.message}
                                </pre>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </section>
        </section>
    </div>
</body>

</html>