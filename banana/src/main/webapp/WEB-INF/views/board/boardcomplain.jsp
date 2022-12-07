<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="goodsInfo" value="${map.goodsInfo}" />
<c:set var="goodsImg" value="${map.goodsImg}" />
<c:set var="sellerInfo" value="${map.sellerInfo}" />
<c:set var="sellerGoods" value="${map.sellerGoods}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon"  sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>게시글 신고하기 페이지</title>
    <link rel="stylesheet" href="/resources/css/chiwoo/popup.css">
    <link rel="stylesheet" href="/resources/css/chiwoo/board-com.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
</head>
<body>
    

    <main>
        <!-- header 시작----------------------------------------------------------------------------------------- -->
    
<!-- header 끝----------------------------------------------------------------------------------------- -->

        
        <section class="content"> 
            
        <%--     <a href="javascript:openPop()">
                <div>
                    팝업오픈!
                </div>
            </a>
 --%>

        <div class="popup_layer" id="popup_layer" style="display: none;">
            <div class="popup_box">
                <div style="height: 10px; width: 375px; float: top;">
                    <a href="javascript:closePop();"><i class="fa-solid fa-x"></i></a>
                </div>
                <!--팝업 컨텐츠 영역-->
            
                <div class="b-report-top">


                    <%--  2페이지에서 1페이지로 가는 뒤로가기 --%>
                    <i class="fa-solid fa-arrow-left-long" id="b_back1"></i>

                    <%-- 3페이지에서 2페이지로 가는 뒤로가기 --%>
                    <i class="fa-solid fa-arrow-left-long" id="b_back2"></i>

                    <span id="board-com">게시글 신고</span>
                </div>
                


                <div>
                    <div class="b-report-why">
                        <div><input type = "hidden" name="complained" value = "${sellerInfo.memberNickname}"></div>
                        <p>
                            ${sellerInfo.memberNickname}님의 게시글을 신고하는 이유를 말씀해주세요
                        </p>
                    </div>

                    

                    
                    <div id="b_click">
                        <div class="b-report-reason b_abc"  id ="b_abc1">
                            <div>판매 금지 물품이에요 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason b_abc" id ="b_abc2">
                            <div>중고 거래 게시글이 아니에요 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason b_abc" id="b_abc3">
                            <div> 전문 판매업자 같아요 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason b_abc"  id="b_abc4">
                            <div>사기 글이에요 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason b_abc"  id="b_abc5">
                            <div div>기타 사유 선택 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                    </div>
                    
                    <div id="b_click1">
                        <div class="b-report-reason">
                            <div>생명 거래 : 식물 제외 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div> 의약품, 의료기기, 건강기능식품 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div>상표권 침해 : 가품, 이미테이션 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div >청소년 유해 : 주류, 담배, 라이터 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div >청소년 유해 : 음란물, 성인물, 성인용품 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div >콘텍트 렌즈, 도수 있는 안경 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div >개인정보 : 신분증, 통장, 계정 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div >무허가 식품 : 수제, 음식, 개봉 식품 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div >상업적인 핸드메이드<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div >불법 기기: 안전인증 누락, 불법 개조, 렌탈<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div >상업적인 핸드메이드<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div >불법 유사 의료 행위 : 반영구, 문신<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div >위험한 물품 : 총포, 도검, 전자충격기<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div >군용품 : 신형 군복, 군용장구, 군수품<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div >유해 화학 물질 : 농약, 환각물질<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div>유류 : 경유, LPG, 휘발유<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div>정부 제공 : 재난지원금, 쌀 꾸러미, 지역상품권, 종량제봉투<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div>화장품 샘플<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div div>조건이 달린 무료나눔<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div>기타 : 헌혈증, 초대권, 암표, 데이터, USD 1000 이상<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                    </div>
                    
                    <div id="b_click2"> 
                        <div class="b-report-reason" >
                            <div>지역업체 소개 / 광고 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                                <div>부동산 거래 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                                <div> 중고차 판매 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div>농수산물 판매 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                                <div div>구인 구직 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div div>과외/ 클래스 모집 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div div>비방/저격 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div div>일반 게시글(잡담, 질문 등) <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                    </div>
                    
                    <div id="b_click3">
                        <div class="b-report-reason" >
                            <div>여러 계정으로 같은 물건을 팔아요 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div>한 계정으로 같은 물거늘 상업적으로 팔아요 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div> 인터넷 쇼핑몰을 홍보하는 판매업자 같아요 <i class="fa-solid fa-chevron-right"></i></div>        
                        </div>
                    </div>
                    
                    <div id="b_click4">
                        <div class="b-report-reason" >
                                <div>카톡/문자 등 당근채팅 밖에서 대화를 유도해요 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                                <div>가짜 안전결제/ 안전거래 사이트 링크를 보내요<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                                <div> 특수문자/ 사진 등 계좌/ 전화번호를 이상하게 보내요 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                                <div>입금했는데 판매자가 물건을 주지 않고 잠적했어요<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                                <div div>물건을 보냈는데 구매자가 입금하지 않고 잠적했어요 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                    </div>
                    
                    <div id="b_click5">
                        <div class="b-report-reason" >
                            <div>사용할 수 없는 상품 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                                <div>중복 게시글 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div> 상품 설명 부족<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div>나에게 구매 후 비싸게 재판매 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div>거래/환불 분쟁 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div>신고 항목 제안 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="b-report-reason">
                            <div>무료나눔 / 금전 요구 글<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                    </div>
                    
                    
                    
                    <!--  <div class="report-other">
                            <a href="#">
                                <div>기타 <i class="fa-solid fa-chevron-right"></i></div>
                            </a>
                        </div> -->
                        
                </div>
                    
                    
                <div>
                    <div id="fin">
                        <div class="report-user">
                            <p>혹시 ${sellerInfo.memberNickname}님을 신고하고싶으신가요?</p>
                        </div>

                        <div class="b-report-reason" id="b_click6">
                            <div> 
                                사용자 신고하러 가기 <i class="fa-solid fa-chevron-right"></i>
                            </div>
                        </div>

                    
                    </div>
                        
                        
                        
                    <form id="reportsubmit" action = "/reportsubmit" method = "POST">
                        <div class="frame">
                         <%--    <div class="b-report-confirm">
                                <p> ${ctg2.value}신고사유</p>
                            </div> --%>
                    
                        <%--       <div class="content-block">
                                <input type="checkbox" name = "block">이 사람과 글을 보고싶지 않아요
                            </div> --%>
                    
                    
                            <div class="b-report-submit">
                            
                                <div class="notice">
                                        <p>
                                        신고 내용은 상대에게 노출되지 않아요.<br>
                                        내용이 사실과 다를 경우 이용 제제를 받을 수 있으니 주의해 주세요.
                                        </p>
                                </div>
                                <div class="textbox">
                                    <textarea name="reportbox" id="reportbox" cols="90" rows="5" placeholder="혹시 불쾌한 일을 겪으셨나요? 사유를 남겨주세요" ></textarea>
                                        
                                </div><br>
                                <button type="submit" id = "b-report-submit-button" >바나나 팀에게 보내기</button>
                            </div>
                        </div>
                        <input id= "b_ctg1" type="hidden" name="b_ctg1" value="">
                        <input id= "b_ctg2" type="hidden" name="b_ctg2" value="">
                        <input id= "memberNo2" type = "hidden" name="memberNo2" value= "${sellerInfo.memberNo}" >
                        <input id= "goodsNo2" type = "hidden" name="goodsNo2" value="${goodsInfo.goodsNo}">
                    </form>
                    <!--팝업 버튼 영역-->
                    <!-- <div class="popup_btn" style="float: bottom; margin-top: 300px;">
                        <a href="javascript:closePop();">닫기</a>
                    -->
                </div> 
            </div>
        </div>
                
            

        </section>
    </main>

    

    
<!-- footer 시작----------------------------------------------------------------------------------------- -->


    <!-- footer 끝----------------------------------------------------------------------------------------- -->

  
    <script src="/resources/js/chiwoo/boardcomplain.js"></script>

    <%-- <script src="/resources/js/chiwoo/usercomplain.js"></script> --%>
</body>
</html>