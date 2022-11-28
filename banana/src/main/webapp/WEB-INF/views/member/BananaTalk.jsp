<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 문자열 관련 메서드를 제공하는 JSTL (EL형식) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>

    <%--폰트 어썸  https://fontawesome.com/ key --%>
    <script src="https://kit.fontawesome.com/f7459b8054.js"crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1023652dd4.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/resources/css/hyodong/BananaTalk_Header-footer.css">
    <link rel="stylesheet" href="/resources/css/hyodong/BananaTalk.css">

</head>
<body> 
    <main>
        <!-- header 시작----------------------------------------------------------------------------------------- -->
        <header>
            <!-- <section class="section-topmenu">
            </section> -->
            <section class="section-query">
                <!-- 바나나 로고 -->
                <div class="query__area">
                    <a href="/"> 
                        <img src="/resources/images/banana-logo.png" id="logo-img">
                    </a>
                    <div class="query__logo">
                        <p>바꾸고 나누자 나랑</p>
                        <p id="query__banana">Banana Market</p>
                    </div>
                </div>
                <!-- 프로필관련 -->
                <div class="profil">
                    <img class="profilImages" src="/resources/images/user.png" >
                    <div class="profilName">${loginMember.memberNickname}</div>
                </div>
            </section>
        </header>
        <!-- header 끝----------------------------------------------------------------------------------------- -->
        <div class="bananaTalk">
            <div id="mainBox">
                <!--------------------- 채팅 프로필 --------------------->
                <div id="chatProfile">
                    
                    <!-- User프로필1 -->
                    <div class="user1Profile">
                        <img class="talkProfileImages" src="/resources/images/banana-logo.png">
                        <div class="name">바나나</div>
                        <div class="talkClockAlarm">
                            <div class="talkClock">오후 09:10</div>
                            <div class="talkAlarm"> 1</div>
                        </div>
                    </div>
                    <!-- User프로필2 -->
                    <div class="user1Profile">
                        <img class="talkProfileImages" src="/resources/images/hyodongProfile/emoticon_1.gif">
                        <div class="name">모코코안녕</div>
                        <div class="talkClockAlarm">
                            <div class="talkClock">오후 09:10</div>
                            <div class="talkAlarm"> 5</div>
                        </div>
                    </div>

                    <!-- User프로필2 -->
                    <div class="user1Profile">
                        <img class="talkProfileImages" src="/resources/images/hyodongProfile/emoticon_2.gif">
                        <div class="name">모코코하트</div>
                        <div class="talkClockAlarm">
                            <div class="talkClock">오후 09:10</div>
                            <div class="talkAlarm"> 8</div>
                        </div>
                    </div>

                    <!-- User프로필2 -->
                    <div class="user1Profile">
                        <img class="talkProfileImages" src="/resources/images/hyodongProfile/emoticon_4.gif">

                        <div class="name">모코코화난다!!</div>
                        <div class="talkClockAlarm">
                            <div class="talkClock">오후 09:10</div>
                            <div class="talkAlarm"> 12</div>
                        </div>
                    </div>

                    <!-- User프로필2 -->
                    <div class="user1Profile">
                        <img class="talkProfileImages" src="/resources/images/hyodongProfile/emoticon_6.gif">

                        <div class="name">모코코신난다</div>
                        <div class="talkClockAlarm">
                            <div class="talkClock">오후 09:10</div>
                            <div class="talkAlarm"> 112</div>
                        </div>
                    </div>

                    <!-- User프로필2 -->
                    <div class="user1Profile">
                        <img class="talkProfileImages" src="/resources/images/hyodongProfile/emoticon_7.gif">

                        <div class="name">모코코파이팅</div>
                        <div class="talkClockAlarm">
                            <div class="talkClock">오후 09:10</div>
                            <div class="talkAlarm"> 2</div>
                        </div>
                    </div>

                    <!-- User프로필2 -->
                    <div class="user1Profile">
                        <img class="talkProfileImages" src="/resources/images/hyodongProfile/emoticon_8.gif">

                        <div class="name">모코코OTL</div>
                        <div class="talkClockAlarm">
                            <div class="talkClock">오후 09:10</div>
                            <div class="talkAlarm"> 1</div>
                        </div>
                    </div>

                    <!-- User프로필2 -->
                    <div class="user1Profile">
                        <img class="talkProfileImages" src="/resources/images/hyodongProfile/emoticon_9.gif">

                        <div class="name">모코코씨앗</div>
                        <div class="talkClockAlarm">
                            <div class="talkClock">오후 09:10</div>
                            <div class="talkAlarm"> 12</div>
                        </div>
                    </div>

                    <!-- User프로필2 -->
                    <div class="user1Profile">
                        <img class="talkProfileImages" src="/resources/images/hyodongProfile/emoticon_10.gif">

                        <div class="name">모코코몰루?</div>
                        <div class="talkClockAlarm">
                            <div class="talkClock">오후 09:10</div>
                            <div class="talkAlarm"> 12</div>
                        </div>
                    </div>

                    <!-- User프로필2 -->
                    <div class="user1Profile">
                        <img class="talkProfileImages" src="/resources/images/hyodongProfile/emoticon_11.gif">

                        <div class="name">모코코우왕</div>
                        <div class="talkClockAlarm">
                            <div class="talkClock">오후 09:10</div>
                            <div class="talkAlarm"> 12</div>
                        </div>
                    </div>

                    <!-- User프로필2 -->
                    <div class="user1Profile">
                        <img class="talkProfileImages" src="/resources/images/banana-logo.png">
                        <div class="name">내려간다~~</div>
                        <div class="talkClockAlarm">
                            <div class="talkClock">오후 09:10</div>
                            <div class="talkAlarm"> 12</div>
                        </div>
                    </div>

                    <!-- User프로필2 -->
                    <div class="user1Profile">
                        <img class="talkProfileImages" src="/resources/images/banana-logo.png">
                        <div class="name">내주식처럼</div>
                        <div class="talkClockAlarm">
                            <div class="talkClock">오후 09:10</div>
                            <div class="talkAlarm"> 12</div>
                        </div>
                    </div>

                    <!-- User프로필2 -->
                    <div class="user1Profile">
                        <img class="talkProfileImages" src="/resources/images/banana-logo.png">
                        <div class="name">내려간다ㅏㅏ</div>
                        <div class="talkClockAlarm">
                            <div class="talkClock">오후 09:10</div>
                            <div class="talkAlarm"> 12</div>
                        </div>
                    </div>

                    <!-- User프로필2 -->
                    <div class="user1Profile">
                        <img class="talkProfileImages" src="/resources/images/banana-logo.png">
                        <div class="name">진짜 끝!!</div>
                        <div class="talkClockAlarm">
                            <div class="talkClock">오후 09:10</div>
                            <div class="talkAlarm"> 12</div>
                        </div>
                    </div>

                </div>
                <!--------------------- 채팅 내용박스 --------------------->
                <div id="chatBoxMain">
                    <!-- 채팅박스 상단 상품  -->
                    <div id="productInforBox">
                        <div class="productImgBox">
                            <img class="productImgBox1"src="\banana\src\main\webapp\resources\images\hydong-test-RTX4090.jpg">
                        </div>
                        <div class="productNamePrice">
                            <div class="productNameArea">
                                <div class="productStatus">거래완료</div>
                                <div class="productName">RTX4090 누가좀 사주세요 제발 가지고싶다111</div>
                            </div>
                            <div class="productPrice">2,500,000 원</div>
                        </div>
                        <div class="Declaration">
                            <!-- 신고버튼 -->
                            <a href="">
                                <i class="fa-regular fa-bell-slash"></i>
                            </a>
                        </div>
                    </div> 

                    <!-- 채팅박스 -->
                    <div id="chatBox">
                    <!-- 메시지 시작 날짜 -->
                        <div class="date-line">
                            <time datetime="2021-03-29">2021년 3월 29일 월요일</time>
                        </div>
                        <!-- 채팅내용 -->
                        <div class="main-chat">
                            <!-- 내채팅 -->
                            <div class="me-chat">        
                                <div class="me-chat-col">
                                    <span class="balloon">내려간다~~</span>
                                </div>
                                <time datetime="09:30:00+09:00">오전 9:30</time>
                            </div>

                            <!-- 상대채팅 -->
                            <div class="friend-chat">
                                <img class="profile-img" src="/resources/images/user.png" alt="상대방프로필사진">
                                <div class="friend-chat-col">
                                    <span class="profile-name">바나나</span>
                                    <span class="balloon">저 바닫으로~~</span>
                                    <span class="balloon">떨어지는 별똥별마냥</span>
                                    <span class="balloon">땅에 추락한다</span>
                                </div>
                                <time datetime="10:15:00+09:00">오전 10:15</time>
                            </div>

                            <!-- 내채팅 -->
                            <div class="me-chat">        
                                <div class="me-chat-col">
                                    <span class="balloon">더 내려간다</span>
                                    <span class="balloon">바닷속으로</span>
                                    <span class="balloon">납작하게</span>
                                    <span class="balloon">엎드려있는</span>
                                </div>
                                <time datetime="10:30:00+09:00">오전 10:30</time>
                            </div>

                            <!-- 상대채팅 -->
                            <div class="friend-chat">
                                <img class="profile-img" src="/resources/images/banana-logo.png" alt="상대방프로필사진">
                                <div class="friend-chat-col">
                                    <span class="profile-name">바나나</span>
                                    <span class="balloon">가자미 처럼</span>
                                    <span class="balloon">내려간다</span>
                                    <span class="balloon">답이없다..</span>
                                    <span class="balloon">떨어지는 내 주식처럼</span>
                                    <span class="balloon">ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ</span>
                                </div>
                                <time datetime="10:35:00+09:00">오전 10:35</time>
                            </div>
                            <!-- 내채팅 -->
                            <div class="me-chat">        
                                <div class="me-chat-col">
                                    <span class="balloon">내려간다~~</span>
                                </div>
                                <time datetime="09:30:00+09:00">오전 9:30</time>
                            </div>

                            <!-- 상대채팅 -->
                            <div class="friend-chat">
                                <img class="profile-img" src="/resources/images/banana-logo.png" alt="상대방프로필사진">
                                <div class="friend-chat-col">
                                    <span class="profile-name">바나나</span>
                                    <span class="balloon">저 바닫으로~~</span>
                                    <span class="balloon">떨어지는 별똥별마냥</span>
                                    <span class="balloon">땅에 추락한다</span>
                                </div>
                                <time datetime="10:15:00+09:00">오전 10:15</time>
                            </div>

                            <!-- 내채팅 -->
                            <div class="me-chat">        
                                <div class="me-chat-col">
                                    <span class="balloon">더 내려간다</span>
                                    <span class="balloon">바닷속으로</span>
                                    <span class="balloon">납작하게</span>
                                    <span class="balloon">엎드려있는</span>
                                </div>
                                <time datetime="10:30:00+09:00">오전 10:30</time>
                            </div>

                            <!-- 상대채팅 -->
                            <div class="friend-chat">
                                <img class="profile-img" src="/resources/images/banana-logo.png" alt="상대방프로필사진">
                                <div class="friend-chat-col">
                                    <span class="profile-name">바나나</span>
                                    <span class="balloon">가자미 처럼</span>
                                    <span class="balloon">내려간다</span>
                                    <span class="balloon">답이없다..</span>
                                    <span class="balloon">떨어지는 내 주식처럼</span>
                                    <span class="balloon">ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ</span>
                                </div>
                                <time datetime="10:35:00+09:00">오전 10:35</time>
                            </div>


                        </div>
                    </div>
                    <!-- 채팅 내용 입력 박스 -->
                    <div id="chattingBox">
                        <form name="chatform" action="#" method="post"  class="chatForm">
                            <textarea id="chattingInput" name="chat-insert"placeholder="메세지를 입력하세요." required></textarea>
                            <input type="submit" class="chat-submit" id="chat-submit" value="전송">
                            <label for="chat-submit">
                                <div class="chatSubmit" >전송</div>
                            </label>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>