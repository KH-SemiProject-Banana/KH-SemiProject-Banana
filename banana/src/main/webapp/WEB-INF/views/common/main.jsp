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

    <link rel="stylesheet" href="/resources/css/screens/main.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1023652dd4.js" crossorigin="anonymous"></script>

</head>
<body>
    

    <main>

		<jsp:include page="/WEB-INF/views/common/header.jsp" />
        
        <section class="content"> 
            
            <section class="slider">
                <input type="radio" name="slide" class="slide" id="slide1" checked>
                <input type="radio" name="slide" class="slide" id="slide2">
                <input type="radio" name="slide" class="slide" id="slide3">
                <input type="radio" name="slide" class="slide" id="slide4">
                <input type="radio" name="slide" class="slide" id="slide5">
                
                <ul id="imgHolder" class="imgs">
                    <li><img src="/resources/images/main-add1.jpg" class="slide-img"></li>
                    <li><img src="/resources/images/main-add2.jpg" class="slide-img"></li>
                    <li><img src="/resources/images/main-add3.jfif" class="slide-img"></li>
                    <li><img src="/resources/images/main-add4.jpg" class="slide-img"></li>
                    <li><img src="/resources/images/main-add5.jpg" class="slide-img"></li>
                </ul>
                <div class="bullets">
                    <label for="slide1">&nbsp;</label>
                    <label for="slide2">&nbsp;</label>
                    <label for="slide3">&nbsp;</label>
                    <label for="slide4">&nbsp;</label>
                    <label for="slide5">&nbsp;</label>
                </div>
            </section>

            <section class="content-comment">
                <div>
                    <i class="fa-solid fa-face-laugh-squint"></i>
                    <p class="title">  인기 상품</p>
                </div>
                
                <a href="#">더보기</a>
            </section>



            <section class="content-favorite">
                <div class="favorite__pack">
                    <div>
                        <div class="favorite__img">
                            <a href="">
                                <img src="/resources/images/sampleGoods.jpg" class="favorite__img">
                            </a>
                        </div>
                        <div class="favorite__price-heart">
                            <div class="favorite__price">00원(가격)</div>
                            <div class="favorite__heart">
                                <input type="checkbox" name="heart" id="heart1">
                                <label for="heart1">
                                    <i class="fa-solid fa-heart-circle-plus"></i>
                                </label>
                            </div>
                        </div>
                    </div>
                
                    <div class="favorite__content">상품 이름</div>
                </div>

                <div class="favorite__pack">
                    <div>
                        <div class="favorite__img">
                            <a href="">
                                <img src="/resources/images/sampleGoods.jpg" class="favorite__img">
                            </a>
                        </div>
                        <div class="favorite__price-heart">
                            <div class="favorite__price">00원(가격)</div>
                            <div class="favorite__heart">
                                <input type="checkbox" name="heart" id="heart2">
                                <label for="heart2">
                                    <i class="fa-solid fa-heart-circle-plus"></i>
                                </label>
                            </div>
                        </div>
                    </div>
                
                    <div class="favorite__content">상품 이름</div>
                </div>

                <div class="favorite__pack">
                    <div>
                        <div class="favorite__img">
                            <a href="">
                                <img src="/resources/images/sampleGoods.jpg" class="favorite__img">
                            </a>
                        </div>
                        <div class="favorite__price-heart">
                            <div class="favorite__price">00원(가격)</div>
                            <div class="favorite__heart">
                                <input type="checkbox" name="heart" id="heart3">
                                <label for="heart3">
                                    <i class="fa-solid fa-heart-circle-plus"></i>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="favorite__content">상품 이름</div>
                </div>

                <div class="favorite__pack">
                    <div>
                        <div class="favorite__img">
                            <a href="">
                                <img src="/resources/images/sampleGoods.jpg" class="favorite__img">
                            </a>
                        </div>
                        <div class="favorite__price-heart">
                            <div class="favorite__price">00원(가격)</div>
                            <div class="favorite__heart">
                                <input type="checkbox" name="heart" id="heart4">
                                <label for="heart4">
                                    <i class="fa-solid fa-heart-circle-plus"></i>
                                </label>
                            </div>
                        </div>
                    </div>
                
                    <div class="favorite__content">상품 이름</div>
                </div>

                <div class="favorite__pack">
                    <div>
                        <div class="favorite__img">
                            <a href="">
                                <img src="/resources/images/sampleGoods.jpg" class="favorite__img">
                            </a>
                        </div>
                        <div class="favorite__price-heart">
                            <div class="favorite__price">00원(가격)</div>
                            <div class="favorite__heart">
                                <input type="checkbox" name="heart" id="heart5">
                                <label for="heart5">
                                    <i class="fa-solid fa-heart-circle-plus"></i>
                                </label>
                            </div>
                        </div>
                    </div>
                
                    <div class="favorite__content">상품 이름</div>
                </div>
                
                

                
                
            </section>
            


            <section class="content-comment second">
                
                <div>
                    <i class="fa-solid fa-seedling"></i>
                    <p class="title">  최근글</p>
                </div>
                
                <a href="#">더보기</a>
            </section>



            <section class="content-favorite">
                <div class="favorite__pack">
                    <div>
                        <div class="favorite__img">
                            <a href="">
                                <img src="/resources/images/sampleGoods.jpg" class="new__img">
                            </a>
                        </div>
                        <div class="favorite__price-heart">
                            <div class="favorite__price">00원(가격)</div>
                            <div class="favorite__heart">
                                <input type="checkbox" name="heart" id="heart6">
                                <label for="heart6">
                                    <i class="fa-solid fa-heart-circle-plus"></i>
                                </label>
                            </div>
                        </div>
                    </div>
                
                    <div class="favorite__content">상품 이름</div>
                </div>

                <div class="favorite__pack">
                    <div>
                        <div class="favorite__img">
                            <a href="">
                                <img src="/resources/images/sampleGoods.jpg" class="new__img">
                            </a>
                        </div>
                        <div class="favorite__price-heart">
                            <div class="favorite__price">00원(가격)</div>
                            <div class="favorite__heart">
                                <input type="checkbox" name="heart" id="heart7">
                                <label for="heart7">
                                    <i class="fa-solid fa-heart-circle-plus"></i>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="favorite__content">상품 이름</div>
                </div>

                <div class="favorite__pack">
                    <div>
                        <div class="favorite__img">
                            <a href="">
                                <img src="/resources/images/sampleGoods.jpg" class="new__img">
                            </a>
                        </div>
                        <div class="favorite__price-heart">
                            <div class="favorite__price">00원(가격)</div>
                            <div class="favorite__heart">
                                <input type="checkbox" name="heart" id="heart8">
                                <label for="heart8">
                                    <i class="fa-solid fa-heart-circle-plus"></i>
                                </label>
                            </div>
                        </div>
                    </div>
                
                    <div class="favorite__content">상품 이름</div>
                </div>

                <div class="favorite__pack">
                    <div>
                        <div class="favorite__img">
                            <a href="">
                                <img src="/resources/images/sampleGoods.jpg" class="new__img">
                            </a>
                        </div>
                        <div class="favorite__price-heart">
                            <div class="favorite__price">00원(가격)</div>
                            <div class="favorite__heart">
                                <input type="checkbox" name="heart" id="heart9">
                                <label for="heart9">
                                    <i class="fa-solid fa-heart-circle-plus"></i>
                                </label>
                            </div>
                        </div>
                    </div>
                
                    <div class="favorite__content">상품 이름</div>
                </div>

                <div class="favorite__pack">
                    <div>
                        <div class="favorite__img">
                            <a href="">
                                <img src="/resources/images/sampleGoods.jpg" class="new__img">
                            </a>
                        </div>
                        <div class="favorite__price-heart">
                            <div class="favorite__price">00원(가격)</div>
                            <div class="favorite__heart">
                                <input type="checkbox" name="heart" id="heart10">
                                <label for="heart10">
                                    <i class="fa-solid fa-heart-circle-plus"></i>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="favorite__content">상품 이름</div>
                </div>
                
                
                

                
                
            </section>

        </section>
    </main>

    <script src="/resources/js/main.js"></script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>