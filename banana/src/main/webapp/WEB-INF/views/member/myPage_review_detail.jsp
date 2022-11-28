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
    <link rel="stylesheet" href="/resources/css/lsy/myPage_review_detail.css">
   
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
   
    
</head>
<body>
    <main>
         <%-- header.jsp.include --%>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <section class = "title">
        <i id = "back" class="fa-solid fa-angle-right"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;후기 상세
    </section>  
    <section class = "total">
        <section class = "category">
            <div class = "category_border">
                <div class = "both">전체 후기</div>
                <div class = "buyer">구매자 후기</div>
                <div class = "seller">판매자 후기</div>
            </div>
        </section>
        <section class = "review">
           
            <div class = "review_1">
                <div class = "photo">
                    <img  src="/resources/images/banana-logo.png" alt="">
                </div>
                <div class="memberInfoBox">
                    <div class="memberInfo">
                        <div class = "row1">
                            <div class = "name">바나나</div>
                        </div>
                        <div class = "row2">
                            <div class = "address">아현동</div>
                            <div class = "date">11달 전</div>
                        </div>
                    </div>
                </div>

                <div class = "content">
                    <div class = "row3">
                        <pre class = "message Scroll">
고주파로 새 제품 교환 찬스까지 썼지만 여전히 고주파 심함. 
국내나 해외 후기들 보면 현재 4090 제품 중 가장 고주파 심한 제품임
(슈프림 외에 터프, 스트릭스, FE도 고주파 심하니 참고). 
굉장히 높은 확률로 고주파가 걸리는 제품이니 
옆방에서 문만 열고 있는 상태에서도 들릴 정도의 
고주파가 괜찮다싶은 사람만 구매 추천.
고주파로 새 제품 교환 찬스까지 썼지만 여전히 고주파 심함. 
국내나 해외 후기들 보면 현재 4090 제품 중 가장 고주파 심한 제품임
(슈프림 외에 터프, 스트릭스, FE도 고주파 심하니 참고). 
굉장히 높은 확률로 고주파가 걸리는 제품이니 
옆방에서 문만 열고 있는 상태에서도 들릴 정도의 
고주파가 괜찮다싶은 사람만 구매 추천.
                        </pre>
                    </div>
                </div>
            </div>



            <div class = "review_2">
                <div class = "photo">
                    <img  src="/resources/images/banana-logo.png" alt="">
                </div>
                <div class="memberInfoBox">
                    <div class="memberInfo">
                        <div class = "row2_1">
                            <div class = "name">바나나</div>
                        </div>
                        <div class = "row2_2">
                            <div class = "address">아현동</div>
                            <div class = "date">11달 전</div>
                        </div>
                    </div>
                </div>

                <div class = "content">
                    <div class = "row2_3">
                        <pre class = "message Scroll">
감사해용
                        </pre>
                    </div>
                </div>
            </div>


            <div class = "review_3">
                <div class = "photo">
                    <img  src="/resources/images/banana-logo.png" alt="">
                </div>
                <div class="memberInfoBox">
                    <div class="memberInfo">
                        <div class = "row1">
                            <div class = "name">바나나</div>
                        </div>
                        <div class = "row2">
                            <div class = "address">아현동</div>
                            <div class = "date">11달 전</div>
                        </div>
                    </div>
                </div>

                <div class = "content">
                    <div class = "row3">
                        <pre class = "message Scroll">
좋은 물건
                        </pre>
                    </div>
                </div>
            </div>


        </section>
    </section>
</main>
     <script>
        document.getElementById("back").addEventListener("click",function(){
        alert("안녕");
        window.history.back();
        })
    </script>

    <%-- footer.jsp.include --%>
    <jsp:include page = "/WEB-INF/views/common/footer.jsp" />


</body>

</html>
