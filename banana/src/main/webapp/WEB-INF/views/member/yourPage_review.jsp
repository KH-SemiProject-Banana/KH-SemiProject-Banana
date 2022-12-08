<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "member" value = "${map.member}"/>
<c:set var="reviewNewestList" value="${map.reviewNewestList}" />
<c:set var="mannerTopList" value="${map.mannerTopList}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>

    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/lsy/myPage_review.css ">
    <link rel="stylesheet" href="/resources/css/lsy/myPage_common.css ">
    <link rel="stylesheet" href="/resources/css/lsy/popup.css ">

    <style>
    #fourth-category > a{
        font-weight: bold;
    }
    </style>

    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/nav.jsp" />
        <div class = "myBanana" id = "reviewss">
            <!--섹션1********************************************************************************************************섹션1-->
			<section class="my-rotten-banana">
				<!-- <p>탈퇴하기</p> -->
				<%-- <i class="topmenu__alarm fa-regular fa-bell fa-2x"></i>
				<p id="editBlockMember">차단 관리</p> --%>
			</section>
			<!--섹션2********************************************************************************************************섹션1-->
			<section class="myBanana-title">
				<p>너의 바나나</p>
			</section>
			<!--섹션3********************************************************************************************************섹션1-->
			<section class="myBanana-detail">
				<div class="myBanana-photo">
                    
                        <img class="photo" src="${member.profileImage}" alt=""> <i class="fa-solid fa-camera-retro fa-2x pen" id = "profilePop"></i>
                    
				</div>
                    <%--  --%>
				<div class="myBanana-content">
					<div class="myBanana-info">
						<div class="myBanana-name">${member.memberNickname}</div>
						<div class="myBanana-address">${member.memberAddress}</div>
					</div>

					<div class="myBanana-intro">

						<p id="p_intro" class="p_intro">${member.introduce}</p>

					</div>
					<div class="myBanana-temp">
						<p class="temp-text">나의 바나나 온도 : ${member.manner}도</p>
						<div class="container">
							<c:choose>
								<c:when test="${member.manner >= 80}">
									<div class="temperature" style="width:${member.manner}%; background: linear-gradient(to top, #009fe8, #c4168d);"></div>
								</c:when>
								<c:when test="${member.manner >= 60}">
									<div class="temperature" style="width:${member.manner}%; background: linear-gradient(to top, #009fe8, #c4168d);"></div>
								</c:when>
								<c:when test="${member.manner >= 40}">
									<div class="temperature" style="width:${member.manner}%; background: linear-gradient(to top, #009fe8, #c4168d);"></div>
								</c:when>
								<c:when test="${member.manner >= 20}">
									<div class="temperature" style="width:${member.manner}%; background: linear-gradient(to top, #009fe8, #c4168d);"></div>
								</c:when>
								<c:otherwise>
									<div class="temperature" style="width:${member.manner}%; background: linear-gradient(to top, #009fe8, #c4168d);"></div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</section>
			<!--섹션4********************************************************************************************************섹션1-->
			<section class="myBanana-category">
            
                    <form id= "first-category" class = "category" method = "POST">
                        <a id = "firstCt">판매내역</a>
						<input type="hidden" name="sellerNo" value="${member.memberNo}">
                    </form>
                    <form id= "fourth-category" class = "category" method = "POST">
                        <a id = "lastCt" >후기</a>
						<input type="hidden" name="sellerNo" value="${member.memberNo}">
                    </form>


			</section>
            <%--  섹션5에 해당하는 듯 --%>
            <%-- <div class = "myBanana" id = "reviewss"> --%>
            <section class = "myBanana-reviewList">
                <form class = "title_section_1" method = "POST" id = "title_section_1" >
                    <input type="hidden" name="sellerNo" value="${member.memberNo}">
                    <a id = goToManner >받은 매너 평가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-angle-right"></i></a>
                </form>
                </section>
                <section class ="review_section_1">
                    <section class = "row1">
                        <c:forEach var = "manner" items = "${mannerTopList}">
                        <div class = "row"><p class = "row1col1">${manner.mannerDescription}</p></div>
                        </c:forEach>
                        <%-- <div class = "row"><p class = "row1col2">좋은 상품을 저렴하게 판매해요</p></div>
                        <div class = "row"><p class = "row1col3">시간 약속을 잘 지켜요</p></div>
                        <div class = "row"><p class = "row1col4">응답이 빨라요</p></div>
                        <div class = "row"><p class = "row1col5">제가 있는 곳까지 와서 거래했어요</p></div> --%>
                    </section>
                    <section class = "row2">
                        <c:forEach var="manner" items="${mannerTopList}">
                            <c:choose>
                                <c:when test="${manner.mannerNo == 1}">
                                    <div class="iconBox"><i class="fa-solid fa-hand-holding-hand mannerPic"></i></div>
                                </c:when>
                                <c:when test="${manner.mannerNo == 2}">
                                    <div class="iconBox"><i class="fa-solid fa-wand-magic-sparkles mannerPic"></i></div>
                                </c:when>
                                <c:when test="${manner.mannerNo == 3}">
                                    <div class="iconBox"><i class="fa-solid fa-arrow-up-short-wide mannerPic"></i></div>
                                </c:when>
                                <c:when test="${manner.mannerNo == 4}">
                                    <div class="iconBox"><i class="fa-solid fa-money-bill-1-wave mannerPic"></i></div>
                                </c:when>
                                <c:when test="${manner.mannerNo == 5}">
                                    <div class="iconBox"><i class="fa-solid fa-clock mannerPic"></i></div>
                                </c:when>
                                <c:when test="${manner.mannerNo == 6}">
                                    <div class="iconBox"><i class="fa-solid fa-truck-fast mannerPic"></i></div>
                                </c:when>
                                <c:when test="${manner.mannerNo == 7}">
                                    <div class="iconBox"><i class="fa-solid fa-thumbs-up mannerPic"></i></div>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </section>
                    <section class = "row3">
                        <c:forEach var = "manner" items = "${mannerTopList}">
                        <div class = "row33"><p class = "row3col2">${manner.mannerCount}명</p></div>
                        </c:forEach>
                        <%-- <div class = "row33"><p class = "row3col1">40</p></div>
                        <div class = "row33"><p class = "row3col2">30</p></div>
                        <div class = "row33"><p class = "row3col3">20</p></div>
                        <div class = "row33"><p class = "row3col4">10</p></div>
                        <div class = "row33"><p class = "row3col5">5</p></div> --%>
                    </section>
                </section>
                <form class = "title_section_2" method = "POST" id =  "title_section_2">
                    <input type="hidden" name="sellerNo" value="${member.memberNo}">
                    <a id = "bothD">받은 거래 후기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-angle-right"></i></a>
                </form>
                <section class = "review_section_2">
                    <c:forEach var = "review" items = "${reviewNewestList}">
                        <div class = "review_2">
                            <div class = "userphoto">
                            <c:if test = "${not empty review.profileImage}">
                            <img  src="${review.profileImage}" alt="">
                            </c:if>
                            <c:if test = "${empty review.profileImage}">
                                <img class="photo" src="/resources/images/banana-logo.png" alt=""> 
                            </c:if>
                                
                            </div>
                            <div class="memberInfoBox">     
                                <div class="memberInfo">
                                    <div class = "row2_1">
                                        <div class = "name">${review.memberNickname}</div>
                                    </div>
                                    <div class = "row2_2">
                                        <div class = "address">${review.address}</div>
                                        <div class = "date">${review.createdAt}</div>
                                    </div>
                                </div>
                            </div>

                            <div class = "content">
                                <div class = "row2_3">
                                    <pre class = "message Scroll">
${review.message}
                                    </pre>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </section>
            </section>
        </div>
    </main>

    <%-- footer.jsp.include --%>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <%-- <script>
        document.getElementById("third-category").addEventListener("click",function(){
        document.getElementById("third-category").style.fontWeight = "bold";
        })
        document.getElementById("fourth-category").addEventListener("click",function(){
        document.getElementById("fourth-category").style.fontWeight = "bold";
        })  
    </script> --%>
    <script>
    document.getElementById("bothD").addEventListener("click",function(){
    const myBananaSell = document.getElementById("title_section_2");
    myBananaSell.action = "/member/myPage/yourReview/detail?detailCt=1";
    myBananaSell.submit();
    })
    </script>

    <!-- jQuery 라이브러리(.js 파일) 추가(CDN 방식) -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	<%-- <script src="/resources/js/lsy/yourPage_common.js"></script> --%>
	<script src="/resources/js/lsy/yourPage_review.js"></script>
    
	
    
</body>

</html>