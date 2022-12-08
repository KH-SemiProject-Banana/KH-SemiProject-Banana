<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>

<c:set var="goodsList" value="${map.myGoodsLikeList}" />
<c:set var = "pagination" value = "${map.pagination}" />



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

    <link rel="stylesheet" href="/resources/css/lsy/myPage_common.css">
    <link rel="stylesheet" href="/resources/css/lsy/popup.css">
        <link rel="stylesheet" href="/resources/css/현진/productList.css">

    <style>
    #third-category > a{
        font-weight: bold;
    }
    </style>

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
                        <img class="photo" src="${loginMember.profileImage}" alt=""> <i class="fa-solid fa-camera-retro fa-2x pen" id = "profilePop"></i>
                    </c:if>
                    <c:if test = "${empty loginMember.profileImage}">
                        <img class="photo" src="/resources/images/banana-logo.png" alt=""> <i class="fa-solid fa-camera-retro fa-2x pen" id = "profilePop"></i>
                    </c:if>
				</div>
                    <div class="popup_layer4" id="popup_layer4" style="display: none;">
                        <div class="popup_box4  ">
                            <!-- <div  style="height: 10px; width: 375px; float: top;"> -->
                            <a href="javascript:closePop4();" class="xbtn">
                                <i class="fa-solid fa-x xbtnBack" id = "fa-x"></i>
                            </a>
                            <!-- </div> -->
                            <!--팝업 컨텐츠 영역-->
                            <div class="popup_cont4 " id = "popup_con4">
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



                                    
                                    

                                    

                                </form>
                            </div>
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
                         <div class = "bananaPayBtn">
                            <p class="introUpdateBtn1" onclick="openPop5()">바나나페이</p>
                        </div>
					</div>

                    <jsp:include page="/WEB-INF/views/pay/bananaPay.jsp" />


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
									<div class="temperature" style="width:${loginMember.manner}%; background: brown  ;"></div>
								</c:when>
								<c:when test="${loginMember.manner >= 60}">
									<div class="temperature" style="width:${loginMember.manner}%; background: tomato  ;"></div>
								</c:when>
								<c:when test="${loginMember.manner >= 40}">
									<div class="temperature" style="width:${loginMember.manner}%; background: yellow  ;"></div>
								</c:when>
								<c:when test="${loginMember.manner >= 20}">
									<div class="temperature" style="width:${loginMember.manner}%; background: yellowgreen  ;"></div>
								</c:when>
								<c:otherwise>
									<div class="temperature" style="width:${loginMember.manner}%; background:  green  ;"></div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</section>
			<!--섹션4********************************************************************************************************섹션1-->
			<section class="myBanana-category">
            
                    <div id= "first-category" class = "categorys">
                        <a href="/member/myPage/main?myPageCt=1">판매내역</a>
                    </div>

                    <%-- c:if test = param.myPageCt=1 --%>

                    <div id= "second-category" class = "categorys">
                        <a href="/member/myPage/main?myPageCt=2">구매내역</a>
                    </div>
                    <div id= "third-category" class = "categorys">
                        <a href="/member/myPage/myGoodsLike">관심목록</a>
                    </div>
                    <div id= "fourth-category" class = "categorys">
                        <a href="/member/myPage/selectAllReview" >후기</a>
                    </div>
                    
                    


            <%-- 판매내역 클랙->js에서 1을 input에 넣고
                button을 클릭하도록 함
                document.getElementById("first-category").addEventListener("click", ()=>{
                    document.getElementbyId("status").value = 1;
                    document.getElementById("button").click();
                })
             --%>

			</section>
			<!--섹션5********************************************************************************************************섹션1-->
			<%-- <div id=changeJsp>
				<jsp:include page="/WEB-INF/views/member/myPage_review.jsp"></jsp:include>
			</div> --%>
			<section class="myBanana-sellList" id="myBanana-sellList">
				<div class="myBanana-sell">
					<%-- div id="selling"><a href="/member/myPage/main?myPageCt=5">판매중</a></div>
					<div id="sold"><a href="/member/myPage/main?myPageCt=1">판매완료</a></div> --%>
				</div>

				<section class="content-favorite">

					<!-- 게시글 목록 조회 결과가 비어있다면 -->

					<%-- choose 내에서는 jsp주석 적어야 해 --%>
                   
					<c:choose>
						<c:when test="${empty goodsList}">
							<%-- 게시글 목록 조회 결과가 비어있다면 --%>
							<tr>
								<th colspan="6">게시글이 존재하지 않습니다.</th>
							</tr>
						</c:when>

						<c:otherwise>
							<c:forEach var="goods" items="${goodsList}">
								<%-- 상품박스 --%>
								<div class="favorite__pack">
									<div>
										<div class="favorite__img">
											<img src="${goods.imagePath}"> 
                                            <%-- 여기서는 dot이 필요가 없지? --%>
                                            <%-- <c:choose> --%>
                                                <%-- <c:when test="${loginMember.memberNo == goods.memberNo}"> --%>
                                                    <input type="checkbox" id="like${i}" class="likeChk" value="${goods.goodsNo}" checked>
                                                <%-- </c:when> --%>

                                                <%-- <c:otherwise>
                                                    <input type="checkbox" id="like${i}" class="likeChk" value="${goods.goodsNo}">
                                                </c:otherwise>
                                            </c:choose> --%>
                                
                                <label for="like${i}" class="like_yn"><i class="fa-solid fa-heart"></i></label>
										</div>
										<div class="favorite__price-heart">
											<div class="favorite__price">${goods.title}</div>
										</div>
									</div>
                                    <%-- 찜한 시간? --%>
									<div class="favorite__content">${goods.createdAt}</div>
                                     
                                        
                                        
								</div>
                                <c:set var="i" value="${i+1}" />
                            </c:forEach>
						</c:otherwise>
					</c:choose>

                    <%-- 현진이꺼 복붙 추가 시작--%>
            </section>  
             <div class="pagination-area">

                    <%-- 페이지네이션 목록 추가  --%>
                    <ul class="pagination">
                    
                        <!-- 첫 페이지로 이동 -->
                        
                        <%-- <li><a href="/member/myPage/main?myPageCt=${param.myPageCt}&cp=1">&lt;&lt;</a></li> --%>
                        <!-- 이전 목록 마지막 번호로 이동 -->
                        <li><a href="/member/myPage/myGoodsLike?cp=${pagination.prevPage}">&lt;</a></li>
                        <%-- ?cp같은 쿼리스트링 형태로 적어야 함.....(이게 파라미터로 인식이 됨...) --%>
                        
                        <c:forEach var = "i" begin ="${pagination.startPage}" end = "${pagination.endPage}" step = "1" >

                            <c:choose>
                                <c:when test = "${i == pagination.currentPage}">
                                <%-- 현재 페이지인 경우 --%>
                                    <!-- 현재 보고있는 페이지 -->
                                    <li><a class="current">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                <!-- 현재 페이지를 제외한 나머지 -->
                                <li><a href="/member/myPage/myGoodsLike?cp=${i}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>

                        </c:forEach>

                        <!-- 특정 페이지로 이동 -->
                        
                        
                        
                        
                        
                        <!-- 다음 목록 시작 번호로 이동 -->
                        <li><a href="/member/myPage/myGoodsLike?cp=${pagination.nextPage}">&gt;</a></li>

                        <!-- 끝 페이지로 이동 -->
                        <%-- <li><a href="/member/myPage/main?myPageCt=${param.myPageCt}&cp=${pagination.maxPage}">&gt;&gt;</a></li> --%>

                    </ul>
                </div>   
		</div>
	</main>


	<%-- footer.jsp.include --%>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        // let myPageCt

        // if(${param.myPageCt != null}) {
        //     myPageCt = ${param.myPageCt};
        // } else {
        //     myPageCt = 1;
        // }

        // let loginMemberNo;

        // loginMemberNo = ${loginMember.memberNo};

        
        const memberNo = "${loginMember.memberNo}";

    

    </script>
    <!-- jQuery 라이브러리(.js 파일) 추가(CDN 방식) -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	
	<script src="/resources/js/lsy/myPage_goodsLike.js"></script>
	<script src="/resources/js/lsy/myPage_common.js"></script>
    
</body>

</html>