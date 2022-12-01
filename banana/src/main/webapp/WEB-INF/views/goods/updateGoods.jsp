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
       <jsp:include page="/WEB-INF/views/common/nav.jsp" />


       <%-- imageList에 존재하는 이미지 순서에 따라 변수 선언 --%>
        <c:forEach items="${registerGoods.imageList}" var="img">
            <c:choose>
                <c:when test="${img.imageOrder == 0}">
                    <c:set var="img0" value="${img.imagePath}" />
                </c:when>
            
                <c:when test="${img.imageOrder == 1}">
                    <c:set var="img1" value="${img.imagePath}" />
                </c:when>
            
                <c:when test="${img.imageOrder == 2}">
                    <c:set var="img2" value="${img.imagePath}" />
                </c:when>
            
                <c:when test="${img.imageOrder == 3}">
                    <c:set var="img3" value="${img.imagePath}" />
                </c:when>
            
                <c:when test="${img.imageOrder == 4}">
                    <c:set var="img4" value="${img.imagePath}" />
                </c:when>
            
            </c:choose>
        </c:forEach>

        <section class="goods-register">
            <div class="register__title">
                <p>상품 등록</p>
                <p><span class="required">* 필수 항목</span>은 꼭 입력해주세요</p>
            </div>
            <form name="register__content" id="register__form"  action="/goods/registerGoods" method="post"  enctype="multipart/form-data">

                
                <%-- 
                    <js>
                    0. 만들것 : inputImage, preview, deleteImage(x버튼), deleteSet(imageOrder 저장), originalCount(기존 이미지 갯수)
                    1. forEach구문으로 기존에 등록된 상품정보를 가져다 label태그 안의 img-src에 집어넣음
                    2. 총 갯수 카운트
                    3. 기존의 이미지를 삭제할때-> deleteSet에 추가, imageCount--;
                    4. 기존 이미지 변경 
                        변경성공-> deleteSet에 넣음 / preview에 추가
                        변경취소-> 아무일도 일어나지 않음

                    5. 유효성 검사 : count 갯수가 0일 경우 checkObj.goodsImage = false

                    ------
                    <sts>
                    1. 글 수정(xss, newLineHandling)
                    2. 이미지 수정을 위한 webPath, folderpath 준비
                    3. service로 보냄
                    4. 
                        1) 삭제(deleteSet.size > 0) : in(deleteSet)구문 이용해 기존이미지 삭제
                        2) goodsNo이용해 이미지 몇개인지 확인(이미지 갯수 == 새로 등록할 이미지의 imageOrder 시작번호)
                        2) 변경 + 새로 등록할 이미지 : 추가(imageOrder = originalCount)
                        

                 --%>


                <%-- imageOrder 없앤다면?

                    <js>
                    0. 만들것 : inputImage, preview, deleteImage(x버튼), deleteSet(imageNo 저장), originalCount(기존 이미지 갯수)
                    1. forEach구문으로 기존에 등록된 상품정보를 가져다 label태그 안의 img-src에 집어넣음
                    2. 총 갯수 카운트
                    3. 기존의 이미지를 삭제할때-> deleteSet에 추가, imageCount--;
                    4. 기존 이미지 변경 
                        변경성공-> deleteSet에 넣음 / preview에 추가
                        변경취소-> 아무일도 일어나지 않음
                    5. 새로 추가 : preview에 추가

                    6. 유효성 검사 : count 갯수가 0일 경우 checkObj.goodsImage = false

                    ------
                    <sts>
                    1. 글 수정(xss, newLineHandling)
                    2. 이미지 수정을 위한 webPath, folderpath 준비
                    3. service로 보냄
                    4. 이미지 수정
                        1) 삭제(deleteSet.size > 0) : in(deleteSet)구문 이용해 기존이미지 삭제
                        2) 변경/추가(preview.size > 0) : preview에 추가된 이미지 새로 추가
                        3. 검사 : 각각의 result == 0이라면 throw new Exception
                    5. 커밋 : (글 수정 == 1) && (이미지 삭제 or 이미지 삽입 > 0)이라면 커밋, 아니면 롤백
                        

                 --%>





                <div class="content-image">
                    <div class="content-image__title left-bar">
                        <div>
                            <div class="title">상품 이미지</div>
                            <div class="required">*</div>
                        </div>

                        <div class="img__pic-count">(0/5)</div>
                    </div>
                    <div class="content-image__content right-bar">
                        <%-- <div class="container">
                            <div class="image-upload" id="image-upload">

                                <div class="button">
                                    <label for="chooseFile">
                                        <img src="/resources/images/image-upload.png" class="browse-btn">
                                    </label>
                                </div>
                                <input type="file" id="chooseFile" name="inputImage" accept="image/*"
                                    onchange="return loadFile(this)" multiple/>
                                    <div class="file-list" id="image-show"></div>
                               
                            </div>

                            </div>
                        </div> --%>

                        <div class="goodsImg">
                            <label for="img0">
                            <c:if test="${empty img0}">
                                <img class="preview" src="/resources/images/image-upload.png">
                            </label>
                            <input type="file" name="images" class="inputImage" id="img0" accept="image/*">
                            </c:if>
                            <c:if test="${not empty img0}">
                                <img class="preview" src="${img0}">
                            </label>
                            <input type="file" name="images" class="inputImage" id="img0" accept="image/*">
                            <span class="delete-image">&times;</span>
                            </c:if>
                        </div>

                        <div class="goodsImg">
                            <label for="img0">
                            <c:if test="${empty img1}">
                                <img class="preview" src="/resources/images/image-upload.png">
                            </label>
                            <input type="file" name="images" class="inputImage" id="img0" accept="image/*">
                            </c:if>
                            <c:if test="${not empty img1}">
                                <img class="preview" src="${img1}">
                            </label>
                            <input type="file" name="images" class="inputImage" id="img0" accept="image/*">
                            <span class="delete-image">&times;</span>
                            </c:if>
                        </div>

                        <div class="goodsImg">
                            <label for="img0">
                            <c:if test="${empty img2}">
                                <img class="preview" src="/resources/images/image-upload.png">
                            </label>
                            <input type="file" name="images" class="inputImage" id="img0" accept="image/*">
                            </c:if>
                            <c:if test="${not empty img2}">
                                <img class="preview" src="${img2}">
                            </label>
                            <input type="file" name="images" class="inputImage" id="img0" accept="image/*">
                            <span class="delete-image">&times;</span>
                            </c:if>
                        </div>

                        <div class="goodsImg">
                            <label for="img0">
                            <c:if test="${empty img3}">
                                <img class="preview" src="/resources/images/image-upload.png">
                            </label>
                            <input type="file" name="images" class="inputImage" id="img0" accept="image/*">
                            </c:if>
                            <c:if test="${not empty img3}">
                                <img class="preview" src="${img3}">
                            </label>
                            <input type="file" name="images" class="inputImage" id="img0" accept="image/*">
                            <span class="delete-image">&times;</span>
                            </c:if>
                        </div>

                        <div class="goodsImg">
                            <label for="img0">
                            <c:if test="${empty img4}">
                                <img class="preview" src="/resources/images/image-upload.png">
                            </label>
                            <input type="file" name="images" class="inputImage" id="img0" accept="image/*">
                            </c:if>
                            <c:if test="${not empty img4}">
                                <img class="preview" src="${img4}">
                            </label>
                            <input type="file" name="images" class="inputImage" id="img0" accept="image/*">
                            <span class="delete-image">&times;</span>
                            </c:if>
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

                <div class="content-status">
                    <div class="content-status__title  left-bar">
                        <div class="title">판매 상태</div>
                        <div class="required">*</div>
                    </div>
                    <div class="content-delivery__content right-bar">
                        <select name="sell-status" id="sell-status" disabled>
                            <option selected value="Y">판매중</option>
                            <option value="N">판매완료</option>
                        </select>
                    </div>
                </div>


                <div class="content-finish">
                    <button type="reset">취소</button>
                    <button type="submit">상품 수정 완료</button>
                </div>
            </form>
        </section>
    </main>


  	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/goods/goods-update.js"></script>
</body>

</html>