<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/현진/detailedPage.css">
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
    <style>nav{z-index: 5;}</style>
</head>
<body>
    <main>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <jsp:include page="/WEB-INF/views/common/nav.jsp" />

        <div>
            <div class="category">
                <a href="/">HOME</a>

                <c:if test='${category.query == null}'>
                    <a href="/category/?categoryNo=${category.categoryNo}">> ${category.categoryName}</a>
                </c:if>
            </div>

            <div class="product">
                <section>
                    <div class="slideshow-container">                       
                        <c:if test="${fn:length(goodsImg) == 0}">
                            <div class="mySlides">
                                <img src="../../resources/images/noImage.png">
                            </div>
                        </c:if>

                        <c:forEach var="goods" items="${goodsImg}">
                            <div class="mySlides">
                                <img src="${goods}">
                            </div>
                        </c:forEach>
                      
                        <div class="arrow slide-arrow prev" onclick="plusSlides(-1)">&#10094;</div>
                        <div class="arrow slide-arrow next" onclick="plusSlides(1)">&#10095;</div>
                    </div>
                      
                    <div class="dot-container">
                        <div class="arrow list-arrow prev" onclick="plusSlides(-1)">&#10094;</div>
                      
                        <div class="dot-list">
                            <c:set var="i" value="1" />
                            <c:forEach var="goods" items="${goodsImg}">
                                <div class="dot" onclick="currentSlide(i)">
                                    <img src="${goods}">
                                </div>

                                <c:set var="i" value="${i+1}" />
                            </c:forEach>
                            
                            <c:if test="${5 - fn:length(goodsImg) > 0}">
                                <c:forEach var="i" begin="1" end="${5 - fn:length(goodsImg)}">
                                    <div class="dot">
                                        <img src="../../resources/images/noImage.png">
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                      
                        <div class="arrow list-arrow next" onclick="plusSlides(1)">&#10095;</div>
                    </div>
                </section>

                <section class="product_intro">
                    <div class="product_top">
                        <div class="top_left"><span>${goodsInfo.sellStatus}</span></div>
                            
                        <c:if test="${loginMember.memberNo == sellerInfo.memberNo}">
                            <div class="top_right"><span><a href="#">삭제</a></span></div>
                            <div class="top_right"><span>|</span></div>
                            <div class="top_right"><span><a href="/goods/registerGoods">수정</a></span></div>
                            <div class="top_right"><span>|</span></div>
                        </c:if>

                        <c:if test="${loginMember.memberNo != sellerInfo.memberNo}">
                            <div class="top_right"><span><a href="#">신고</a></span></div>
                            <div class="top_right"><span>|</span></div>
                        </c:if>

                        <div class="top_right"><span>찜&nbsp;</span><span id="likeCount">${goodsInfo.likeCount}</span></div>
                        <div class="top_right"><span>|</span></div>
                        <div class="top_right"><span>${goodsInfo.createdAt}</span></div>
                    </div>

                    <div class="product_title">
                        <h2>${goodsInfo.title}</h2>
                        <h2><fmt:formatNumber value="${goodsInfo.sellPrice}" pattern="#,###"/></h2>
                    </div>

                    <div class="product_option">
                        <div>
                            <h3>거래방법</h3>
                            <span>바나나 페이</span>
                        </div>

                        <div>
                            <h3>거래장소/배송출발지</h3>
                            <span>${goodsInfo.address}</span>
                        </div>
                    </div>

                    <div class="detailed_intro">
                        <h3>상세설명</h3>
                        <span>
                            ${goodsInfo.description}
                        </span>
                    </div>

                    <form action="/chatting/enter" method="post" class="like_talk">
                        <div>
                            <input type="hidden" name="targetNo" value="${sellerInfo.memberNo}">
                            <input type="hidden" name="goodsNo" value="${goodsInfo.goodsNo}">

                            <c:choose>
                                <c:when test="${loginMember.memberNo == goodsInfo.memberNo}">
                                    <input type="checkbox" name="like" id="like" checked>
                                    <label for="like" id="like-icon"><i class="fa-solid fa-heart-circle-check icon-change"></i></label>
                                </c:when>

                                <c:otherwise>
                                    <input type="checkbox" name="like" id="like">
                                    <label for="like" id="like-icon"><i class="fa-solid fa-heart-circle-plus icon-change"></i></label>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div><button>바나나톡</button></div>
                    </form>
                </section>
            </div>

            <div class="seller">
                <div class="seller_profile">
                    <div class="seller_img">
                        <c:choose>
                                    <c:when test="${sellerInfo.profileImage == null}">
                                        <a href="/member/myPage/main"><img src="../../resources/images/user.png"></a>
                                    </c:when>

                                    <c:otherwise>
                                        <a href="/member/myPage/main"><img src="${sellerInfo.profileImage}"></a>
                                    </c:otherwise>
                        </c:choose>

                        <span><a href="/member/myPage/main">${sellerInfo.memberNickname}</a></span>
                    </div>

                    <div>
                        <div  class="seller_product">
                            <span><a href="/member/myPage/main">상품</a></span>
                            <span><a href="/member/myPage/main">${sellerInfo.goodsCount}</a></span>
                        </div>

                        <div class="manner">
                            <span>바나나 온도</span>
                            <div></div>
                        </div>
                    </div>
                </div>

                <div class="seller_other">
                    <div class="other_menu">
                        <c:if test="${loginMember.memberNo == sellerInfo.memberNo}">
                            <span>나의 다른 상품</span>
                        </c:if>

                        <c:if test="${loginMember.memberNo != sellerInfo.memberNo}">
                            <span>판매자의 다른 상품</span>
                        </c:if>
                        <span><a href="/member/myPage/main">전체보기 ></a></span>
                    </div>

                    <div class="other_list">
                        <c:set var="i" value="1" />
                        <c:forEach var="sellerGoods" items="${sellerGoods}">
                            <c:choose>
                                <c:when test="${i%5 == 0}">
                                    <div class="other_img other_img_end">
                                </c:when>
        
                                <c:otherwise>
                                    <div class="other_img">
                                </c:otherwise>
                            </c:choose>

                                <c:choose>
                                    <c:when test="${sellerGoods.imagePath == null}">
                                        <a href="/goods/${sellerGoods.goodsNo}"><img src="../../resources/images/noImage.png"></a>
                                    </c:when>

                                    <c:otherwise>
                                        <a href="/goods/${sellerGoods.goodsNo}"><img src="${sellerGoods.imagePath}"></a>
                                    </c:otherwise>
                                </c:choose>

                                <span><a href="/goods/${sellerGoods.goodsNo}" class="title">${sellerGoods.title}</a></span>
                                <span><a href="/goods/${sellerGoods.goodsNo}"><h4><fmt:formatNumber value="${sellerGoods.sellPrice}" pattern="#,###"/></h4></a></span>
                            </div>

                            <c:set var="i" value="${i+1}"/>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <div class="precautions">
                * 거래 시 주의 사항<br>
                판매자에게 물품에 대한 정보를 더 확인하고 싶다면 바나나톡을 이용해 주세요.<br>
                중고 거래 금지 물품은 구매하지 말고 신고해 주세요. 의약품, 화장품 샘플 등의 물품은 거래 금지 물품입니다.
            </div>
        </div>
    </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>
    const memberNo = "${loginMember.memberNo}";
    const goodsNo = "${goodsInfo.goodsNo}";
    const sellerNo = "${sellerInfo.memberNo}";
    const query = "${category.query}";
</script>

<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="/resources/js/현진/detailedPage.js"></script>
</body>
</html>