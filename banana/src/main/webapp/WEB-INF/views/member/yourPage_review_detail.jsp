<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="reviewDetailList" value="${map.reviewDetailList}" />
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
    <link rel="stylesheet" href="/resources/css/lsy/myPage_review_detail.css">
   
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
   
    
</head>
<body>
    <main>
         <%-- header.jsp.include --%>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <form class = "title" id = "fourth-category" method = "POST">
        <a id = "lastCt"><i id = "back" class="fa-solid fa-angle-right"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;후기 상세</a>
        <input type="hidden" name="sellerNo" value="${member.memberNo}">
    </form>  
    <section class = "total">
        <section class = "category">
            <form class = "category_border" id = "category_border" method = "POST"  onsubmit = "return false;">
                <div class = "both" id = "both"><a id = "bothD" >전체 후기</a></div>
                <div class = "buyer" id = "buyer"><a id = "bothB">구매자 후기</a></div>
                <div class = "seller" id = "seller"><a id = "bothS">판매자 후기</a></div>
                <input type="hidden" name="sellerNo" value="${member.memberNo}">
            </form>
        </section>
        <section class = "review">
           <c:forEach var="review" items="${reviewDetailList}">
                <div class = "review_1">
                    <div class = "photo">
                        <c:if test = "${not empty review.profileImage}">
                        <img  src="${review.profileImage}" alt="">
                        </c:if>
                        <c:if test = "${empty review.profileImage}">
                        <img  src="/resources/images/banana-logo.png" alt="">
                        </c:if>
                    </div>
                
                    <div class="memberInfoBox">
                        <div class="memberInfo">
                            <div class = "row1">
                                <div class = "name">${review.memberNickname}</div>
                            </div>
                            <div class = "row2">
                                <div class = "address">${review.address}</div>
                                <div class = "date">${review.createdAt}</div>
                            </div>
                        </div>
                    </div>

                    <div class = "content">
                        <div class = "row3">
                            <pre class = "message Scroll">
${review.message}
                            </pre>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </section>

        <div class="pagination-area">

                    <%-- 페이지네이션 목록 추가  --%>
                    <ul class="pagination">
                    
                        <!-- 첫 페이지로 이동 -->
                        
                        <%-- <li><a href="/member/myPage/review/detail?detailCt=${param.detailCt}&cp=1">&lt;&lt;</a></li> --%>

                        <!-- 이전 목록 마지막 번호로 이동 -->
                            <%--기존: <li><a href="/member/myPage/review/detail?detailCt=${param.detailCt}&cp=${pagination.prevPage}">&lt;</a></li> --%>
                        <%-- ?cp같은 쿼리스트링 형태로 적어야 함.....(이게 파라미터로 인식이 됨...) --%>
                        
                        <%-- <c:forEach var = "i" begin ="${pagination.startPage}" end = "${pagination.endPage}" step = "1" > --%>

                            <%-- <c:choose> --%>
                                <%-- <c:when test = "${i == pagination.currentPage}"> --%>
                                <%-- 현재 페이지인 경우 --%>
                                    <!-- 현재 보고있는 페이지 -->
                                    <%-- <li><a class="current">${i}</a></li> --%>
                                <%-- </c:when> --%>
                                <%-- <c:otherwise> --%>
                                <!-- 현재 페이지를 제외한 나머지 -->
                                <%-- <li><a href="/member/myPage/review/detail?detailCt=${param.detailCt}&cp=${i}">${i}</a></li> --%>
                                <%-- </c:otherwise> --%>
                            <%-- </c:choose> --%>

                        <%-- </c:forEach> --%>

                        <!-- 특정 페이지로 이동 -->
                        
                        
                        <!-- 다음 목록 시작 번호로 이동 -->
                        <%-- <li><a href="/member/myPage/review/detail?detailCt=${param.detailCt}&cp=${pagination.nextPage}">&gt;</a></li> --%>

                        <!-- 끝 페이지로 이동 -->
                        <%-- <li><a href="/member/myPage/review/detail?detailCt=${param.detailCt}&cp=${pagination.maxPage}">&gt;&gt;</a></li> --%>
                        
                        <%-- 붙여넣기 --%>

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
                    </ul>
                </div> 
    </section>
    <form action="/member/myPage/yourReview/detail?detailCt=${param.detailCt}" method="post" name="submitFrm">
		<input type="hidden" name="cp" id="cp" value="${pagination.currentPage}">
		<input type="hidden" name="sellerNo" value="${param.sellerNo}">
	</form>
</main>



    <script>
        let detailCt 
        
        if(${param.detailCt != null}) {
            detailCt=  ${param.detailCt};
        } else {
            detailCt = 1;
        }

        switch(detailCt){
            case 1: document.getElementById("both").style.fontWeight = "bold"; break;
            case 2: document.getElementById("buyer").style.fontWeight = "bold"; break;
            case 3: document.getElementById("seller").style.fontWeight = "bold"; break;
        }

        //'받은 거래 후기'를 클릭했을 때, form태그 제출
        document.getElementById("bothD").addEventListener("click",function(){
            const myBananaSell = document.getElementById("category_border");
            myBananaSell.action = "/member/myPage/yourReview/detail?detailCt=1";
            myBananaSell.submit();
        })
        document.getElementById("bothB").addEventListener("click",function(){
            const myBananaSell = document.getElementById("category_border");
            myBananaSell.action = "/member/myPage/yourReview/detail?detailCt=2";
            myBananaSell.submit();
        })
        document.getElementById("bothS").addEventListener("click",function(){
            const myBananaSell = document.getElementById("category_border");
            myBananaSell.action = "/member/myPage/yourReview/detail?detailCt=3";
            myBananaSell.submit();
        })

        //'후기'을 클릭했을 때, form태그 제출 (후기 조회됨)
        document.getElementById("lastCt").addEventListener("click",function(){
        const myBananaSell = document.getElementById("fourth-category");
        myBananaSell.action = "/member/myPage/selectAllYourReview";
        myBananaSell.submit();
        })

        // 페이지네이션 a태그 얻어오기
        const list = document.querySelectorAll(".pagination a");

        for(let item of list){
        const data = item.getAttribute("data");
        if(data != null){
            
            item.addEventListener("click", e => {
                document.getElementById("cp").value = data;
                document.submitFrm.submit();
            })
        }
}
    </script>

    <%-- footer.jsp.include --%>
    <jsp:include page = "/WEB-INF/views/common/footer.jsp" />


</body>

</html>
