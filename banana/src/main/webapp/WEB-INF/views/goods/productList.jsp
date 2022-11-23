<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="goodsList" value="${map.goodsList}" />
<c:set var="pagination" value="${map.pagination}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon"  sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/현진/productList.css">
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
    <style>nav{z-index: 5;}</style>
</head>
<body>
    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <jsp:include page="/WEB-INF/views/common/nav.jsp" />
        

        <div class="mainContent">
            <div class="category">
                <a href="/">HOME</a>
                <a href="#">> ${category.categoryName}</a>
            </div>

            <div class="category_title">
                <h1>${category.categoryName}</h1>
            </div>
            
            <form id="searchGu" action="/category/Gu?categoryNo=${category.categoryNo}">
                <input type="hidden" name="categoryNo" value="${category.categoryNo}">
                <div><h2>우리 동네에서 찾기</h2></div>
            
                <div class="location">
                    <div>
                        <ul>
                            <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="강남구"> 강남구</label></li>
                            <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="강동구"> 강동구</label></li>
                            <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="강북구"> 강북구</label></li>
                            <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="강서구"> 강서구</label></li>
                            <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="관악구"> 관악구</label></li>
                            <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="광진구"> 광진구</label></li>
                            <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="구로구"> 구로구</label></li>
                            <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="금천구"> 금천구</label></li>
                            <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="노원구"> 노원구</label></li>
                            <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="도봉구"> 도봉구</label></li>
                        </ul>
                    </div>
                
                    <div>
                        <ul>
                        <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="동대문구"> 동대문구</label></li>
                        <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="동작구"> 동작구</label></li>
                        <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="마포구"> 마포구</label></li>
                        <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="서대문구"> 서대문구</label></li>
                        <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="서초구"> 서초구</label></li>
                        <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="성동구"> 성동구</label></li>
                        <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="성북구"> 성북구</label></li>
                        <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="송파구"> 송파구</label></li>
                        <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="양천구"> 양천구</label></li>
                        <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="영등포구"> 영등포구</label></li>
                        </ul>
                    </div>

                    <div>
                        <ul>
                            <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="용산구"> 용산구</label></li>
                            <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="은평구"> 은평구</label></li>
                            <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="종로구"> 종로구</label></li>
                            <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="중구"> 중구</label></li>
                            <li><label><input type="checkbox" name="location" onclick="count_check(this)" value="중랑구"> 중랑구</label></li>
                        </ul>
                    </div>
                </div>

                <button>검색</button>
            </form>
            
            <div class="rightOption">
                <div id="Gu"></div>

                <div class="selectBox">
                    <select onchange="window.open(value,'_self');">
                        <option value="#">최신순</option>
                        <option value="#">저가순</option>
                        <option value="#">고가순</option>
                    </select>
                </div>
            </div>
            
            <div>
                <!-- var는 변수, value는 뭐... 말그대로 값 -->
                <!--  -->
                <c:set var="i" value="1" />
                <c:set var="e" value="true" />
                <c:forEach var="goods" items="${goodsList}">
                    
                    <c:if test="${i%4 == 1}">
                        <section>
                        <c:set var="e" value="false" />
                    </c:if>

                        <div class="imgList_row">
                            <input type="checkbox" name="like${i}" id="like${i}">
                            <label for="like${i}" class="like_yn"><i class="fa-solid fa-heart"></i></label>

                            <c:choose>
                                <c:when test="${goods.imagePath == null}">
                                    <a href="/detailed"><img src="../../resources/images/noImage.png"></a>
                                </c:when>

                                <c:otherwise>
                                    <a href="/detailed"><img src="${goods.imagePath}"></a>
                                </c:otherwise>
                            </c:choose>

                            <span><h2><a href="/detailed">${goods.title}</a></h2></span>
                            <span><h3><a href="/detailed"><fmt:formatNumber value="${goods.sellPrice}" pattern="#,###"/></a></h3></span>
                        </div>

                    <c:if test="${i%4 == 0}">
                        </section>
                        <c:set var="e" value="true" />
                    </c:if>

                    <c:set var="i" value="${i+1}" />

                </c:forEach>

                <c:if test="${e eq false}">
                    </section>
                </c:if>

                <!-- <section>
                    <div class="imgList_row">
                        <input type="checkbox" name="like1" id="like1">
                        <label for="like1" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="/detailed"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="/detailed">피카츄 스티커</a></h2></span>
                        <span><h3><a href="/detailed">5,000원</a></h3></span>
                    </div>
                    
                    <div class="imgList_row">
                        <input type="checkbox" name="like2" id="like2">
                        <label for="like2" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                    
                    <div class="imgList_row">
                        <input type="checkbox" name="like3" id="like3">
                        <label for="like3" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                    
                    <div class="imgList_row">
                        <input type="checkbox" name="like4" id="like4">
                        <label for="like4" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                </section>

                <section>
                    <div class="imgList_row">
                        <input type="checkbox" name="like5" id="like5">
                        <label for="like5" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                    
                    <div class="imgList_row">
                        <input type="checkbox" name="like6" id="like6">
                        <label for="like6" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                    
                    <div class="imgList_row">
                        <input type="checkbox" name="like7" id="like7">
                        <label for="like7" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                    
                    <div class="imgList_row">
                        <input type="checkbox" name="like8" id="like8">
                        <label for="like8" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                </section>

                <section>
                    <div class="imgList_row">
                        <input type="checkbox" name="like9" id="like9">
                        <label for="like9" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                    
                    <div class="imgList_row">
                        <input type="checkbox" name="like10" id="like10">
                        <label for="like10" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                    
                    <div class="imgList_row">
                        <input type="checkbox" name="like11" id="like11">
                        <label for="like11" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                    
                    <div class="imgList_row">
                        <input type="checkbox" name="like12" id="like12">
                        <label for="like12" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                </section>

                <section>
                    <div class="imgList_row">
                        <input type="checkbox" name="like13" id="like13">
                        <label for="like13" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                    
                    <div class="imgList_row">
                        <input type="checkbox" name="like14" id="like14">
                        <label for="like14" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                    
                    <div class="imgList_row">
                        <input type="checkbox" name="like15" id="like15">
                        <label for="like15" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                    
                    <div class="imgList_row">
                        <input type="checkbox" name="like16" id="like16">
                        <label for="like16" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                </section>

                <section>
                    <div class="imgList_row">
                        <input type="checkbox" name="like17" id="like17">
                        <label for="like17" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                    
                    <div class="imgList_row">
                        <input type="checkbox" name="like18" id="like18">
                        <label for="like18" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                    
                    <div class="imgList_row">
                        <input type="checkbox" name="like19" id="like19">
                        <label for="like19" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                    
                    <div class="imgList_row">
                        <input type="checkbox" name="like20" id="like20">
                        <label for="like20" class="like_yn"><i class="fa-solid fa-heart"></i></label>
                        <a href="#"><img src="../../resources/images/pikachu.jpg"></a>
                        <span><h2><a href="#">피카츄 스티커</a></h2></span>
                        <span><h3><a href="#">5,000원</a></h3></span>
                    </div>
                </section> -->
            </div>

            <div class="pageList">
                <span class="page" id="leftArrow">&lt;</span>
                <a href="#" class="page pageNo">1</a>
                <a href="#" class="page pageNo">2</a>
                <a href="#" class="page pageNo">3</a>
                <a href="#" class="page pageNo">4</a>
                <a href="#" class="page pageNo">5</a>
                <a href="#" class="page pageNo">6</a>
                <a href="#" class="page pageNo">7</a>
                <a href="#" class="page pageNo">8</a>
                <a href="#" class="page pageNo">9</a>
                <a href="#" class="page pageNo">10</a>
                <span class="page" id="rightArrow">&gt;</span>
            </div>
        </div>
    </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script src="/resources/js/현진/productList.js"></script>
</body>
</html>