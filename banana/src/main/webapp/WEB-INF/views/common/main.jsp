<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">

    <title>바꾸고 나누자 나랑: 바나나 마켓</title>

    <link rel="stylesheet" href="/resources/css/screens/main.css">
    <link rel="stylesheet" href="/resources/css/screens/header-footer.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/variables.css">
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1023652dd4.js" crossorigin="anonymous"></script>

</head>
<body>
    

    <main>

		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/nav.jsp" />
        
        <section class="content"> 
            
            <section class="slider">
                <input type="radio" name="slide" class="slide" id="slide1" checked>
                <input type="radio" name="slide" class="slide" id="slide2">
                <input type="radio" name="slide" class="slide" id="slide3">
                <input type="radio" name="slide" class="slide" id="slide4">
                <input type="radio" name="slide" class="slide" id="slide5">
                
                <ul id="imgHolder" class="imgs">
                    <li><img src="/resources/images/mainAdd/main-add1.jpg" class="slide-img"></li>
                    <li><img src="/resources/images/mainAdd/main-add2.jpg" class="slide-img"></li>
                    <li><img src="/resources/images/mainAdd/main-add3.jfif" class="slide-img"></li>
                    <li><img src="/resources/images/mainAdd/main-add4.jpg" class="slide-img"></li>
                    <li><img src="/resources/images/mainAdd/main-add5.jpg" class="slide-img"></li>
                </ul>
                <div class="bullets">
                    <label for="slide1">&nbsp;</label>
                    <label for="slide2">&nbsp;</label>
                    <label for="slide3">&nbsp;</label>
                    <label for="slide4">&nbsp;</label>
                    <label for="slide5">&nbsp;</label>
                </div>
            </section>

            <section class="content-comment first">
                <div>
                    <i class="fa-solid fa-face-laugh-squint"></i>
                    <p class="title">  인기 상품</p>
                </div>
                
                <a href="/category?categoryNo=0">더보기</a>
            </section>



            <section class="content-favorite" id="favorite">
                <c:forEach var="favorite" items="${favoriteGoodsList}">

                    <c:set var="i"  value="${i+1}"/>



                    <div class="favorite__pack">
                        <div>
                            <div class="favorite__img">
                                <a href="/goods/${favorite.goodsNo}">
                                    <img src="${favorite.thumbnail}" class="favorite__img">
                                </a>
                                <div class="favorite__heart">
                                    <c:if test="${favorite.isLike == 0}"> <%-- 좋아요 상태가 아닌 경우 --%>
                                        <input type="checkbox" id="like${i}" class="favorite__heart likeChk" value="${favorite.goodsNo}" >
                                    </c:if>
                                    <c:if test="${favorite.isLike == 1}"> <%-- 좋아요 상태인 경우 --%>
                                        <input type="checkbox" id="like${i}" class="favorite__heart likeChk" value="${favorite.goodsNo}" checked>
                                    </c:if>
                                    <label for="like${i}" class="like_yn">
                                        <i class="fa-solid fa-heart heart ${isLike}"></i>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${fn:length(favorite.title) gt 10}">
                                <div class="favorite__title">${fn:substring(favorite.title, 0, 9)}...</div>
                            </c:when>
                            <c:otherwise>
                                <div class="favorite__title">${favorite.title}</div>
                            </c:otherwise>
                        </c:choose>
                            <div class="favorite__price-heart sellStatus">
                                <div class="favorite__price">
                                    <fmt:formatNumber value="${favorite.sellPrice}" pattern="#,###" />원
                                </div>

                                <c:if test="${favorite.categoryNo != 11}">
                                    <c:if test="${favorite.buyerNo != ''}">
                                        &nbsp;&nbsp;&nbsp;<span style="font-size: 0.7em; color: #5c5c5c;">판매완료</span>
                                    </c:if>
                                    <c:if test="${favorite.buyerNo == ''}">
                                        &nbsp;&nbsp;&nbsp;<span style="font-size: 0.7em; color: #FFAB00;">판매중</span>
                                    </c:if>
                                </c:if>
                                <c:if test="${favorite.categoryNo == 11}">
                                    <c:if test="${favorite.buyerNo != ''}">
                                        &nbsp;&nbsp;&nbsp;<span style="font-size: 0.7em; color: #5c5c5c;">구매완료</span>
                                    </c:if>
                                    <c:if test="${favorite.buyerNo == ''}">
                                        &nbsp;&nbsp;&nbsp;<span style="font-size: 0.7em; color: #FFAB00;">구매중</span>
                                    </c:if>
                                </c:if>
                            </div>
                    </div>

                    <c:remove var="isLike"/>
                </c:forEach>
            </section>
            


            <section class="content-comment second">
                
                <div>
                    <i class="fa-solid fa-seedling"></i>
                    <p class="title">  최근글</p>
                </div>
                
                <%-- <a href="#">더보기</a> --%>
            </section>



            <section class="content-favorite">
                <c:forEach var="newGoods" items="${newGoodsList}">

                <c:set var="i"  value="${i+1}"/>


                    <c:set var="i"  value="${i+1}"/>
                    
                    <div class="favorite__pack">
                        <div>
                            <div class="favorite__img">
                                <a href="/goods/${newGoods.goodsNo}">
                                    <img src="${newGoods.thumbnail}" class="new__img">
                                </a>
                                <div class="favorite__heart">
                                    <c:if test="${newGoods.isLike == 0}"> <%-- 좋아요 상태가 아닌 경우 --%>
                                        <input type="checkbox"  id="like${i}" class="new__heart likeChk" value="${newGoods.goodsNo}">
                                    </c:if>
                                    <c:if test="${newGoods.isLike == 1}"> <%-- 좋아요 상태인 경우 --%>
                                        <input type="checkbox"  id="like${i}" class="new__heart likeChk" value="${newGoods.goodsNo}" checked>
                                    </c:if>
                                    <label for="like${i}" class="like_yn">
                                        <i class="fa-solid fa-heart heart"></i>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${fn:length(newGoods.title) gt 10}">
                                <div class="new__title">${fn:substring(newGoods.title, 0, 9)}...</div>
                            </c:when>
                            <c:otherwise>
                                <div class="new__title">${newGoods.title}</div>
                            </c:otherwise>
                        </c:choose>
                            <div class="favorite__price-heart sellStatus">
                                <div class="new__price">
                                    <fmt:formatNumber value="${newGoods.sellPrice}" pattern="#,###" />원
                                </div>
                                <c:if test="${newGoods.categoryNo != 11}">
                                    <c:if test="${newGoods.buyerNo != 0}">
                                        &nbsp;&nbsp;&nbsp;<span style="font-size: 0.7em; color: #5c5c5c;">판매완료</span>
                                    </c:if>
                                    <c:if test="${newGoods.buyerNo == 0}">
                                        &nbsp;&nbsp;&nbsp;<span style="font-size: 0.7em; color: #FFAB00;">판매중</span>
                                    </c:if>
                                </c:if>
                                <c:if test="${newGoods.categoryNo == 11}">
                                    <c:if test="${newGoods.buyerNo != 0}">
                                        &nbsp;&nbsp;&nbsp;<span style="font-size: 0.7em; color: #5c5c5c;">구매완료</span>
                                    </c:if>
                                    <c:if test="${newGoods.buyerNo == 0}">
                                        &nbsp;&nbsp;&nbsp;<span style="font-size: 0.7em; color: #FFAB00;">구매중</span>
                                    </c:if>
                                </c:if>
                            </div>
                    </div>
                </c:forEach>
            </section>

        </section>
    </main>


    <script>
        const loginMember = "${loginMember}"
        const memberNo = "${loginMember.memberNo}";
        // const goodsNo = "${loginMember.goodsNo}";
    
    </script>


    <!-- jQuery CDN 방식으로 추가-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>






	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/main.js"></script>

</body>
</html>