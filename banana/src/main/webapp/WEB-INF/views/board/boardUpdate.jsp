<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<c:set var="boardName" value="${boardTypeList[boardCode-1].BOARD_NAME}" />

<c:set var="boardName" value="${boardTypeList[boardCode-1].BOARD_NAME}" />
<c:set var="boardCode" value="${boardTypeList[boardCode-1].BOARD_CODE}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>

    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/board/boardWrite.css">
    

   
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>

</head>

<body>


    <main>
        
        <jsp:include page="/WEB-INF/views/common/header.jsp" />


        <section class="question-section">
            <div class="make-question">
                <a href="#">문의/안내 내역</a>
                <a href="#">문의하기</a>
            </div>
            <form action="update" method="POST" 
            enctype="multipart/form-data" id="question-form">
                

                


                <%-- <div class="content-category">
                    <div class="content-category__title left-bar">
                        <div class="title">유형</div>
                        <div class="required">*</div>
                    </div>
                    <div class="content-category__content right-bar">
                        <select name="question-category" id="question-category">

                                <c:forEach var="boardType" items="${boardTypeList}" begin="1">
                                    <option value="${boardType.BOARD_CODE}">${boardType.BOARD_NAME}</option>
                                </c:forEach>
                        </select>
                        <div id="categoryMessage"></div>
                    </div>
                </div> --%>
                <input type="hidden" name="boardType" value="3">


                <div class="content-title">
                    <div class="content-title__title left-bar">
                        <div class="title">제목</div>
                        <div class="required">*</div>
                    </div>
                    <div class="content-title__content right-bar">
                        <input type="text" placeholder="제목을 입력해주세요" name="boardTitle" id="question-title" value="${board.boardTitle}">
                        <div id="titleMessage"></div>
                    </div>
                </div>

                <div class="content-discription">
                    <div class="content-discription__title  left-bar">
                        <div class="title">내용 입력</div>
                        <div class="required">*</div>
                    </div>
                    <div class="content-discription__content right-bar">
                        <textarea rows="5" cols="80" class="introduce" id="question-content"
                            placeholder="내용을 입력해주세요" name="boardContent">${board.boardContent}</textarea>
                            <div id="contentMessage"></div>
                    </div>
                </div>



                <%-- imageList에 존재하는 이미지 순서에 따라 변수 선언 --%>
                <c:forEach items="${board.imageList}" var="img">
                    <c:choose>
                        <c:when test="${img.imageOrder == 0}">
                            <c:set var="img0" value="${img.imagePath}${img.imageRename}"/>
                        </c:when>

                        <c:when test="${img.imageOrder == 1}">
                            <c:set var="img1" value="${img.imagePath}${img.imageRename}"/>
                        </c:when>

                        <c:when test="${img.imageOrder == 2}">
                            <c:set var="img2" value="${img.imagePath}${img.imageRename}"/>
                        </c:when>

                        <c:when test="${img.imageOrder == 3}">
                            <c:set var="img3" value="${img.imagePath}${img.imageRename}"/>
                        </c:when>

                        <c:when test="${img.imageOrder == 4}">
                            <c:set var="img4" value="${img.imagePath}${img.imageRename}"/>
                        </c:when>
                    </c:choose>
                </c:forEach>
            
            
                <div class="img-container">
                    <div class="content-image">
                        <div class="content-image__title left-bar">
                            <div>
                                <div class="title">사진 첨부</div>
                                
                            </div>
        
                            <div class="img__pic-count">(0/5)</div>
                            <%-- <img src="/resources/images/image-upload.png" class="browse-btn"> --%>
                        </div>
                    </div>
        
                    <div class="content-image__content right-bar">
                        
        
                            <!-- <div class="image-show" id="image-show"></div> -->
                            <div class="image-show" id="image-show">

                                <%-- <c:if test="${not empty img0}"> --%>
                                <div class="boardImg">
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
                                <%-- </c:if> --%>

                                <%-- <c:if test="${not empty img1}"> --%>
                                <div class="boardImg">
                                    <label for="img1">
                                    <c:if test="${empty img1}">
                                        <img class="preview" src="/resources/images/image-upload.png">
                                    </c:if>
                                    <c:if test="${not empty img1}">
                                        <img class="preview" src="${img1}">
                                    </c:if>
                                    </label>
                                    <input type="file" name="images" class="inputImage" id="img1" accept="image/*">
                                    <span class="delete-image">&times;</span>
                                </div>
                                <%-- </c:if> --%>

                                <%-- <c:if test="${not empty img2}"> --%>
                                <div class="boardImg">
                                    <label for="img2">
                                    <c:if test="${empty img2}">
                                        <img class="preview" src="/resources/images/image-upload.png">
                                    </c:if>
                                    <c:if test="${not empty img2}">
                                        <img class="preview" src="${img2}">
                                    </c:if>
                                    </label>
                                    <input type="file" name="images" class="inputImage" id="img2" accept="image/*">
                                    <span class="delete-image">&times;</span>
                                </div>
                                <%-- </c:if> --%>

                                <%-- <c:if test="${not empty img3}"> --%>
                                <div class="boardImg">
                                    <label for="img3">
                                    <c:if test="${empty img3}">
                                        <img class="preview" src="/resources/images/image-upload.png">
                                    </c:if>
                                    <c:if test="${not empty img3}">
                                        <img class="preview" src="${img3}">
                                    </c:if>
                                    </label>
                                    <input type="file" name="images" class="inputImage" id="img3" accept="image/*">
                                    <span class="delete-image">&times;</span>
                                </div>
                                <%-- </c:if> --%>

                                <%-- <c:if test="${not empty img4}"> --%>
                                <div class="boardImg">
                                    <label for="img4">
                                    <c:if test="${empty img4}">
                                        <img class="preview" src="/resources/images/image-upload.png">
                                    </c:if>
                                    <c:if test="${not empty img4}">
                                        <img class="preview" src="${img4}">
                                    </c:if>
                                    </label>
                                    <input type="file" name="images" class="inputImage" id="img4" accept="image/*">
                                    <span class="delete-image">&times;</span>
                                </div>
                                <%-- </c:if> --%>
        
        
                            </div>
                        </div>
        
                    </div>
                </div>
                <div class="content-finish">
                    <button type="submit" id="insertBtn">내 문의 수정 완료</button>
                </div>
            <%-- 삭제될 이미지 순서를 저장한 input 태그 --%>
            <input type="hidden" name="deleteList" id="deleteList" value="">

            <%-- 수정 완료 후 리다이렉트시 사용 예정 --%>
            <input type="hidden" name="cp"  value="${param.cp}">
            </form>



        </section>





        

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/board/boardUpdate.js"></script>

</body>
</html>