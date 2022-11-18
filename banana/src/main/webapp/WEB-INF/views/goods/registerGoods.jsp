<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>

    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/goods/goods-register.css">

    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"> </script>

    
</head>

<body>

    <main>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <section class="goods-register">
            <div class="register__title">
                <p>상품 등록</p>
                <p><span class="required">* 필수 항목</span>은 꼭 입력해주세요</p>
            </div>
            <form name="register__content" id="register__content"  action="/goods/registerGoods" method="post"  enctype="multipart/form-data" onsubmit="return submitChk()">

                <div class="content-image">
                    <div class="content-image__title left-bar">
                        <div>
                            <div class="title">상품 이미지</div>
                            <div class="required">*</div>
                        </div>

                        <div class="img__pic-count">(0/10)</div>
                    </div>
                    <div class="content-image__content right-bar">
                        <div class="container">
                            <div class="image-upload" id="image-upload">

                                <!-- <form  method="POST" onsubmit="return false;" enctype="multipart/form-data"> -->
                                    <div class="button">
                                        <label for="chooseFile">
                                            <img src="/resources/images/image-upload.png" class="browse-btn">
                                        </label>
                                    </div>
                                    <input type="file" id="chooseFile" name="imagePath" accept="image/*"
                                        onchange="return loadFile(this)" multiple/>
                                        <div class="file-list" id="image-show"></div>
                                <!-- </form> -->
                            </div>




                            </div>
                        </div>

                    </div>
                </div>
                
                <div class="content-title">
                    <div class="content-title__title left-bar">
                        <div class="title">상품 제목</div>
                        <div class="required">*</div>
                    </div>
                    <div class="content-title__content right-bar">
                        <input type="text" placeholder="상품 제목을 입력해주세요" name="title" id="goodsTitle" value="${registerGoods.title}">
                        <div id="titleMessage"></div>
                    </div>
                </div>

                <div class="content-category">
                    <div class="content-category__title left-bar">
                        <div class="title">카테고리</div>
                        <div class="required">*</div>
                    </div>
                    <div class="content-category__content right-bar">
                        <select name="categoryNo" id="goodsCategory" value="${registerGoods.category}">

                            <option value="">옵션을 선택하세요</option>
                            <option value="1">전자기기</option>
                            <option value="2">가구/인테리어</option>
                            <option value="3">셍활/주방</option>
                            <option value="4">유아용품</option>
                            <option value="5">의류/잡화</option>
                            <option value="6">뷰티/미용</option>
                            <option value="7">취미/게임/음반</option>
                            <option value="8">티켓/도서</option>
                            <option value="9">반려동물용품</option>
                            <option value="10">기타중고물품</option>
                            <option value="11">삽니다</option>
                        </select>
                        <div id="categoryMessage"></div>
                    </div>
                </div>

                <div class="content-discription">
                    <div class="content-discription__title  left-bar">
                        <div class="title">상품설명</div>
                        <div class="required">*</div>
                    </div>
                    <div class="content-discription__content right-bar">
                        <textarea row="5" col="30" class="introduce" id="goodsContent" name="description" value="${registerGoods.description}"
                            placeholder="상품의 상태를 정확하게 알 수 있는 여러 장의 상품  사진과 구입 연도, 브랜드, 사용감, 하자 유무 등 구매자에게 필요한 정보를 꼭 포함해 주세요! 문의를 줄이고 더 쉽게 판매할 수 있어요."></textarea>
                        <div id="contentMessage"></div>
                    </div>
                </div>

                <div class="content-delivery">
                    <div class="content-delivery__title  left-bar">
                        <div class="title">판매 금액</div>
                        <div class="required">*</div>
                    </div>
                    <div class="content-price__content right-bar">
                        <input type="text" placeholder="판매 금액을 입력해주세요(단위 : 원)" name="sellPrice" id="goodsPrice" value="${registerGoods.sellPrice}">
                        <div id="priceMessage"></div>
                        <div id="price">원</div>
                    </div>
                </div>

                <%-- <div class="content-status">
                    <div class="content-status__title  left-bar">
                        <div class="title">판매 상태</div>
                        <div class="required">*</div>
                    </div>
                    <div class="content-delivery__content right-bar">
                        <select name="sell-status" id="sell-status" disabled>
                            <option selected value=>판매중</option>
                            <option>예약중</option>
                            <option>판매완료</option>
                        </select>
                    </div>
                </div> --%>


                <div class="content-finish">
                    <button type="reset">취소</button>
                    <button type="submit">상품 등록 완료</button>
                </div>
            </form>
        </section>
    </main>


  	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/goods/goods-register.js"></script>
</body>

</html>