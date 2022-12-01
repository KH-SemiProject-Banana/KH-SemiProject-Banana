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
                <!--------------------- 채팅 리스트 --------------------->
                <div id="chatting-list">
                    <!-- User프로필1 -->
                    <%-- <div class="userProfile">
                        <img class="talkProfileImages" src="/resources/images/banana-logo.png">
                        <div class="name">바나나</div>
                        <div class="talkClockAlarm">
                            <div class="talkClock">오후 09:10</div>
                            <div class="talkAlarm"> 1</div>
                        </div>
                    </div> --%>

                    <c:forEach var="room" items="${roomList}">
                        <%--  id == 채팅방 번호 --%>
                        <li class="chatting-item" id="${room.chattingNo}-${room.targetNo}">
                            
                            <div class="item-header">  <%-- 프로필이미지 --%>
                                <c:if test="${not empty room.targetProfile}">
                                    <img class="list-profile" src="${room.targetProfile}">
                                </c:if>
                                <c:if test="${empty room.targetProfile}">
                                    <img class="list-profile" src="/resources/images/user.png">
                                </c:if>
                            </div>
                            <%-- 선!!! --%>
                            <div class="item-body">
                                <p>
                                    <span class="target-name">${room.targetNickName}</span><%-- 닉네임 --%>
                                    <span class="recent-send-time">${room.sendTime}</span><%-- 채팅시간 --%>
                                </p>
                                <div>
                                    <p class="recent-message">${room.lastMessage}</p><%-- 채팅메세지 --%>
                                    <c:if test="${room.notReadCount > 0}"> 
                                        <p class="not-read-count">${room.notReadCount}</p><%-- 메세지 왔을때 카운트 --%>
                                    </c:if>
                                </div>
                            </div>
                        </li>
                    </c:forEach>







                </div>
                <!--------------------- 채팅 내용박스 --------------------->
                <div id="chatBoxMain">
                    <!--------- 채팅박스 상단 상품 시작 --------->
                    <div id="productInforBox">
                        <div class="productImgBox">
                            <img class="productImgBox1"src="\resources\images\hydong-test-RTX4090.jpg">
                        </div>
                        <div class="productNamePrice">
                            <div class="productNameArea">
                                <div class="productStatus">거래완료</div>
                                <div class="productName">RTX4090 누가좀 사주세요 제발 가지고싶다</div>
                            </div>
                            <div class="productPrice">2,500,000 원</div>
                        </div>
                        <div class="Declaration">
                            <!-- 신고버튼 -->
                            <a href="javascript:openPop()">
                                <i class="fa-regular fa-bell-slash"></i>
                            </a>
                        </div>
                    </div> 
                    <!--------- 채팅박스 상단 상품 시작 끝--------->


                    <!-- 채팅박스 -->
                    <div  class="chatting-content">
                        <!-- 채팅내용 -->
                        <div class="display-chatting">
                        
                            <!-- 메시지 시작 날짜 -->
                            <div class="date-line">
                                <day datetime="2021-03-29">2021년 3월 29일 월요일</day>
                            </div>

                            <!-- 내채팅 -->
                            <div class="my-chat">        
                                <div class="my-chat-col">
                                    <span class="chat">더 내려간다</span>
                                    <span class="chat">바닷속으로</span>
                                    <span class="chat">납작하게</span>
                                    <span class="chat">엎드려있는ㅇㅇㅇㅇㅇㅇ</span>
                                </div>
                                <time class="chatDate">오전 10:30</time>
                            </div>

                            <!-- 상대채팅 -->
                            <div class="target-chat">
                                <img class="profile-img" src="/resources/images/user.png" alt="상대방프로필사진"> 
                                <div class="target-chat-col">
                                    <span class="profile-name">바나나</span>
                                    <span class="chat">가자미 처럼</span>
                                    <span class="chat">내려간다</span>
                                    <span class="chat">답이없다..</span>
                                    <span class="chat">떨어지는 내 주식처럼</span>
                                    <span class="chat">떨어지는 내 주식처럼</span>
                                    <span class="chat">떨어지는 내 주식처럼</span>
                                    <span class="chat">떨어지는 내 주식처럼</span>
                                    <span class="chat">떨어지는 내 주식처럼</span>
                                    <span class="chat">떨어지는 내 주식처럼</span>
                                    <span class="chat">떨어지는 내 주식처럼</span>
                                    <span class="chat">떨어지는 내 주식처럼</span>
                                    <span class="chat">떨어지는 내 주식처럼</span>
                                    <span class="chat">떨어지는 내 주식처럼</span>
                                    <span class="chat">ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ</span>
                                </div>
                                <time class="chatDate">오전 10:35</time>
                            </div>

                        </div>

                        <!-- 채팅 내용 입력 박스 -->
                        <div id="input-area">
                            <textarea id="inputChatting" name="chat-insert"placeholder="메세지를 입력하세요." required></textarea>
                            <button id="send" >전송</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- https://github.com/sockjs/sockjs-client -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script>
		// 로그인한 회원 번호
		const loginMemberNo = "${loginMember.memberNo}";

		// 게시판에서 사용자 닉네임을 눌러서 채팅 화면으로 넘어온 경우 
		// 그 때 전달 된 채팅방 번호를 저장하는 변수
		const tempNo = "${chattingNo}"; 
	</script>
    <script src="/resources/js/hyodong/chatting/chatting.js"></script>

</body>
</html>