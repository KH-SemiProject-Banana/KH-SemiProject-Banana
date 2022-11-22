<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                <a href="#">> ${category.categoryName}</a> 
            </div>

            <div class="product">
                <section>
                    <div class="slideshow-container">
  
                        <div class="mySlides">
                            <img src="../../resources/images/pikachu.jpg">
                        </div>
                      
                        <div class="mySlides">
                            <img src="../../resources/images/sampleGoods.jpg">
                        </div>
                      
                        <div class="mySlides">
                            <img src="../../resources/images/pikachu.jpg">
                        </div>
                      
                        <div class="mySlides">
                            <img src="../../resources/images/sampleGoods.jpg">
                        </div>
                      
                        <div class="mySlides">
                            <img src="../../resources/images/pikachu.jpg">
                        </div>
                      
                        <div class="arrow slide-arrow prev" onclick="plusSlides(-1)">&#10094;</div>
                        <div class="arrow slide-arrow next" onclick="plusSlides(1)">&#10095;</div>
                      </div>
                      
                      <div class="dot-container">
                        <div class="arrow list-arrow prev" onclick="plusSlides(-1)">&#10094;</div>
                      
                        <div class="dot-list">
                            <div class="dot" onclick="currentSlide(1)">
                                <img src="../../resources/images/pikachu.jpg">
                            </div> 
                      
                            <div class="dot" onclick="currentSlide(2)">
                                <img src="../../resources/images/sampleGoods.jpg">
                            </div>
                      
                            <div class="dot" onclick="currentSlide(3)">
                                <img src="../../resources/images/pikachu.jpg">
                            </div>
                      
                            <div class="dot" onclick="currentSlide(4)">
                                <img src="../../resources/images/sampleGoods.jpg">
                            </div>
                      
                            <div class="dot" onclick="currentSlide(5)">
                                <img src="../../resources/images/pikachu.jpg">
                            </div>
                        </div>
                      
                        <div class="arrow list-arrow next" onclick="plusSlides(1)">&#10095;</div>
                      </div>
                </section>

                <section class="product_intro">
                    <div class="product_top">
                        <div class="top_left"><span>판매중</span></div>
                        <div class="top_right"><span><a href="#">신고</a></span></div>
                        <div class="top_right"><span>|</span></div>
                        <div class="top_right"><span>찜 2</span></div>
                        <div class="top_right"><span>|</span></div>
                        <div class="top_right"><span>26분 전</span></div>
                    </div>

                    <div class="product_title">
                        <h2>피카츄 스티커 팔아요</h2>
                        <h2>5,000원</h2>
                    </div>

                    <div class="product_option">
                        <div>
                            <h3>거래방법</h3>
                            <span>택배</span>
                        </div>

                        <div>
                            <h3>거래장소/배송출발지</h3>
                            <span>서울시 중구</span>
                        </div>
                    </div>

                    <div class="detailed_intro">
                        <h3>상세설명</h3>
                        <span>
                            피카츄 또 나왔어 짜증나
                        </span>
                    </div>

                    <div class="like_talk">
                        <div>
                            <input type="checkbox" name="like" id="like">
                            <label for="like" id="like-icon"><i class="fa-solid fa-heart-circle-plus icon-change"></i></label>
                        </div>
                        <div><button>바나나톡</button></div>
                    </div>
                </section>
            </div>

            <div class="seller">
                <div class="seller_profile">
                    <div class="seller_img">
                        <a href="#"><img src="../../resources/images/ribbit.png"></a>
                        <span><a href="#">깨꾹이</a></span>
                    </div>

                    <div>
                        <div  class="seller_product">
                            <span><a href="#">상품</a></span>
                            <span><a href="#">556</a></span>
                        </div>

                        <div class="manner">
                            <span>매너온도</span>
                            <div></div>
                        </div>
                    </div>
                </div>

                <div class="seller_other">
                    <div class="other_menu"> 
                        <span>판매자의 다른 상품</span>
                        <span><a href="#">전체보기 ></a></span>
                    </div>

                    <div class="other_list">
                        <div class="other_img">
                            <a href="#"><img src="../../resources/images/../../resources/images/pikachu.jpg"></a>
                            <span><a href="#">피카츄 스티커</a></span>
                            <span><a href="#"><h4>5,000원</h4></a></span>
                        </div>

                        <div class="other_img">
                            <a href="#"><img src="../../resources/images/../../resources/images/pikachu.jpg"></a>
                            <span><a href="#">피카츄 스티커</a></span>
                            <span><a href="#"><h4>5,000원</h4></a></span>
                        </div>

                        <div class="other_img">
                            <a href="#"><img src="../../resources/images/../../resources/images/pikachu.jpg"></a>
                            <span><a href="#">피카츄 스티커</a></span>
                            <span><a href="#"><h4>5,000원</h4></a></span>
                        </div>

                        <div class="other_img">
                            <a href="#"><img src="../../resources/images/../../resources/images/pikachu.jpg"></a>
                            <span><a href="#">피카츄 스티커</a></span>
                            <span><a href="#"><h4>5,000원</h4></a></span>
                        </div>

                        <div class="other_img">
                            <a href="#"><img src="../../resources/images/../../resources/images/pikachu.jpg"></a>
                            <span><a href="#">피카츄 스티커</a></span>
                            <span><a href="#"><h4>5,000원</h4></a></span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="precautions">
                    * 거래 시 주의 사항
            </div>
        </div>
    </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script src="/resources/js/현진/detailedPage.js"></script>
</body>
</html>