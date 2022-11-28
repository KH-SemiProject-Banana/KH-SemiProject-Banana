<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="boardName" value="${boardTypeList[boardCode-1].BOARD_NAME}"/>

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
                </div>
                
    
                    <div class="frequent-question__content">
                        <a  class="frequent-question__content-detail"  onclick="this.nextElementSibling.style.display=(this.nextElementSibling.style.display=='none')?'block':'none'; ">                    
                            <i class="fa-solid fa-circle-question"></i>
                            <div  class="frequent-question__content">
                                <p>판매할 물품은 어떻게 올리나요?</P>
                            </div>
                        </a>
                        <div class="area" style="display:none">
                            <div class="profile">
                                <div class="profile-img">
                                    <img src="/resources/images/banana-logo.png" id="admin-img">
                                </div>
                                <div class="name-date">
                                    <p class= "nickname" id="admin-name">바나나마켓_운영지원팀</p>
                                    <!-- <p id="question-date">2022.10.21 오후 6:22</p> -->
                                </div>
                            </div>
                            <div class="question-content">
                                <p name="content" id="user-content" >
                                    헬로마켓 웹사이트 상단 [판매하기] 버튼을 누르시고 상품의 사진과 정보를 입력하여 등록해주시면 됩니다.  <br>
                                </p>
                            </div>
                        </div>
                    </div>
    

                    <div class="frequent-question__content">
                        <a class="frequent-question__content-detail" onclick="this.nextElementSibling.style.display=(this.nextElementSibling.style.display=='none')?'block':'none'; ">                
                            <i class="fa-solid fa-circle-question"></i>
                            <div  class="frequent-question__content">[상품] 판매금지 상품이 있나요?</div>
                        </a>
                        <div class="area" style="display:none">
                            <div class="profile">
                                <div class="profile-img">
                                    <img src="/resources/images/banana-logo.png" id="admin-img">
                                </div>
                                <div class="name-date">
                                    <p class= "nickname" id="admin-name">바나나마켓_운영지원팀</p>
                                    <!-- <p id="question-date">2022.10.21 오후 6:22</p> -->
                                </div>
                            </div>
                            <div class="question-content">
                                <p name="content" id="user-content" >
                                    아래의 거래부적합 상품은 이용약관 및 현행 법률에 따라 마켓 내 등록 및 거래를 금지합니다.<br><br>

                                    - 주류<br>
                                    - 담배<br>
                                    - 의약품<br>
                                    - 도수 있는 안경, 콘택트렌즈<br>
                                    - 개인정보(신분증, 게임계정 등)<br>
                                    - 성인용품(콘돔 제외)<br>
                                    - 불법복제품<br>
                                    - 반려동물<br>
                                    - 안전확인, 인전인증을 받지 않은 단전지<br><br>

                                    보다 자세한 내용은 헬로마켓 이용약관에서 확인하실 수 있습니다.<br>
                                </p>
                            </div>
                        </div>
                    </div>
    

                    <div class="frequent-question__content">
                        <a class="frequent-question__content-detail" onclick="this.nextElementSibling.style.display=(this.nextElementSibling.style.display=='none')?'block':'none'; ">                    
                            <i class="fa-solid fa-circle-question"></i>
                            <div  class="frequent-question__content">[상품] 어떻게 하면 더 잘 팔릴 수 있나요?</div>
                        </a>
                        <div class="area" style="display:none">
                            <div class="profile">
                                <div class="profile-img">
                                    <img src="/resources/images/banana-logo.png" id="admin-img">
                                </div>
                                <div class="name-date">
                                    <p class= "nickname" id="admin-name">바나나마켓_운영지원팀</p>
                                    <!-- <p id="question-date">2022.10.21 오후 6:22</p> -->
                                </div>
                            </div>
                            <div class="question-content">
                                <p name="content" id="user-content" >
                                    1. 상품 상태를 꼼꼼히 적어주세요.<br>
                                    상품 설명이 자세할수록 구매자에게 신뢰를 주고 구매자의 질문에 반복적으로 답변할 필요 없이 신속하게 거래할 수 있습니다.<br><br>

                                    2. 직접 촬영한 사진이나 영상을 첨부해주세요.<br>
                                    상품의 상태를 잘 확인할 수 있는 상세 컷이나 착용사진 등이 판매에 도움이 됩니다.<br>
                                    상품의 특징을 더 잘 보여줄 수 있는 영상을 촬영하시면 더 빨리 판매할 수 있습니다.<br><br>

                                    3. 정확한 카테고리를 선택해서 등록해주세요.<br>
                                    올바른 카테고리에 등록하면 구매자가 상품을 더 잘 찾을 수 있습니다.<br><br>

                                    4. 상단업을 이용해보세요.<br>
                                    내 상품의 상세화면 하단에 [상단업] 버튼을 누르면 상품이 최신순으로 올라가서 구매자들에게 더 많이 노출되는 기회를 얻을 수 있습니다.<br>
                                </p>
                            </div>
                        </div>
                    </div>
    

                    <div class="frequent-question__content">
                        <a class="frequent-question__content-detail" onclick="this.nextElementSibling.style.display=(this.nextElementSibling.style.display=='none')?'block':'none';">                            
                            <i class="fa-solid fa-circle-question"></i>
                            <div class="frequent-question__content">[상품] 상품을 수정/삭제 하고 싶어요?</div>
                        </a>
                        <div class="area" style="display:none">
                            <div class="profile">
                                <div class="profile-img">
                                    <img src="/resources/images/banana-logo.png" id="admin-img">
                                </div>
                                <div class="name-date">
                                    <p class= "nickname" id="admin-name">바나나마켓_운영지원팀</p>
                                    <!-- <p id="question-date">2022.10.21 오후 6:22</p> -->
                                </div>
                            </div>
                            <div class="question-content">
                                <p name="content" id="user-content" >
                                    헬로마켓 웹사이트 [내프로필] > [나의메뉴] > 상품 상세 화면 [수정] 버튼을 누르면 수정/삭제 할 수 있습니다.<br>
                                </p>
                            </div>
                        </div>
                    </div>


                    <div class="frequent-question__content">
                        <a class="frequent-question__content-detail" onclick="this.nextElementSibling.style.display=(this.nextElementSibling.style.display=='none')?'block':'none';">                            
                            <i class="fa-solid fa-circle-question"></i>
                            <div class="frequent-question__content">[상품] 찜 상품은 무엇인가요?</div>
                        </a>
                        <div class="area" style="display:none">
                            <div class="profile">
                                <div class="profile-img">
                                    <img src="/resources/images/banana-logo.png" id="admin-img">
                                </div>
                                <div class="name-date">
                                    <p class= "nickname" id="admin-name">바나나마켓_운영지원팀</p>
                                    <!-- <p id="question-date">2022.10.21 오후 6:22</p> -->
                                </div>
                            </div>
                            <div class="question-content">
                                <p name="content" id="user-content" >
                                    관심있는 상품은 '찜' 기능으로 저장하고 찜 상품 목록에서 모아 볼 수 있습니다.<br><br>
    
                                    상품 상세화면 [하트 모양 아이콘]을 누르면 '찜'이 되고 다시 누르면 '찜'이 해제됩니다.
                                </p>
                            </div>
                        </div>
                    </div>
    

                    <div class="frequent-question__content">
                        <a class="frequent-question__content-detail" onclick="this.nextElementSibling.style.display=(this.nextElementSibling.style.display=='none')?'block':'none';">                            
                            <i class="fa-solid fa-circle-question"></i>
                            <div class="frequent-question__content">채팅을 보냈는데 답이 없어요</div>
                        </a>
                        <div class="area"style="display:none">
                            <div class="profile">
                                <div class="profile-img">
                                    <img src="/resources/images/banana-logo.png" id="admin-img">
                                </div>
                                <div class="name-date">
                                    <p class= "nickname" id="admin-name">바나나마켓_운영지원팀</p>
                                    <!-- <p id="question-date">2022.10.21 오후 6:22</p> -->
                                </div>
                            </div>
                            <div class="question-content">
                                <p name="content" id="user-content" >
