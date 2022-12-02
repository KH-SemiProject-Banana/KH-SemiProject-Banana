<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>

<c:set var="soldList" value="${map.soldList}" />



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

		<div class="myBanana">
			<!--섹션1********************************************************************************************************섹션1-->
			<section class="my-rotten-banana">
				<!-- <p>탈퇴하기</p> -->
				<i class="topmenu__alarm fa-regular fa-bell fa-2x"></i>
				<p>차단 관리</p>
			</section>
			<!--섹션2********************************************************************************************************섹션1-->
			<section class="myBanana-title">
				<p>나의 바나나</p>
			</section>
			<!--섹션3********************************************************************************************************섹션1-->
			<section class="myBanana-detail">
				<div class="myBanana-photo">
                    <c:if test = "${not empty loginMember.profileImage}">
                        <img class="photo" src="${loginMember.profileImage}" alt=""> <i class="fa-solid fa-camera-retro fa-2x pen"></i>
                    </c:if>
                    <c:if test = "${empty loginMember.profileImage}">
                        <img class="photo" src="/resources/images/banana-logo.png" alt=""> <i class="fa-solid fa-camera-retro fa-2x pen"></i>
                    </c:if>
				</div>

				<div class="myBanana-content">
					<div class="myBanana-info">
						<div class="myBanana-name">${loginMember.memberNickname}</div>
						<div class="myBanana-address">${address}</div>
						<div class="myBanana-changeInfo">
							<a href="/member/myPage/updateInfo">
								<p id="introUpdateBtn1" class="introUpdateBtn1">수정하기</p>
							</a>
						</div>
					</div>

					<div class="myBanana-intro">
						<%-- (기존꺼)강사님과 함께.... --%>
						<%-- <p id = "p_intro">나는 썩은 바나나가 아니에요</p>
                        <a href="#" id="introUpdateBtn"><i id = "pen_intro" class = "fa-solid fa-pen" ></i></a>
                        --%>

						<p id="p_intro" class="p_intro">${loginMember.introduce}</p>

						<p id="introUpdateBtn2" class="introUpdateBtn2">수정하기</p>
						

					</div>
					<div class="myBanana-temp">
						<p class="temp-text">나의 바나나 온도 : ${loginMember.manner}도</p>
						<div class="container">
							<c:choose>
								<c:when test="${loginMember.manner >= 80}">
									<div class="temperature" style="width:${loginMember.manner}%; background-color:red"></div>
								</c:when>
								<c:when test="${loginMember.manner >= 60}">
									<div class="temperature" style="width:${loginMember.manner}%; background-color:orange"></div>
								</c:when>
								<c:when test="${loginMember.manner >= 40}">
									<div class="temperature" style="width:${loginMember.manner}%; background-color:yellow"></div>
								</c:when>
								<c:when test="${loginMember.manner >= 20}">
									<div class="temperature" style="width:${loginMember.manner}%; background-color:green"></div>
								</c:when>
								<c:otherwise>
									<div class="temperature" style="width:${loginMember.manner}%; background-color:blue"></div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</section>
			<!--섹션4********************************************************************************************************섹션1-->
			<section class="myBanana-category">
                   
                     <div id= "first-category" class = "category">
                        <a href="/member/myPage/main?myPageCt=1">판매내역</a>
                     </div>

                    <%-- c:if test = param.myPageCt=1 --%>

                    <div id= "second-category" class = "category"><a href="/member/myPage/main?myPageCt=2">구매내역</a></div>
                    <div id= "third-category" class = "category">관심목록</a></div>
                    <div id= "fourth-category" class = "category">후기</a></div>
                    
                    
              

            <%-- 판매내역 클랙->js에서 1을 input에 넣고
                button을 클릭하도록 함
                document.getElementById("first-category").addEventListener("click", ()=>{
                    document.getElementbyId("status").value = 1;
                    document.getElementById("button").click();
                })
             --%>

			</section>
			<!--섹션5********************************************************************************************************섹션1-->
			<div id=changeJsp>
				<jsp:include page="/WEB-INF/views/member/myPage_review.jsp"></jsp:include>
			</div>
			<section class="myBanana-sellList" id="myBanana-sellList">
				<div class="myBanana-sell">
					<div id="selling"><a href="/member/myPage/main?myPageCt=5">판매중</a></div>
					<div id="sold"><a href="/member/myPage/main?myPageCt=1">판매완료</a></div>
				</div>

				<section class="content-favorite">

					<!-- 게시글 목록 조회 결과가 비어있다면 -->

					<%-- choose 내에서는 jsp주석 적어야 해 --%>
                   
					<c:choose>
						<c:when test="${empty soldList}">
							<%-- 게시글 목록 조회 결과가 비어있다면 --%>
							<tr>
								<th colspan="6">게시글이 존재하지 않습니다.</th>
							</tr>
						</c:when>

						<c:otherwise>
							<c:forEach var="sold" items="${soldList}">
								<%-- 상품박스 --%>
								<div class="favorite__pack">
									<div>
										<div class="favorite__img">
											<img src="${sold.imagePath}"> 
                                            <i class="fa-solid fa-ellipsis-vertical dot" id="${sold.goodsNo}"></i>
										</div>
										<div class="favorite__price-heart">
											<div class="favorite__price">${sold.title}</div>
										</div>
									</div>
									<div class="favorite__content">${sold.createdAt}</div>
                                     
                                        <c:if test = "${sold.buyerNo != 0}">
                                            <c:choose>
                                                <c:when test="${sold.ratingNo == 0}">
                                                    <a href="javascript:openPop(${sold.goodsNo},${sold.buyerNo},'${sold.buyerNickname}'
                                                                                ${sold.sellerNo},'${sold.sellerNickname}')" id="popopen">
                                                        <div class="testcolor">거래 후기 보내기</div>
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="javascript:openReview(${sold.ratingNo},'${sold.buyerNickname}','${sold.title}')">
                                                    <div class="testcolor2">보낸 후기 보기</div>
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                        
								</div>
                            </c:forEach>
						</c:otherwise>
					</c:choose>
                                <%-- 기존위치 --%>

                                <div class="popup_layer" id="popup_layer" style="display: none;">
                                    <div class="popup_box Scroll ">
                                        <div style="height: 10px; width: 375px; float: top;">
                                            <a href="javascript:closePop();"><i class="fa-solid fa-x" id="fa-x"></i></a>
                                        </div>
                                        <!--팝업 컨텐츠 영역-->
                                        <div class="popup_cont ">
                                            <%-- <form action = "/member/myPage/sendingReview" method = "post"> --%>
                                            <!-- 섹선1------------------------------------------------------------>
                                            <section class="title">
                                                <div class="title_image">
                                                    <img src="/resources/images/bananaTree.png" alt="">
                                                </div>
                                                <p>거래 후기</p>
                                                <div class="title_image">
                                                    <img src="/resources/images/bananaTree.png" alt="">
                                                </div>
                                            </section>
                                            <!-- 섹선2------------------------------------------------------------->
                                            <section class="question1">
                                                <%-- <p>${loginMember.memberNickname}님,</p> --%>
                                                <p>${loginMember.memberNickname}님,</p>
                                                
                                                <p><span id="buyerNickname"></span> 과의 거래가 어떠셨나요?</p>

                                                <p>거래선호도는 나만 볼 수 있어요</p>
                                                <div class="choice">
                                                    <div>
                                                        <input type="checkbox" name="badchoice" class="badchoice" id="badchoice" value="badchoice"> <label for="badchoice"></label>
                                                        <p>별로예요</p>
                                                    </div>
                                                    <div>
                                                        <input type="checkbox" name="goodchoice" class="goodchoice" id="goodchoice" value="goodchoice"> <label for="goodchoice"></label>
                                                        <p>최고예요</p>
                                                    </div>
                                                    <!-- <a href="javascript:doDisplay();">별로예요</a> -->
                                                </div>
                                            </section>
                                            <section id="goodsection">
                                                <!-- 섹선3(1)------------------------------------------------------------->
                                                <section class="question">
                                                    <div class="question_leaf">
                                                        <img src="/resources/images/2leaf.png" alt="">
                                                    </div>
                                                    <p>어떤 점이 최고였나요?</p>
                                                </section>
                                                <!-- 섹선4(1)------------------------------------------------------------->
                                                <section class="goodAnswer" id="goodAnswer">
                                                    <div>
                                                        <input type="checkbox" name="good" id="good1" value="1" class="chk"> <label for="good1">나눔을 해주셨어요</label>
                                                    </div>
                                                    <div>
                                                        <input type="checkbox" name="good" id="good2" value="2" class="chk"> <label for="good2">상품상태가 설명한것과 같아요</label>
                                                    </div>
                                                    <div>
                                                        <input type="checkbox" name="good" id="good3" value="3" class="chk"> <label for="good3">상품설명이 자세해요</label>
                                                    </div>
                                                    <div>
                                                        <input type="checkbox" name="good" id="good4" value="4" class="chk"> <label for="good4">좋은 상품을 저렴하게 판매해요</label>
                                                    </div>
                                                    <div>
                                                        <input type="checkbox" name="good" id="good5" value="5" class="chk"> <label for="good5">시간약속을 잘 지켜요</label>
                                                    </div>
                                                    <div>
                                                        <input type="checkbox" name="good" id="good6" value="6" class="chk"> <label for="good6">응답이 빨라요</label>
                                                    </div>
                                                    <div>
                                                        <input type="checkbox" name="good" id="good7" value="7" class="chk"> <label for="good7">친절하고 매너가 좋아요</label>
                                                    </div>
                                                </section>
                                            </section>
                                            <section id="badsection">
                                                <!-- 섹선3(2)------------------------------------------------------------->
                                                <section class="question">
                                                    <div class="question_leaf">
                                                        <img src="/resources/images/2leaf.png" alt="">
                                                    </div>
                                                    <p>어떤 점이 별로였나요?</p>
                                                </section>
                                                <!-- 섹션4(2)------------------------------------------------------- -->
                                                <section class="badAnswer" id="badAnswer">
                                                    <!-- 원래 id :  -->
                                                    <div>
                                                        <input type="checkbox" name="bad" id="bad1" value="8" class="chk" > <label for="bad1">원하지 않는 가격을 계속 요구해요</label>
                                                    </div>
                                                    <div>
                                                        <input type="checkbox" name="bad" id="bad2" value="9" class="chk"> <label for="bad2">시간약속을 안 지켜요</label>
                                                    </div>
                                                    <div>
                                                        <input type="checkbox" name="bad" id="bad3" value="10" class="chk"> <label for="bad3">예약만 하고 거래 시간을 명확하게 알려주지 않아요</label>
                                                    </div>
                                                    <div>
                                                        <input type="checkbox" name="bad" id="bad4" value="11" class="chk"> <label for="bad4">거래 시간과 장소를 정한 후 거래 직전 취소했어요</label>
                                                    </div>
                                                    <div>
                                                        <input type="checkbox" name="bad" id="bad5" value="12" class="chk"> <label for="bad5">거래 시간과 장소를 정한 후 연락이 안돼요</label>
                                                    </div>
                                                    <div>
                                                        <input type="checkbox" name="bad" id="bad6" value="13"class="chk"> <label for="bad6">약속 장소에 나타나지 않았어요</label>
                                                    </div>
                                                    <div>
                                                        <input type="checkbox" name="bad" id="bad7" value="14" class="chk"> <label for="bad7">상품 상태가 설명과 달라요</label>
                                                    </div>
                                                    <div>
                                                        <input type="checkbox" name="bad" id="bad7" value="15" class="chk"> <label for="bad7">반말을 사용해요</label>
                                                    </div>
                                                    <div>
                                                        <input type="checkbox" name="bad" id="bad7" value="16" class="chk"> <label for="bad7">불친절해요</label>
                                                    </div>
                                                </section>
                                            </section>
                                            <!-- 섹선5------------------------------------------------------------->
                                            <section>
                                                <div class="question">
                                                    <div class="question_leaf">
                                                        <img src="/resources/images/2leaf.png" alt="">
                                                    </div>
                                                    <p>따뜻한 거래경험을 알려주세요</p>
                                                </div>
                                                <p class="questionNext">남겨주신 거래후기는 상대방의 프로필에 공개돼요.</p>
                                            </section>
                                            <!-- 섹선6------------------------------------------------------------->
                                            <section>
                                                <textarea name="reviewText" id="reviewText" class="answer2" cols="30" rows="10" placeholder="내용을 입력해주세요."></textarea>

                                            </section>
                                            <!-- 섹선6------------------------------------------------------------->
                                            <section class="submitBtn">
                                                <button id=submitButton>제출하기</button>
                                            </section>
                                            </form>
                                        </div>
                                        <!--팝업 버튼 영역-->
                                        <!-- <div class="popup_btn" style="float: bottom; margin-top: 100px;">
                                                <a href="javascript:closePop();">닫기</a>
                                            </div> -->
                                    </div>
                                </div>
                                <div class="popup_layer2" id="popup_layer2" style="display: none;">
                                    <div class="popup_box2  ">
                                        <!-- <div  style="height: 10px; width: 375px; float: top;">
                                        <a href="javascript:closePop();"><i class="fa-solid fa-x" id = "fa-x"></i></a>
                                        </div> -->
                                        <!--팝업 컨텐츠 영역-->
                                        <div class="popup_cont2 " id = "popup_con2">
                                            <!-- ♥ 여기 안에다가 넣자 ♥-->
                                            <section class="send_message1">
                                                <p><span id="nickName1"></span>님에게 따뜻한 후기를 보냈어요!</p>
                                                <p><span id="nickName2"></span>님과 <span id="goodsTitle"></span>를 거래했어요!</p>
                                            </section>
                                            <section class="send_message2">
                                                <ul id = "messageList">
                                                
                                                </ul>
                                            
                                            </section>
                                            <section class="send_message3">
                                                <div>
                                                    <a href="javascript:closePop2();"><button>받은 후기 보기</button>
                                                </div>
                                                </a> <img src="/resources/images/2leaf.png" alt="">
                                            </section>
                                        </div>
                                        <!--팝업 버튼 영역-->
                                        <!-- <div class="popup_btn" style="float: bottom; margin-top: 100px;">
                                        <a href="javascript:closePop();">닫기</a>
                                        </div> -->
                                    </div>
                                </div>
							
                </section>  
            </section>    
		</div>
	</main>


	<%-- footer.jsp.include --%>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        let myPageCt

        if(${param.myPageCt != null}) {
            myPageCt = ${param.myPageCt};
        } else {
            myPageCt = 1;
        }

        let loginMemberNo

        loginMemberNo = ${loginMember.memberNo};
    </script>
    <!-- jQuery 라이브러리(.js 파일) 추가(CDN 방식) -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	<script src="/resources/js/lsy/addPop.js"></script>
	<script src="/resources/js/lsy/review_survey.js"></script>
</body>

</html>