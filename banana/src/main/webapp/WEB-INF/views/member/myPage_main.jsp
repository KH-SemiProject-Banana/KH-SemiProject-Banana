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
    <link rel="stylesheet" href="/resources/css/screens/header-footer.css">

    <link rel="stylesheet" href="/resources/css/lsy/addPop.css">
    <link rel="stylesheet" href="/resources/css/lsy/myPage_main.css">
    <link rel="stylesheet" href="/resources/css/lsy/review_survey.css">



    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

</head>

<body>
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <jsp:include page="/WEB-INF/views/common/nav.jsp" />
    
        <div class = "myBanana">
            <!--섹션1********************************************************************************************************섹션1-->
            <section class = "my-rotten-banana">
                <!-- <p>탈퇴하기</p> -->
                <i class="topmenu__alarm fa-regular fa-bell fa-2x"></i>                
                <p>차단 관리</p>
            </section>
            <!--섹션2********************************************************************************************************섹션1-->
            <section class = "myBanana-title">
                    <p>나의 바나나</p>
            </section>
            <!--섹션3********************************************************************************************************섹션1-->
            <section class = "myBanana-detail">
                <div class = "myBanana-photo">
                    <img  class = "photo" src="/resources/images/banana-logo.png" alt="">
                    <i  class="fa-solid fa-camera-retro fa-2x pen"></i> 
                </div>
                
                <div class = "myBanana-content">
                    <div class = "myBanana-info">
                        <div class = "myBanana-name">${loginMember.memberNickname}</div>
                        <div class = "myBanana-address">${address}</div>
                        <div class = "myBanana-changeInfo">
                            <a href="/member/myPage/updateInfo">
                                <p id="introUpdateBtn1" class = "introUpdateBtn1">수정</p>
                            </a>
                        </div>
                    </div>

                    <div class = "myBanana-intro">
                        <%-- (기존꺼)강사님과 함께.... --%>
                        <%-- <p id = "p_intro">나는 썩은 바나나가 아니에요</p>
                        <a href="#" id="introUpdateBtn"><i id = "pen_intro" class = "fa-solid fa-pen" ></i></a>
                        --%>

                        <p id = "p_intro" class="p_intro">${loginMember.introduce}</p>
                        
                        <p id="introUpdateBtn2" class = "introUpdateBtn2">수정</p>
                    <%--  <p id = "changedBtn" class = "changedBtn">수정하기</p> --%>
                        
                    </div>
                    <div class = "myBanana-temp">
                        <p class ="temp-text">나의 바나나 온도 : ${loginMember.manner}도</p>
                        <div class = "container">
                            <c:choose>
                                <c:when test="${loginMember.manner >= 80}">
                                    <div class = "temperature" style = "width:${loginMember.manner}%; background-color:red"></div>
                                </c:when>
                                <c:when test="${loginMember.manner >= 60}">
                                    <div class = "temperature" style = "width:${loginMember.manner}%; background-color:orange"></div>
                                </c:when>
                                <c:when test="${loginMember.manner >= 40}">
                                    <div class = "temperature" style = "width:${loginMember.manner}%; background-color:yellow"></div>
                                </c:when>
                                <c:when test="${loginMember.manner >= 20}">
                                    <div class = "temperature" style = "width:${loginMember.manner}%; background-color:green"></div>
                                </c:when>
                                <c:otherwise>
                                    <div class = "temperature" style = "width:${loginMember.manner}%; background-color:blue"></div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </section>
            <!--섹션4********************************************************************************************************섹션1-->
            <section class = "myBanana-category">
                <div id =first-category>판매내역</div>
                <div id =second-category>구매내역</div>
                <div id =third-category>관심목록</div>
                <div id =fourth-category>후기</div>
            </section>
            <!--섹션5********************************************************************************************************섹션1-->
                <div id = changeJsp>
                    <jsp:include page="/WEB-INF/views/member/myPage_review.jsp"></jsp:include>
                </div>
                <section class = "myBanana-sellList" id = "myBanana-sellList">
                    <div class = "myBanana-sell">
                        <div id="selling">판매중</div>
                        <div id="sold">판매완료</div>
                    </div>

                    <section class="content-favorite">

                        <%-- 상품박스 --%>
                        <div class="favorite__pack">
                            <div>
                                <div class="favorite__img">
                                    <img src="/resources/images/runningCat.png" >
                                    <i class="fa-solid fa-ellipsis-vertical dot"></i>
                                </div>
                                <div class="favorite__price-heart">
                                    <div class="favorite__price">투썸 마스카포네 치즈를 팝니다. 마싯서용</div>
                                </div>
                            </div>
                            <div class="favorite__content">11달 전</div>
                            <a href="javascript:openPop()" id = "popopen">
                                <div class="testcolor">거래 후기 보내기</div>
                            </a>    
                        </div>

                        <%-- 상품박스 --%>
                        <div class="favorite__pack">
                            <div>
                                <div class="favorite__img">
                                    <img src="/resources/images/bananaTree.png" >
                                    <i class="fa-solid fa-ellipsis-vertical dot" ></i>
                                </div>
                                <div class="favorite__price-heart">
                                    <div class="favorite__price">거지같은 옷</div>
                                </div>
                            </div>
                            <div class="favorite__content">12달 전</div>
                            <div class="testcolor2">보낸 후기 보기</div>
                        </div>

                        <%-- 상품박스 --%>
                        <div class="favorite__pack">
                            <div>
                                <div class="favorite__img">
                                    <img src="/resources/images/sampleGoods.jpg" >
                                    <i class="fa-solid fa-ellipsis-vertical dot" ></i>
                                </div>
                                <div class="favorite__price-heart">
                                    <div class="favorite__price">이딴게 옷?</div>
                                </div>
                            </div>
                            <div class="favorite__content">1년 전</div>
                            <a href="javascript:openPop()">
                                <div class="testcolor">거래 후기 보내기</div>
                            </a>  
                        </div>
                        <%-- 상품박스 --%>
                        <div class="favorite__pack">
                            <div>
                                <div class="favorite__img">
                                    <img src="/resources/images/sampleGoods.jpg" >
                                    <i class="fa-solid fa-ellipsis-vertical dot" ></i>
                                </div>
                                <div class="favorite__price-heart">
                                    <div class="favorite__price">이상한 옷</div>
                                    
                                </div>
                            </div>
                            <div class="favorite__content">1년 전</div>
                            <a href="javascript:openPop()">
                                <div class="testcolor">거래 후기 보내기</div>
                            </a>  
                        </div>

                        <%-- 상품박스 --%>
                        <div class="favorite__pack">
                            <div>
                                <div class="favorite__img">
                                    <img src="/resources/images/sampleGoods.jpg" >
                                    <i class="fa-solid fa-ellipsis-vertical dot" ></i>
                                </div>
                                <div class="favorite__price-heart">
                                    <div class="favorite__price">비싼 옷</div>
                                    
                                </div>
                            </div>
                            <div class="favorite__content">1년 전</div>
                            <a href="javascript:openPop()">
                                <div class="testcolor">거래 후기 보내기</div>
                            </a>  
                        </div>

                        
                        <%-------------- 구분선--------------%>
                    
                        <%-- 상품박스 --%>
                        <div class="favorite__pack">
                            <div>
                                <div class="favorite__img">
                                    <img src="/resources/images/sampleGoods.jpg" >
                                    <i class="fa-solid fa-ellipsis-vertical dot" >
                                        안녕
                                    </i>
                                </div>
                                <div class="favorite__price-heart">
                                    <div class="favorite__price">깨꾹이인형 팔아요</div>
                                </div>
                            </div>
                            <div class="favorite__content">2년 전</div>
                            <a href="javascript:openPop()">
                                <div class="testcolor">거래 후기 보내기</div>
                            </a>  
                        </div>

                        <%-- 상품박스 --%>
                        <div class="favorite__pack">
                            <div>
                                <div class="favorite__img">
                                    <img src="/resources/images/sampleGoods.jpg" >
                                    <i class="fa-solid fa-ellipsis-vertical dot" ></i>
                                </div>
                                <div class="favorite__price-heart">
                                    <div class="favorite__price">이클립스냠냠</div>
                                </div>
                            </div>
                            <div class="favorite__content">2년 전</div>
                            <a href="javascript:openPop()">
                                <div class="testcolor">거래 후기 보내기</div>
                            </a>  
                        </div>

                        <%-- 상품박스 --%>
                        <%-- <div class="favorite__pack">
                            <div>
                                <div class="favorite__img">
                                    <img src="/resources/images/sampleGoods.jpg" >
                                    <i class="fa-solid fa-ellipsis-vertical dot" ></i>
                                </div>
                                <div class="favorite__price-heart">
                                    <div class="favorite__price">파닥몬파닥파닥</div>
                                    
                                </div>
                            </div>
                            <div class="favorite__content">3년 전</div>
                            <a href="javascript:openPop()">
                                <div class="testcolor">거래 후기 보내기</div>
                            </a>  
                        </div> --%>

                        <%-- 상품박스 --%>
                        <%-- <div class="favorite__pack">
                            <div>
                                <div class="favorite__img">
                                    <img src="/resources/images/sampleGoods.jpg" >
                                    <i class="fa-solid fa-ellipsis-vertical dot" ></i>
                                </div>
                                <div class="favorite__price-heart">
                                    <div class="favorite__price">냥냐얀ㅇ야야야야야야야야야ㅑ야야야ㅑ야ㅑ</div>
                                    
                                </div>
                            </div>
                            <div class="favorite__content">5년 전</div>
                            <a href="javascript:openPop()">
                                <div class="testcolor">거래 후기 보내기</div>
                            </a>  
                        </div> --%>

                        <%-- 상품박스 --%>
                        <%-- <div class="favorite__pack">
                            <div>
                                <div class="favorite__img">
                                    <img src="/resources/images/sampleGoods.jpg" >
                                    <i class="fa-solid fa-ellipsis-vertical dot" ></i>
                                </div>
                                <div class="favorite__price-heart">
                                    <div class="favorite__price">집에 가고싶어지는 시간 바로 지금</div>
                                
                                </div>
                            </div>
                            <div class="favorite__content">5년 전</div>
                            <a href="javascript:openPop()">
                                <div class="testcolor">거래 후기 보내기</div>
                            </a>  
                        </div>
                    </section>
                </section> --%>
                
                <div class="popup_layer" id="popup_layer" style="display: none;">
                    <div class="popup_box Scroll ">
                        <div  style="height: 10px; width: 375px; float: top;">
                            <a href="javascript:closePop();"><i class="fa-solid fa-x" id = "fa-x"></i></a>
                        </div>
                        <!--팝업 컨텐츠 영역-->
                        <div class="popup_cont ">
                                    <!-- 섹선1------------------------------------------------------------>
                                    <section class = "title">
                                        <div class = "title_image"><img  src="/resources/images/bananaTree.png" alt=""></div>
                                        <p>거래 후기</p>
                                        <div class = "title_image"><img  src="/resources/images/bananaTree.png" alt=""></div>
                                    </section>
                                    <!-- 섹선2------------------------------------------------------------->
                                    <section class = "question1">
                                        <p>바나나님,</p>
                                        <p>냥냥님과의 거래가 어떠셨나요?</p>
                                        <p>거래선호도는 나만 볼 수 있어요</p>
                                        <div class = "choice">
                                            <div>
                                            <input type="checkbox" name = "badchoice" class = "badchoice" id = "badchoice" value="badchoice">
                                            <label for="badchoice"></label>
                                            <p>별로예요</p>
                                            </div>
                                            <div>
                                            <input type="checkbox" name = "goodchoice" class = "goodchoice" id = "goodchoice" value="goodchoice">
                                            <label for="goodchoice"></label>
                                            <p>최고예요</p>
                                            </div>
                                            <!-- <a href="javascript:doDisplay();">별로예요</a> -->
                                        </div>
                                    </section>
                                    <section id = "goodsection">
                                            <!-- 섹선3(1)------------------------------------------------------------->
                                            <section class = "question">
                                                <div class="question_leaf"><img src="/resources/images/2leaf.png" alt=""></div>
                                                <p>어떤 점이 최고였나요?</p>
                                            </section>
                                            <!-- 섹선4(1)------------------------------------------------------------->
                                            <section class = "goodAnswer" id = "goodAnswer">
                                                <div>
                                                    <input type="checkbox" name = "good" id = "good1" value="1">
                                                    <label for="good1">나눔을 해주셨어요</label>
                                                </div>
                                                <div>
                                                    <input type="checkbox" name = "good" id = "good2" value="2">
                                                    <label for="good2">상품상태가 설명한것과 같아요</label>
                                                </div>
                                                <div>
                                                    <input type="checkbox" name = "good" id = "good3" value="3">
                                                    <label for="good3">상품설명이 자세해요</label>
                                                </div>
                                                <div>
                                                    <input type="checkbox" name = "good" id = "good4" value="4">
                                                    <label for="good4">좋은 상품을 저렴하게 판매해요</label>
                                                </div>
                                                <div>
                                                    <input type="checkbox" name = "good" id = "good5" value="5">
                                                    <label for="good5">시간약속을 잘 지켜요</label>
                                                </div>
                                                <div>
                                                    <input type="checkbox" name = "good" id = "good6" value="6">
                                                    <label for="good6">응답이 빨라요</label>
                                                </div>
                                                <div>
                                                    <input type="checkbox" name = "good" id = "good7" value="7">
                                                    <label for="good7">친절하고 매너가 좋아요</label>
                                                </div>
                                            </section>
                                    </section>
                                    <section id = "badsection">
                                        <!-- 섹선3(2)------------------------------------------------------------->
                                        <section class = "question">
                                            <div class="question_leaf"><img src="/resources/images/2leaf.png" alt=""></div>
                                            <p>어떤 점이 별로였나요?</p>
                                        </section>
                                        <!-- 섹션4(2)------------------------------------------------------- -->
                                        <section class = "badAnswer" id = "badAnswer"> <!-- 원래 id :  -->
                                            <div>
                                                <input type="checkbox" name = "bad" id = "bad1" value="1">
                                                <label for="bad1">원하지 않는 가격을 계속 요구해요</label>
                                            </div>
                                            <div>
                                                <input type="checkbox" name = "bad" id = "bad2" value="2">
                                                <label for="bad2">시간약속을 안 지켜요</label>
                                            </div>
                                            <div>
                                                <input type="checkbox" name = "bad" id = "bad3" value="3">
                                                <label for="bad3">예약만 하고 거래 시간을 명확하게 알려주지 않아요</label>
                                            </div>
                                            <div>
                                                <input type="checkbox" name = "bad" id = "bad4" value="4">
                                                <label for="bad4">거래 시간과 장소를 정한 후 거래 직전 취소했어요</label>
                                            </div>
                                            <div>
                                                <input type="checkbox" name = "bad" id = "bad5" value="5">
                                                <label for="bad5">거래 시간과 장소를 정한 후 연락이 안돼요</label>
                                            </div>
                                            <div>
                                                <input type="checkbox" name = "bad" id = "bad6" value="6">
                                                <label for="bad6">약속 장소에 나타나지 않았어요</label>
                                            </div>
                                            <div>
                                                <input type="checkbox" name = "bad" id = "bad7" value="7">
                                                <label for="bad7">상품 상태가 설명과 달라요</label>
                                            </div>
                                            <div>
                                                <input type="checkbox" name = "bad" id = "bad7" value="7">
                                                <label for="bad7">반말을 사용해요</label>
                                            </div>
                                            <div>
                                                <input type="checkbox" name = "bad" id = "bad7" value="7">
                                                <label for="bad7">불친절해요</label>
                                            </div>
                                        </section>
                                    </section>
                                    <!-- 섹선5------------------------------------------------------------->
                                    <section >
                                        <div class = "question">
                                            <div class="question_leaf"><img src="/resources/images/2leaf.png" alt=""></div>
                                            <p>따뜻한 거래경험을 알려주세요</p>
                                        </div>
                                        <p class = "questionNext">남겨주신 거래후기는 상대방의 프로필에 공개돼요.</p>
                                    </section>
                                    <!-- 섹선6------------------------------------------------------------->
                                    <section >
                                        <textarea name="" id="" class = "answer2" 
                                        cols="30" rows="10"
                                        placeholder="내용을 입력해주세요."></textarea>
                                        
                                    </section>
                                    <!-- 섹선6------------------------------------------------------------->
                                    <section class = "submitBtn">
                                        <button id = submitButton>제출하기</button>
                                    </section>
    
                        </div>
                        <!--팝업 버튼 영역-->
                        <!-- <div class="popup_btn" style="float: bottom; margin-top: 100px;">
                            <a href="javascript:closePop();">닫기</a>
                        </div> -->
                    </div>
                </div>

                
            </section>

            <div class="popup_layer2" id="popup_layer2" style="display: none;">
                <div class="popup_box2  ">
                    <!-- <div  style="height: 10px; width: 375px; float: top;">
                        <a href="javascript:closePop();"><i class="fa-solid fa-x" id = "fa-x"></i></a>
                    </div> -->
                    <!--팝업 컨텐츠 영역-->
                    <div class="popup_cont2 ">
                        <!-- ♥ 여기 안에다가 넣자 ♥-->
                        <section class = "send_message1">
                            <p>
                                으넛님에게 따뜻한 후기를 보냈어요!
                            </p>
                            <p>
                                으넛님과 피카츄를 거래했어요!
                            </p>
                        </section>
                        <section class = "send_message2">
                            <p>나눔을 해주셨어요</p>
                            <p>상품상태가 설명한것과 같아요</p>
                            <p>상품설명이 자세해요</p>
                            <p>좋은 상품을 저렴하게 판매해요</p>
                            <p>시간약속을 잘 지켜요</p>
                        </section>
                        <section class = "send_message3">
                            <div><a href="javascript:closePop2();"><button>받은 후기 보기</button></div></a>
                            <img src="/resources/images/2leaf.png" alt="">
                        </section>
                    </div>
                    <!--팝업 버튼 영역-->
                    <!-- <div class="popup_btn" style="float: bottom; margin-top: 100px;">
                        <a href="javascript:closePop();">닫기</a>
                    </div> -->
                </div>
            </div>

        </div>
    

    </main>


   <%-- footer.jsp.include --%>
        <jsp:include page = "/WEB-INF/views/common/footer.jsp" />

    <script src = "/resources/js/lsy/addPop.js"></script>
    <script src="/resources/js/lsy/review_survey.js"></script>
</body>

</html>