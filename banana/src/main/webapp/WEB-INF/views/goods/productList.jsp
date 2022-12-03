<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="goodsList" value="${map.goodsList}" />
<c:set var="categoryPagination" value="${map.categoryPagination}" />
<c:set var="locAddress" value="" />
<c:set var="order" value="" />
<c:set var="query" value="${category.query}"/>

<c:forEach var="i" items="${paramValues.location}">
    <c:set var="locAddress" value="${locAddress}${'&location='}${i}" />
</c:forEach>

<c:if test="${param.order != null}">
    <c:set var="order" value="${'&order='}${param.order}"/>
</c:if>

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
            <c:if test='${category.query == null}'>
                <a href="#">> ${category.categoryName}</a>
            </c:if>



            </div>

            <div class="category_title">
                <c:if test='${category.query == null}'>
                    <h1>${category.categoryName}</h1>
                </c:if>  
                <c:if test='${category.query != null}'>
                    <h1>"${category.categoryName}" 검색 결과</h1>
                </c:if>  
                   
                
            </div>
            
            <form id="searchGu" action="/category?categoryNo=${category.categoryNo}&query=${category.query}">
                <input type="hidden" name="categoryNo" value="${category.categoryNo}">
                <input type="hidden" name="query" value="${category.query}">

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
                        <option value="/category?categoryNo=${category.categoryNo}${locAddress}&order=1">최신순</option>
                        <option value="/category?categoryNo=${category.categoryNo}${locAddress}&order=2">저가순</option>
                        <option value="/category?categoryNo=${category.categoryNo}${locAddress}&order=3">고가순</option>
                    </select>
                </div>
            </div>
            
            <div>
                <c:set var="i" value="1" />
                <c:set var="e" value="true" />
                <c:forEach var="goods" items="${goodsList}">
                    
                    <c:if test="${i%4 == 1}">
                        <section>
                        <c:set var="e" value="false" />
                    </c:if>
                    
                    <c:choose>
                        <c:when test="${i%4 == 0}">
                            <div class="imgList_row imgList_row_end">
                        </c:when>

                        <c:otherwise>
                            <div class="imgList_row">
                        </c:otherwise>
                    </c:choose>

                        <c:choose>
                            <c:when test="${loginMember.memberNo == goods.memberNo}">
                                <input type="checkbox" id="like${i}" class="likeChk" value="${goods.goodsNo}" checked>
                            </c:when>

                            <c:otherwise>
                                <input type="checkbox" id="like${i}" class="likeChk" value="${goods.goodsNo}">
                            </c:otherwise>
                        </c:choose>
                        
                        <label for="like${i}" class="like_yn"><i class="fa-solid fa-heart"></i></label>

                        <c:choose>
                            <c:when test="${goods.imagePath == null}">
                                <a href="/detailed"><img src="../../resources/images/noImage.png"></a>
                            </c:when>

                            <c:otherwise>
                                <a href="/detailed"><img src="${goods.imagePath}"></a>
                            </c:otherwise>
                        </c:choose>

                        <span><h2><a href="/detailed" class="title">${goods.title}</a></h2></span>
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
            </div>

            <div class="pageList">
                <a href="/category?categoryNo=${category.categoryNo}${locAddress}${order}&cp=${categoryPagination.prevPage}&query=${category.query}" class="page" id="leftArrow">&lt;</a>

                <c:forEach var="i" begin="${categoryPagination.startPage}" end="${categoryPagination.endPage}" step="1">
                    <c:choose>
                        <c:when test="${i == categoryPagination.currentPage}">
                            <a class="page selectPage">${i}</a>
                        </c:when>

                        <c:otherwise>
                            <a href="/category?categoryNo=${category.categoryNo}${locAddress}${order}&cp=${i}&query=${category.query}" class="page otherPage">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <a href="/category?categoryNo=${category.categoryNo}${locAddress}${order}&cp=${categoryPagination.nextPage}&query=${category.query}" class="page" id="rightArrow">&gt;</a>
            </div>
        </div>
    </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>
    const memberNo = "${loginMember.memberNo}";
</script>

<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="/resources/js/현진/productList.js"></script>
</body>
</html>