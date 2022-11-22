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
        <i id = "back" class="fa-solid fa-angle-right"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매너 상세
    </section>      
    <section class = "content">
        <div class= "side">
            <div class= "side1" id = "side1">
                <div><i class="fa-regular fa-face-smile-beam imo1"></i></div>
                <p>받은 매너 칭찬</p> 
            </div>
            <div class= "side2" id = "side2"> 
                <div><i class="fa-regular fa-face-angry imo1"></i></div>
                <p>받은 비매너 후기</p>
            </div>
        </div>
        <div class = "mainGood" id = "mainGood">
            <div class = "main_title">
                <div><i class="fa-regular fa-face-smile-beam imo"></i></div>
                <p>받은 매너 칭찬</p> 
            </div>
            <div class = "main_content">
                <div class = "review">
                    <p>나눔을 해주셨어요</p>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p>33</p>
                    </div>
                    
                
                </div>
                <div class = "review"> 
                    <p>상품상태가 설명한것과 같아요</p>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p>33</p>
                    </div>
                </div>
                <div class = "review">
                    <p>상품설명이 자세해요</p>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p>33</p>
                    </div>
                </div>
                <div class = "review">
                    <p>좋은 상품을 저렴하게 판매해요</p>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p>33</p>
                    </div>
                </div>
                <div class = "review">
                    <p>시간약속을 잘 지켜요</p>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p>33</p>
                    </div>
                </div>
                <div class = "review">
                    <p>응답이 빨라요</p>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p>33</p>
                    </div>
                </div>
                <div class = "review">
                    <p>친절하고 매너가 좋아요</p>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p>33</p>
                    </div>
                </div>
            </div>
        
        </div>
        <div class = "mainBad" id = "mainBad">
            <div class = "main_title">
                <div><i class="fa-regular fa-face-angry imo"></i></div>
                <p>받은 비매너 후기</p>
                <div class = "lightbulb">
                    <i class="fa-regular fa-lightbulb" id = "lightbulb"></i>
                    <div id = "lightbulb_inner" class = "lightbulb_inner">
                        <div>
                            <p>참고사항</p>
                            <p>- 받은 비매너 내역은 나에게만 보입니다.</p>
                            <p>- 매너 온도가 올라가는 경우 (가산점 높은 순)</p>
                            <p>1. 거래 상대에게 받은 긍정 거래 후기</p>
                            <p>2. 거래 상대에게 받은 매너 칭찬</p>
                            <p>3. 대화 상대에게 받은 매너 칭찬</p>
                            <p>- 매너 온도가 내려가는 경우 (감산점 높은 순)</p>
                            <p>1. 이용정지 징계</p>
                            <p>2. 거래 상대의 비매너 평가</p>
                            <p>3. 대화 상대의 비매너 평가</p>
                        </div>
                        
                    </div>
                    
                </div> 
            </div>
            <div class = "main_content">
                <div class = "review">
                    <p>원하지 않는 가격을 계속 요구해요</p>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p>33</p>
                    </div>
                </div>
                <div class = "review"> 
                    <p>시간약속을 안 지켜요</p>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p>33</p>
                    </div>
                </div>
                <div class = "review">
                    <p>예약만 하고 거래 시간을 명확하게 알려주지 않아요</p>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p>33</p>
                    </div>
                </div>
                <div class = "review">
                    <p>거래 시간과 장소를 정한 후 거래 직전 취소했어요</p>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p>33</p>
                    </div>
                </div>
                <div class = "review">
                    <p>거래 시간과 장소를 정한 후 연락이 안돼요</p>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p>33</p>
                    </div>
                </div>
                <div class = "review">
                    <p>약속 장소에 나타나지 않았어요</p>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p>33</p>
                    </div>
                </div>
                <div class = "review">
                    <p>상품 상태가 설명과 달라요</p>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p>33</p>
                    </div>
                </div>
                <div class = "review">
                    <p>반말을 사용해요</p>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p>33</p>
                    </div>
                </div>
                <div class = "review">
                    <p>불친절해요</p>
                    <div>
                        <i class="fa-solid fa-user-group"></i>
                        <p>33</p>
                    </div>
                </div>
            </div>
        
        </div>

    </section>
</main>


    <%-- footer.jsp.include --%>
    <jsp:include page = "/WEB-INF/views/common/footer.jsp" />


    <script src="/resources/js/lsy/myPage_review_good.js"></script>
</body>
</html>