<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon"  sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>

    <%--폰트 어썸  https://fontawesome.com/ key --%>
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1023652dd4.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/hyodong/Login.css">
        
</head>
<body>
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <jsp:include page="/WEB-INF/views/common/nav.jsp" />


        <div class="loginClass">
            <!-- 바나나 이미 및 로고 텍스트 -->
            <div class="loginHeader">
                <img class="banana" src="/resources/images/banana-logo.png" />
                <div>바꾸고 나누자 나랑</div>
                <div>Banana Market</div>
            </div>

            <div class="SignUpAgreement3">
                <div id="SignUpAgreement3-1">LOGIN</div>
            </div>

            <form action="/member/login" method="post">
                <div>
                    <!-- 아이디(이메일) -->
                    <div class="signUp-input-Email textbox">
                        <input type="text" 
                        name="memberEmail" 
                        id="memberEmail" 
                        class="inputBox" 
                        placeholder="아이디 (이메일)"
                        maxlength="40" 
                        autocomplete="off" 
                        value="${cookie.saveId.value}">
                    </div>

                    <%-- 쿠키에 saveId가 있는 경우 변수 생성--%>
                    <c:if test="${!empty cookie.saveId.value}">
                        <c:set var="temp" value="checked"/>
                    </c:if>

                    <!-- 아이디 저장 -->
                    <div class="saveId-area">
                        <input type="checkbox" name="saveId" id="saveId" ${temp}>
                        <label for="saveId">
                            <i class="fas fa-check"></i>
                            <div>아이디 저장</div>
                        </label>
                    </div>
        
                    <!-- 비밀번호 -->
                    <div class="signUp-input-password textbox">
                        <input 
                        type="password" 
                        name="memberPw" 
                        class="inputBox" 
                        id="memberPw" 
                        placeholder="비밀번호" 
                        maxlength="20">
                    </div>
                </div>

                <%-- 회원 가입 /찾기 버튼 --%>
                <div class="text-area">
                    <a href="/member/infoFind">ID/PW 찾기</a>
                    <a href="/member/signUp/agreement">회원가입</a>
                </div>

                <%-- 로그인 버튼 --%>
                <div class="loginFooter">
                    <button class="login-btn">로그인</button>
                </div>
            </form>
        </div>
    </main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>