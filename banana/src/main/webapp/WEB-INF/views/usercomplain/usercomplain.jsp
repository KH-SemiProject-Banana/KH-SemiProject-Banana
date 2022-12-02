<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon"  sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>신고하기 페이지</title>

    <link rel="stylesheet" href="/resources/css/chiwoo/popup.css">
    <link rel="stylesheet" href="/resources/css/chiwoo/report.css">
    <link rel="stylesheet" href="/resources/css/style.css">

    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
                        <div class="report-top">

                            <%-- ctg1이 1, 2, 6, 7일 경우 2페이지에서 1페이지로 가는 뒤로가기 --%>
                            <i class="fa-solid fa-arrow-left-long" id="back1"></i>

                            <%-- ctg1이 1, 2, 6, 7일 경우 3페이지에서 2페이지로 가는 뒤로가기 --%>
                            <i class="fa-solid fa-arrow-left-long" id="back2"></i>

                            <%-- ctg1이 3, 4, 5, 8일 경우 3페이지에서 1페이지로 가는 뒤로가기 --%>
                            <i class="fa-solid fa-arrow-left-long" id="back3"></i>

                            <span id="user-com">사용자 신고</span>
                        </div>
                    <div>
                        <div class="report-why">
                            <div> ${memberNickname} </div>
                            <p>
                                ${memberNickname} 사용자를 신고하는 이유를 선택해주세요
                            </p>
                        </div>
                    
                    <div id="click">
                        <div class="report-reason abc" id = "abc1">
                            <div>전문 판매업자 같아요 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="report-reason abc" id = "abc2">
                            <div>비매너 사용자에요 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="report-reason abc" id="abc3">
                            <div> 욕설을 해요 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="report-reason abc"  id="abc4">
                            <div>성희롱을 해요<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="report-reason abc"  id="abc5">
                            <div>거래/환불 분쟁신고<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="report-reason abc"  id="abc6">
                            <div>사기당했어요<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="report-reason abc"  id="abc7">
                            <div>다른 문제가 있어요<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="report-reason abc"  id="abc8">
                            <div>연애 목적의 대화를 시도해요<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                    </div>
                    
                    <div id="click1">
                        <div class="report-reason def">
                            <div>전문 판매업자 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="report-reason def">
                            <div> 중고차 매매업자 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                    </div>
                    
                    <div id="click2"> 
                        <div class="report-reason" >
                            <div>반말을 사용해요 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="report-reason">
                            <div>불친절해요 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                    </div>
                    
                    <div id="click6">
                        <div class="report-reason" >
                            <div>카톡/문자 등 당근채팅 밖에서 대화를 유도해요 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="report-reason">
                            <div>가짜 안전결제/ 안전거래 사이트 링크를 보내요 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="report-reason">
                            <div> 특수문자/ 사진 등 계좌/ 전화번호를 이상하게 보내요 <i class="fa-solid fa-chevron-right"></i></div>        
                        </div>
                        <div class="report-reason">
                            <div> 입금했는데 판매자가 물건을 주지 않고 잠적했어요 <i class="fa-solid fa-chevron-right"></i></div>        
                        </div>
                        <div class="report-reason">
                            <div> 물건을 보냈는데 구매자가 입금하지 않고 잠적했어요 <i class="fa-solid fa-chevron-right"></i></div>        
                        </div>
                    </div>
                    
                
                    
                    <div id="click7">
                        <div class="report-reason" >
                            <div>불법 이용자 신고<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="report-reason">
                            <div>중복 게시글 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="report-reason">
                            <div> 프로필 사진 신고<i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="report-reason">
                            <div>불건전 닉네임 신고 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                        <div class="report-reason">
                            <div>채팅으로 정치/종교 대화를 시도해요 <i class="fa-solid fa-chevron-right"></i></div>
                        </div>
                    </div>   
                    
                    
                    
                    <!--  <div class="report-other">
                            <a href="#">
                                <div>기타 <i class="fa-solid fa-chevron-right"></i></div>
                            </a>
                        </div> -->
                        
                        
                        <form id="userreportsubmit" action = "/userreportsubmit" method="POST">
                            <div id="frame">
                                <div class="report-confirm">
                                    <a href="#">'신고목록'에서 선택한 이유</a>
                                </div>
                        
                                <div class="content-block">
                                    <input type="checkbox" >이 사람과 글을 보고싶지 않아요
                                </div>
                        
                                <div class="report-notice">
                                    ('나의 바나나> 설정 > 게시글 미노출 > 사용자 관리' 에서 취소할 수 있습니다.)
                                </div>
                                <div class="report-submit">
                                
                                <div class="notice">
                                        <p>
                                        신고 내용은 상대에게 노출되지 않아요. 
                                        내용이 사실과 다를 경우 이용 제제를 받을 수 있으니 주의해 주세요.
                                        </p>
                                </div>
                                <div class="textbox">
                                    <textarea name="reportbox" id="reportbox" cols="90" rows="5" placeholder="혹시 불쾌한 일을 겪으셨나요? 사유를 남겨주세요" ></textarea>
                                        
                                </div>
                                    <button type="submit" id = "reportsubmit">바나나 팀에게 보내기</button>
                                </div>
                            </div>
                            <input type="hidden" name="ctg1" value="">
                            <input type="hidden" name="ctg2" value="">
                        </form>
                    <!--팝업 버튼 영역-->
                    <!-- <div class="popup_btn" style="float: bottom; margin-top: 300px;">
                        <a href="javascript:closePop();">닫기</a>

                    </div> -->
                </div>
            </div>
                
            

        </section>
    </main>

    

    
<!-- footer 시작----------------------------------------------------------------------------------------- -->

    <!-- footer 끝----------------------------------------------------------------------------------------- -->

    
    <script src="/resources/js/chiwoo/usercomplain.js"></script>
    

</body>
</html>