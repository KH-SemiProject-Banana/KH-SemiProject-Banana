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

</head>
<body>
    

    <main>
        <!-- header 시작----------------------------------------------------------------------------------------- -->
        <header>
            <section class="section-topmenu">
                <a href="#" class="topmenu__talk fa-regular fa-comment">바나나톡</a>
                <a href="#" class="topmenu__login">로그인/회원가입</a>
            </section>
            <section class="section-query">
                <div class="query__area">
                    <a href="#">
                        <img src="images/banana-logo.png" id="logo-img">
                    </a>
                    <div class="query__logo">
                        <p>바꾸고 나누자 나랑</p>
                        <p id="query__banana">Banana Market</p>
                    </div>
                </div>
                
                <article class="search-area">
            
                    <!-- form : 내부 input태그의 값을 서버 또는 페이지로 전달(제출) -->
                    <form action="#">
                        <fieldset>
                            <input type="search" id="query" name="query" placeholder="검색어를 입력해주세요">
                            <button type="submit" id="search-btn" class="fa-solid fa-magnifying-glass">
                            </button>
                        </fieldset>
                    </form>
                </article>
                <div class="sellingMy">
                    <div>내 물건<br>판매하기</div>
                </div>
            </section>
            
        </header>

        <nav>
            
            <ul>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-heart"></i>
                            <p>인기매물</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-computer"></i>
                            <p>전자기기</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-couch"></i>
                            <p>가구/인테리어</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-kitchen-set"></i>
                            <p>생활/주방</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-baby"></i>
                            <p>유아용품</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-shirt"></i>
                            <p>의류/잡화</p>
                        </div>
                    </a></li>
            
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-wand-magic-sparkles"></i>
                            <p>뷰티/미용</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-icons"></i>
                            <p>취미/게임/음반</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-book"></i>
                            <p> 티켓/도서</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-dog"></i>
                            <p>반려동물용품</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-brands fa-stack-overflow"></i>
                            <p>기타중고물품</p>
                        </div>
                    </a></li>
                <li class="category_list">
                    <a href="#">
                        <div class="category__detail">
                            <i class="fa-solid fa-hand-holding"></i>
                            <p>삽니다</p>
                        </div>
                    </a></li>
            </ul>
        </nav>

 <!-- header 끝----------------------------------------------------------------------------------------- -->

        
        <section class="content"> 
            
            <section class="slider">
                <input type="radio" name="slide" class="slide" id="slide1" checked>
                <input type="radio" name="slide" class="slide" id="slide2">
                <input type="radio" name="slide" class="slide" id="slide3">
                <input type="radio" name="slide" class="slide" id="slide4">
                <input type="radio" name="slide" class="slide" id="slide5">
                
                <ul id="imgHolder" class="imgs">
                    <li><img src="images/main-add1.jpg" class="slide-img"></li>
                    <li><img src="images/main-add2.jpg" class="slide-img"></li>
                    <li><img src="images/main-add3.jfif" class="slide-img"></li>
                    <li><img src="images/main-add4.jpg" class="slide-img"></li>
                    <li><img src="images/main-add5.jpg" class="slide-img"></li>
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
                    <p class=" title">  인기 상품</p>
                </div>
                
                <a href="#">더보기</a>
            </section>



            <section class="content-favorite">
                <div class="favorite__pack">
                    <div>
                        <div class="favorite__img">
                            <a href="">
                                <img src="images/sampleGoods.jpg" class="favorite__img">
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
                                <img src="images/sampleGoods.jpg" class="favorite__img">
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
                                <img src="images/sampleGoods.jpg" class="favorite__img">
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
                                <img src="images/sampleGoods.jpg" class="favorite__img">
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
                                <img src="images/sampleGoods.jpg" class="favorite__img">
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
                                <img src="images/sampleGoods.jpg" class="new__img">
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
                                <img src="images/sampleGoods.jpg" class="new__img">
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
                                <img src="images/sampleGoods.jpg" class="new__img">
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
                                <img src="images/sampleGoods.jpg" class="new__img">
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
                                <img src="images/sampleGoods.jpg" class="new__img">
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

    
 <!-- footer 시작----------------------------------------------------------------------------------------- -->

    <footer>
        <p>
            Copyright &copy; KH Information Educational Institute A-Class 중고거래 프로젝트 팀
        </p>
        <article>
            <a href="#">프로젝트 소개</a>
            <span> | </span>
            <a href="#">이용약관</a>
            <span> | </span>
            <a href="#">개인정보취급방침</a>
            <span> | </span>
            <a href="#">고객센터</a>
        </article>
    </footer>
     <!-- footer 끝----------------------------------------------------------------------------------------- -->


</body>
</html>