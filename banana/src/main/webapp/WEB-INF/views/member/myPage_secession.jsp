<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 문자열 관련 메서드를 제공하는 JSTL (EL형식) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon"  sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>

    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/hyodong/myPage_secession.css">
</head>

<body>
    <main>
        <div class="findClass">
            <!-- 바나나 텍스트 -->
            <div class="findHeader">
                <img class="banana" src="/resources/images/banana-logo.png"/>
                <div>
                    <div>바꾸고 나누자 나랑</div>
                    <div>Banana Market</div>
                </div>
            </div>

            <div class="findMainBox">
                <div id="findMainBoxText">회원 탈퇴</div>
            </div>

            <form action="/member/myPage/secession" method="post" id="findForm" name="findForm" onsubmit="return deleteMeber(event)">
                <div>
                    <!--아이디-->
                    <div class="find-input-newEmail textbox">
                        <input 
                        type="text" 
                        name="memberNewEmail"
                        id="memberNewEmail"
                        class="inputBox" 
                        placeholder="아이디(이메일)" 
                        maxlength="20"
                        autocomplete="off">
                    </div>
                    <!-- 비밀번호 -->
                    <div class="find-input-tel textbox">
                        <input 
                        type="password" 
                        name="memberPw" 
                        id="memberPw" 
                        class="inputBox" 
                        placeholder="비밀번호"
                        maxlength="20"
                        autocomplete="off">
                    </div>
                    <!-- 가입한 이름 -->
                    <div class="find-input-name textbox">
                        <input 
                        type="text" 
                        name="memberName" 
                        id="memberName" 
                        class="inputBox" 
                        placeholder="이름"
                        maxlength="20" 
                        autocomplete="off">
                    </div>
                    <div class="newEmailMessageBox">
                        <span class="newEmai-message"id="newEmaiMessage">회원 탈퇴를 위해 본인 회원정보를 입력해주세요.</span>
                    </div>
                </div>

                <div class="findBtnDiv">
                    <button class="find-btn" id="btn_id">회원 탈퇴 하기</button>
                </div>
            </form>
    </main>
        <c:if test="${!empty message}">
        <script>
            alert("${message}")
        </script>

        <c:remove var="message"></c:remove>
    </c:if>
    <script src="/resources/js/hyodong/myPage_secession.js"></script>
</body>
</html>