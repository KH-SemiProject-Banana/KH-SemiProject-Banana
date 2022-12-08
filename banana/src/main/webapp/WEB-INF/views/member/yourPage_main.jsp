<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- map에 저장된 값을 꺼내어 각각 변수에 저장 --%>

<c:set var="soldList" value="${map.soldList}" />
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
    <%-- <link rel="stylesheet" href="/resources/css/screens/header-footer.css"> --%>

    <link rel="stylesheet" href="/resources/css/lsy/myPage_common.css">
    <%-- <link rel="stylesheet" href="/resources/css/lsy/popup.css">
    <link rel="stylesheet" href="/resources/css/lsy/pop1_review_survey.css"> --%>



    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

	<style>
		.pagination a{
			cursor: pointer;
		}
	</style>
</head>

<body>
	<main>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/nav.jsp" />

		<div class="myBanana">
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
						<input type="hidden" name="sellerNo" value="${map.memberNo}">
                    </form>
                    <form id= "fourth-category" class = "category" method = "POST">
                        <a id = "lastCt" >후기</a>
						<input type="hidden" name="sellerNo" value="${map.memberNo}">
                    </form>


			</section>
			<!--섹션5********************************************************************************************************섹션1-->
			<%-- <div id=changeJsp>
				<jsp:include page="/WEB-INF/views/member/myPage_review.jsp"></jsp:include>
			</div> --%>
			<section class="myBanana-sellList" id="myBanana-sellList">
				<form class="myBanana-sell" id = "myBanana-sell" method = "POST" onsubmit = "return false;">
                <%-- <c:choose>
                    <c:when test = "${loginMember.memberNo eq soldList.sellerNo}"> --%>
					    <div id="selling"><a id = "sellingA">판매중</a></div>
					    <div id="sold"><a id = "soldA">판매완료</a></div>
                    <%-- </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose> --%>
				<input type="hidden" name="sellerNo" value="${map.memberNo}">
				</form>

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
								</div>
                            </c:forEach>
						</c:otherwise>
					</c:choose>
                </section> 
                <div class="pagination-area">

                    <%-- 페이지네이션 목록 추가  --%>
                    <ul class="pagination">
                    
                        <!-- 첫 페이지로 이동 -->
                        
                        <%-- <li><a href="/member/myPage/main?myPageCt=${param.myPageCt}&cp=1">&lt;&lt;</a></li> --%>
                        <!-- 이전 목록 마지막 번호로 이동 -->
                        <%-- <li><a href="/member/myPage/yourPageMain?myPageCt=${param.myPageCt}&cp=${pagination.prevPage}">&lt;</a></li> --%>
                        <li><a data="${pagination.prevPage}">&lt;</a></li>
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
                                <%-- <li><a href="/member/myPage/yourPageMain?myPageCt=${param.myPageCt}&cp=${i}">${i}</a></li> --%>
                                <li><a data="${i}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>

                        </c:forEach>

                        <!-- 특정 페이지로 이동 -->
                        
                        
                        
                        
                        
                        <!-- 다음 목록 시작 번호로 이동 -->
                        <%-- <li><a href="/member/myPage/yourPageMain?myPageCt=${param.myPageCt}&cp=${pagination.nextPage}">&gt;</a></li> --%>
                        <li><a data="${pagination.nextPage}">&gt;</a></li>

                        <!-- 끝 페이지로 이동 -->
                        <%-- <li><a href="/member/myPage/main?myPageCt=${param.myPageCt}&cp=${pagination.maxPage}">&gt;&gt;</a></li> --%>

                    </ul>
                </div> 
            </section>    
		</div>
	</main>

	<form action="yourPageMain?myPageCt=${param.myPageCt}" method="post" name="submitFrm">
		<input type="hidden" name="cp" id="cp" value="${pagination.currentPage}">
		<input type="hidden" name="sellerNo" value="${param.sellerNo}">
	</form>


	<%-- footer.jsp.include --%>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        let myPageCt

        if(${param.myPageCt != null}) {
            myPageCt = ${param.myPageCt};
        } else {
            myPageCt = 1;
        }

    

        //판매중/판매완료/구매완료인지에 따라 글씨체 bold로 바뀌는거 
        switch(myPageCt){
            case 1: document.getElementById("first-category").style.fontWeight = "bold"; 
            document.getElementById("sold").style.fontWeight = "bold";
            //document.getElementById("popup_layer4").style.display = "none";
            //const changeJsp = document.querySelector("#changeJsp");
            //changeJsp.innerHTML = "";
            break;

            case 5: 
            document.getElementById("first-category").style.fontWeight = "bold";
            document.getElementById("selling").style.fontWeight = "bold"; break;
        }

    </script>
    <!-- jQuery 라이브러리(.js 파일) 추가(CDN 방식) -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	<script src="/resources/js/lsy/yourPage_common.js"></script>
</body>

</html>