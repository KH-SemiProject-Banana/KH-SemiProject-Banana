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

    <style>

    </style>

</head>
<body>
    <main>
        
        <%-- header.jsp.include --%>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <form class = "title" id = "fourth-category" method = "post">
        <a id = "lastCt" ><i id = "back" class="fa-solid fa-angle-right"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매너 상세</a>
        <input type="hidden" name="sellerNo" value="${member.memberNo}">
    </form>      
    <section class = "content">
        <div class= "side">
                <form class= "side1" id = "title_section_1" method = "post">
                    <input type="hidden" name="sellerNo" value="${member.memberNo}">
                    <div><i class="fa-regular fa-face-smile-beam imo1"></i></div>
                    <p id= "goToManner">받은 매너 칭찬 </p> 
                </form>
                <%-- <div class= "side2" id = "side2"> 
                    <div><i class="fa-regular fa-face-angry imo1"></i></div>
                    <p><a href="/member/myPage/review/good?mannerCt=2">받은 비매너 후기</a></p>
                </div> --%>
        </div>

        <div class="goodBadMain">
            <div class="goodBadBox"><%-- div0 --%>
                <div class = "mainGood" id = "mainGood"> <%-- divG1 --%>
                    <div class = "main_title"><%-- divG2 --%>
                        <div><%-- divG2_1div --%>
                            <i class="fa-regular fa-face-smile-beam imo"></i><%-- divG2_1div_i --%>
                        </div>
                        <p> 받은 매너 칭찬</p> <%-- divG2_2p --%>
                    </div>
                </div>

            </div>


            <div class = "main_content">
                <c:forEach var = "review" items = "${reviewList}">
                <div class = "review">
                    <p>${review.mannerDescription}</p>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p>${review.mannerCount}</p>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
</main>


    <%-- footer.jsp.include --%>
    <jsp:include page = "/WEB-INF/views/common/footer.jsp" />

    <%-- <script>
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
    </script> --%>

    <script>

    //'후기'을 클릭했을 때, form태그 제출 (후기 조회됨)
    document.getElementById("lastCt").addEventListener("click",function(){
        const myBananaSell = document.getElementById("fourth-category");
        myBananaSell.action = "/member/myPage/selectAllYourReview";
        myBananaSell.submit();
    })
    //'받은 매너 평가'를 클릭했을 때, form태그 제출
    document.getElementById("goToManner").addEventListener("click",function(){
    const myBananaSell = document.getElementById("title_section_1");
    myBananaSell.action = "/member/myPage/yourReview/good";
    myBananaSell.submit();
    })

    </script>

    <%-- <script src="/resources/js/lsy/myPage_review_good.js"></script> --%>
</body>
</html>