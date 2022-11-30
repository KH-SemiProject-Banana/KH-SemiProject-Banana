<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
                <button href="/board/${boardCode}" id="questionList">전체보기</button>
                <button href="/question/myQuestion" id="myQuestionList">나의 문의/안내 내역</button>
            </div>
            <form action="/write/${boardCode}" method="POST" enctype="multipart/form-data" id="question-form">
                

                

<%-- 
                <div class="content-category">
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
                        <input type="text" placeholder="제목을 입력해주세요" name="boardTitle" id="question-title" >
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
                            placeholder="내용을 입력해주세요" name="boardContent"></textarea>
                            <div id="contentMessage"></div>
                    </div>
                </div>



                
                
            
            
                <div class="img-container">
                    <div class="content-image">
                        <div class="content-image__title left-bar">
                            <div>
                                <div class="title">사진 첨부</div>
                                
                            </div>
        
                            <div class="img__pic-count">(0/5)</div>
                        </div>
                    </div>
        
                    <div class="content-image__content right-bar">
                        <div class="container">
                            <div class="image-upload" id="image-upload">
        
                                <%-- <form method="post"  enctype="multipart/form-data"> --%>
                                    <div class="button">
                                        <label for="chooseFile">
                                            <img src="/resources/images/image-upload.png" class="browse-btn">
                                        </label>
                                    </div>
                                    <input type="file" id="chooseFile" name="images" accept="image/*"
                                        onchange="return loadFile(this)" multiple />
                                        <div class="file-list" id="image-show"></div>
                                <%-- </form> --%>
                            </div>
        
                            <!-- <div class="image-show" id="image-show"></div> -->
                            <div class="image-show" id="image-show">
        
        
        
                            </div>
                        </div>
        
                    </div>
                </div>
                <div class="content-finish">
                    <button type="submit" id="insertBtn">문의하기</button>
                </div>
            </form>



        </section>






    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script>
        const boardCode = "${boardCode}";
        const loginMember = "${loginMember}"
    </script>




    <script src="/resources/js/board/boardWrite.js"></script>
</body>

</html>