상대회원이 장시간 무응답인 경우 바로 답변이 어려운 상황일 수 있습니다.<br><br>
또는 등록한지 여러 날이 경과한 상품은 이미 판매되었을 가능성도 있습니다.<br><br>
빠른 거래를 희망하실 경우 다른 상품도 검색해보시길 권유 드립니다.<br>
                                </p>
                            </div>
                        </div>
                    </div>
    

                    <div class="frequent-question__content">
                        <a class="frequent-question__content-detail" onclick="this.nextElementSibling.style.display=(this.nextElementSibling.style.display=='none')?'block':'none';">                           
                             <i class="fa-solid fa-circle-question"></i>
                            <div class="frequent-question__content">내 정보 수정은 어떻게 하나요?</div>
                        </a>
                        <div class="area" style="display:none">
                            <div class="profile">
                                <div class="profile-img">
                                    <img src="/resources/images/banana-logo.png" id="admin-img">
                                </div>
                                <div class="name-date">
                                    <p class= "nickname" id="admin-name">바나나마켓_운영지원팀</p>
                                    <!-- <p id="question-date">2022.10.21 오후 6:22</p> -->
                                </div>
                            </div>
                            <div class="question-content">
                                <p name="content" id="user-content">
바나나마켓 웹사이트 내 프로필을 클릭한 후<br><br>
[프로필수정] 을 눌러 회원님의 프로필 사진, 닉네임, 비밀번호, 자기소개 등을 수정할 수 있습니다.<br>                            
                                </p>
                            </div>
                        </div>
                    </div>

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