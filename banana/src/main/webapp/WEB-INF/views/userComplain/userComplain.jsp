<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:set var="goodsInfo" value="${map.goodsInfo}" /> --%>
<c:set var="goodsInfo" value="${map.ProductInfor}" />



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon"  sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>유저 신고하기 페이지</title>

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
            <%-- div0 --%>
            <div class="popup_layer" id="popup_layer" style="display: block;">
                <%-- div1 --%>
                <div class="popup_box">
                    <%-- div1_1 --%>
                    <div style="height: 10px; width: 375px; float: top;">
                        <a href="javascript:closePop();"><i class="fa-solid fa-x"></i></a>
                    </div>
                    <!--팝업 컨텐츠 영역-->
                    <%-- div1_2 --%>
                    <div class="report-top">

                        <%-- ctg1이 1, 2, 6, 7일 경우 2페이지에서 1페이지로 가는 뒤로가기 --%>
                        <%-- div1_2_i1 --%>
                        <i class="fa-solid fa-arrow-left-long" id="back1"></i>

                        <%-- ctg1이 1, 2, 6, 7일 경우 3페이지에서 2페이지로 가는 뒤로가기 --%>
                        <%-- div1_2_i2 --%>
                        <i class="fa-solid fa-arrow-left-long" id="back2"></i>

                        <%-- ctg1이 3, 4, 5, 8일 경우 3페이지에서 1페이지로 가는 뒤로가기 --%>
                        <%-- div1_2_i3 --%>
                        <i class="fa-solid fa-arrow-left-long" id="back3"></i>
                        <%-- div1_2_span --%>
                        <span id="user-com">사용자 신고</span>
                    </div>

                    <%-- div1_3 --%>
                    <div>
                        <%-- div1_3_1 --%>
                        <div class="report-why">
                            <%-- div1_3_1_1 --%>
                            <div><input type = "hidden" name="complained" value = "${ProductInfor.memberNickname}"></div>
                            <%-- div1_3_1_2p --%>
                            <p>
                                ${ProductInfor.memberNickname}사용자를 신고하는 이유를 선택해주세요
                            </p>
                        </div>

                        <%-- div1_3_2 --%>                   
                        <div id="click">
                            <%-- div1_3_2_1 --%>
                            <div class="report-reason abc" id = "abc1">
                                <%-- div1_3_2_1_1 --%>
                                <div>전문 판매업자 같아요 <i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                            <%-- div1_3_2_2 --%>
                            <div class="report-reason abc" id = "abc2">
                                <%-- div1_3_2_2_1 --%>
                                <div>비매너 사용자에요 <i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                            <%-- div1_3_2_3 --%>
                            <div class="report-reason abc" id="abc3">
                                <%-- div1_3_2_3_1 --%>
                                <div> 욕설을 해요 <i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                            <%-- div1_3_2_4 --%>
                            <div class="report-reason abc"  id="abc4">
                                <%-- div1_3_2_4_1 --%>
                                <div>성희롱을 해요<i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                            <%-- div1_3_2_5 --%>
                            <div class="report-reason abc"  id="abc5">
                                <%-- div1_3_2_5_1 --%>
                                <div>거래/환불 분쟁신고<i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                            <%-- div1_3_2_6 --%>
                            <div class="report-reason abc"  id="abc6">
                                <%-- div1_3_2_6_1 --%>
                                <div>사기당했어요<i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                            <%-- div1_3_2_7 --%>
                            <div class="report-reason abc"  id="abc7">
                                <%-- div1_3_2_7_1 --%>
                                <div>다른 문제가 있어요<i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                            <%-- div1_3_2_8 --%>
                            <div class="report-reason abc"  id="abc8">
                                <%-- div1_3_2_8_1 --%>
                                <div>연애 목적의 대화를 시도해요<i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                        </div>
                        <%-- div1_3_3 --%>   
                        <div id="click1">
                            <%-- div1_3_3_1 --%>  
                            <div class="report-reason">
                                <%-- div1_3_3_1_1 --%>  
                                <div>전문 판매업자 <i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                            <%-- div1_3_3_2 --%>  
                            <div class="report-reason">
                                <%-- div1_3_3_2_1 --%>  
                                <div> 중고차 매매업자 <i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                        </div>
                        
                        <%-- div1_3_4 --%>  
                        <div id="click2"> 
                            <%-- div1_3_4_1 --%>  
                            <div class="report-reason" >
                                <%-- div1_3_4_1_1 --%>  
                                <div>반말을 사용해요 <i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                            <%-- div1_3_4_2 --%>  
                            <div class="report-reason">
                                <%-- div1_3_4_2_1 --%>  
                                <div>불친절해요 <i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                        </div>

                        <%-- div1_3_5 --%>  
                        <div id="click6">
                            <%-- div1_3_5_1 --%>  
                            <div class="report-reason" >
                                <%-- div1_3_5_1_1 --%>  
                                <div>카톡/문자 등 당근채팅 밖에서 대화를 유도해요 <i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                            <%-- div1_3_5_2 --%>  
                            <div class="report-reason">
                                <%-- div1_3_5_2_1 --%>  
                                <div>가짜 안전결제/ 안전거래 사이트 링크를 보내요 <i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                            <%-- div1_3_5_3 --%>  
                            <div class="report-reason">
                                <%-- div1_3_5_3_1 --%>  
                                <div> 특수문자/ 사진 등 계좌/ 전화번호를 이상하게 보내요 <i class="fa-solid fa-chevron-right"></i></div>        
                            </div>
                            <%-- div1_3_5_4 --%>  
                            <div class="report-reason">
                                <%-- div1_3_5_4_1 --%>  
                                <div> 입금했는데 판매자가 물건을 주지 않고 잠적했어요 <i class="fa-solid fa-chevron-right"></i></div>        
                            </div>
                            <%-- div1_3_5_5 --%>  
                            <div class="report-reason">
                                <%-- div1_3_5_5_1 --%> 
                                <div> 물건을 보냈는데 구매자가 입금하지 않고 잠적했어요 <i class="fa-solid fa-chevron-right"></i></div>        
                            </div>
                        </div>
                        
                    
                        <%-- div1_3_6 --%> 
                        <div id="click7">
                            <%-- div1_3_6_1 --%> 
                            <div class="report-reason" >
                                <%-- div1_3_6_1_1 --%> 
                                <div>불법 이용자 신고<i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                            <%-- div1_3_6_2 --%> 
                            <div class="report-reason">
                                <%-- div1_3_6_2_1 --%> 
                                <div>중복 게시글 <i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                            <%-- div1_3_6_3 --%>
                            <div class="report-reason">
                                <%-- div1_3_6_3_1 --%>
                                <div> 프로필 사진 신고<i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                            <%-- div1_3_6_4 --%>
                            <div class="report-reason">
                                <%-- div1_3_6_4_1 --%>
                                <div>불건전 닉네임 신고 <i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                            <%-- div1_3_6_5 --%>
                            <div class="report-reason">
                                <%-- div1_3_6_5_1 --%>
                                <div>채팅으로 정치/종교 대화를 시도해요 <i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                        </div>   
                    
                    
                    
                        <!--  <div class="report-other">
                                <a href="#">
                                    <div>기타 <i class="fa-solid fa-chevron-right"></i></div>
                                </a>
                            </div> -->
                        
                        <%-- div1_3_7form --%>
                        <form id="userreportsubmit" action = "/userreportsubmit" method="POST">
                            <%-- div1_3_7_1 --%> 
                            <div id="frame">
                                <%-- div1_3_7_1_1 --%> 
                                <%-- <div class="report-confirm"> --%>
                                    <%-- div1_3_7_1_1p --%> 
                                <%--    <p>${U_COM2_CTG_NO}</p> --%>
                                <%-- </div> --%>

                                <%-- div1_3_7_1_2 --%> 
                              <%--   <div class="user-block"> --%>
                                    <%-- div1_3_7_1_2_input --%> 
                               <%--      <input type="checkbox" name = "userblock" value = "${memberNo}">이 사람을 더이상 보고싶지 않아요
                                </div> --%>
                        
                                    <%--     <div class="report-notice">
                                    ('나의 바나나> 설정 > 게시글 미노출 > 사용자 관리' 에서 취소할 수 있습니다.)
                                    </div> --%>
                                
                                <%-- div1_3_7_1_3 --%> 
                                <div class="notice">
                                        <%-- div1_3_7_1_3_p --%> 
                                        <p>
                                        신고 내용은 상대에게 노출되지 않아요. 
                                        내용이 사실과 다를 경우 이용 제제를 받을 수 있으니 주의해 주세요.
                                        </p>
                                </div>
                                <%-- div1_3_7_1_4 --%> 
                                <div class="textbox">
                                    <%-- div1_3_7_1_4_text --%> 
                                    <textarea name="reportbox" id="reportbox" cols="90" rows="5" placeholder="혹시 불쾌한 일을 겪으셨나요? 사유를 남겨주세요" ></textarea>
                                        
                                </div>
                                <%-- div1_3_7_1_button --%>
                                <button type="submit" id = "report-submit-button" >바나나 팀에게 보내기</button>
                            </div>
                            <%-- div1_3_7_2_input1 --%>
                            <input  id ="ctg1" type="hidden" name="ctg1" value="">
                            <%-- div1_3_7_3_input2 --%>
                            <input id ="ctg2" type="hidden" name="ctg2" value="" >
                            <input id= "memberNo2" type = "hidden" name="memberNo2" value= "${selectProductInfor.sellerNo}" >
                        </form>
                    </div>
                </div>
            </div>
                
            

        </section>
    </main>

    

    
<!-- footer 시작----------------------------------------------------------------------------------------- -->

    <!-- footer 끝----------------------------------------------------------------------------------------- -->

    
    <script src="/resources/js/chiwoo/usercomplain.js"></script>
 <%--    <script>
        const loginMemberNo = "${loginMember.memberNo}";
		const goodsNo = "${goodsNo}";
    </script> --%>
    

</body>
</html>