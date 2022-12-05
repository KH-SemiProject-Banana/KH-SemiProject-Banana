<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                        <img class="photo" src="${loginMember.profileImage}" alt=""> <i class="fa-solid fa-camera-retro fa-2x pen" id = "profilePop"></i>
                    </c:if>
                    <c:if test = "${empty loginMember.profileImage}">
                        <img class="photo" src="/resources/images/banana-logo.png" alt=""> <i class="fa-solid fa-camera-retro fa-2x pen" id = "profilePop"></i>
                    </c:if>
				</div>
                    <div class="popup_layer4" id="popup_layer4" style="display: none;">
                        <div class="popup_box4  ">
                            <!-- <div  style="height: 10px; width: 375px; float: top;"> -->
                            <a href="javascript:closePop4();"><i class="fa-solid fa-x" id = "fa-x"></i></a>
                            <!-- </div> -->
                            <!--팝업 컨텐츠 영역-->
                            <div class="popup_cont4 " id = "popup_con3">
                                <form action = "/member/myPage/updateProfile" method = "POST" 
                                        name = "myPage-frm" enctype = "multipart/form-data"
                                        onsubmit = "return profileValidate()">

                                    <div class = "profile-image-area">

                                        <c:if test = "${empty loginMember.profileImage}"> <%-- 비어있다면, 기본이미지 보여주겠다. --%>

                                            <img id = "profile-image" src="/resources/images/banana.png" alt="">

                                        </c:if>
                                        <c:if test = "${not empty loginMember.profileImage}"> <%-- 안 비어있다면, . --%>

                                            <img id = "profile-image" src="${loginMember.profileImage}" alt="">

                                        </c:if>
                                    </div>
                                    <span id = "delete-image">&times;</span>

                                    <div class = "profile-btn-area">
                                        <label for="image-input">이미지 선택</label>

                                        <!-- accept= 속성 : 업로드 가능한 파일의 타입을 제한하는 속성 -->
                                        <input type="file" name = "profileImage" id = "image-input" accept="image/*">

                                        <button>변경하기</button>

                                    </div>

                                    <div class = "myPage-row">
                                        <label >이메일</label>
                                        <span>${loginMember.memberEmail}</span>
                                    </div>

                                    <div class = "myPage-row">
                                        <label >가입일</label>
                                        <span>${loginMember.enrollDate}</span>
                                    </div>

                                    
                                    

                                    

                                </form>
                            </div>
                            <!--팝업 버튼 영역-->
                            <!-- <div class="popup_btn" style="float: bottom; margin-top: 100px;">
                            <a href="javascript:closePop();">닫기</a>
                            </div> -->
                        </div>
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

                    <div id= "second-category" class = "category">
                        <a href="/member/myPage/main?myPageCt=2">구매내역</a>
                    </div>
                    <div id= "third-category" class = "category">관심목록
                    </div>
                    <div id= "fourth-category" class = "category">
                        <a href="/member/myPage/selectAllReview">후기</a>
                    </div>
                    
                    


                <%-- 판매내역 클랙->js에서 1을 input에 넣고
                    button을 클릭하도록 함
                    document.getElementById("first-category").addEventListener("click", ()=>{
                        document.getElementbyId("status").value = 1;
                        document.getElementById("button").click();
                    })
                --%>

			</section>
            <%--  섹션5에 해당하는 듯 --%>
            <%-- <div class = "myBanana" id = "reviewss"> --%>
            <section class = "myBanana-reviewList">
                <section class = "title_section_1">
                    <a href="/member/myPage/review/good">받은 매너 평가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-angle-right"></i></a>
                </section>
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
                        
                        <div class="iconBox"><i class="fa-solid fa-face-smile circle"></i></div>
                        <div class="iconBox"><i class="fa-solid fa-sack-dollar circle"></i></div>
                        <div class="iconBox"><i class="fa-solid fa-clock circle"></i></div>
                        <div class="iconBox"><i class="fa-solid fa-bolt circle"></i></div>
                        <div class="iconBox"><i class="fa-solid fa-person-walking circle"></i></div>
                    </section>
                    <section class = "row3">
                        <c:forEach var = "manner" items = "${mannerTopList}">
                        <div class = "row33"><p class = "row3col2">${manner.mannerCount}</p></div>
                        </c:forEach>
                        <%-- <div class = "row33"><p class = "row3col1">40</p></div>
                        <div class = "row33"><p class = "row3col2">30</p></div>
                        <div class = "row33"><p class = "row3col3">20</p></div>
                        <div class = "row33"><p class = "row3col4">10</p></div>
                        <div class = "row33"><p class = "row3col5">5</p></div> --%>
                    </section>
                </section>
                <section class = "title_section_2">
                    <a href="/member/myPage/review/detail">받은 거래 후기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-angle-right"></i></a>
                </section>
                <section class = "review_section_2">
                    <c:forEach var = "review" items = "${reviewNewestList}">
                        <div class = "review_2">
                            <div class = "userphoto">
                                <img  src="${review.profileImage}" alt="">
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

    <!-- jQuery 라이브러리(.js 파일) 추가(CDN 방식) -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	<script src="/resources/js/lsy/myPage_review.js"></script>
    
</body>

</html>