<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 문자열 관련 메서드를 제공하는 JSTL (EL형식) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>

    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/hyodong/memberFindIdPw.css">

</head>

<body>
    <main>
        <div class="findClass">
            <!-- 바나나 이미 및 로고 텍스트 -->
            <div class="findHeader">
                <img class="banana" src="/resources/images/banana-logo.png"/>
                <div>
                    <div>바꾸고 나누자 나랑</div>
                    <div>Banana Market</div>
                </div>
            </div>

            <div class="findMainBox">
                <div id="findMainBoxText">아이디 찾기</div>
            </div>
            
            <form action="/member/findId" method="post" id="findForm" name="findForm">
                <%--------------------- 회원 정보 입력 시작 ---------------------%>
                <div>
                    <!-- 가입한 이름 -->
                    <div class="find-input-name textbox">
                        <input 
                        type="text" 
                        name="memberName" 
                        id="memberName" 
                        class="inputBox" 
                        placeholder="이름"
                        maxlength="20" 
                        autocomplete="off"
                        value="${tempMember.memberName}">
                    </div>
                    <!-- 가입한 전화번호 -->
                    <div class="find-input-tel textbox">
                        <input 
                        type="text" 
                        name="memberTel" 
                        id="memberTel" 
                        class="inputBox" 
                        placeholder="전화번호 ( - 제외)"
                        maxlength="20"
                        autocomplete="off"
                        value="${tempMember.memberTel}">
                    </div>
                    <!-- 메일 받을 새 이메일 -->
                    <div class="find-input-newEmail textbox">
                        <input 
                        type="text" 
                        name="memberNewEmail"
                        id="memberNewEmail"
                        class="inputBox" 
                        placeholder="메일을 받을수 있는 새 이메일" 
                        maxlength="20"
                        autocomplete="off"
                        value="${tempMember.memberNewEmail}">
                    </div>
                    <div class="newEmailMessageBox">
                        <span class="newEmai-message"id="newEmaiMessage">메일을 받을 수 있는 새 메일을 정확하게 입력해주세요.</span>
                    </div>
                </div>
                <%--------------------- 회원 정보 입력 끝 ---------------------%>
                <div class="findBtnDiv">
                    <button class="find-btn" id="btn_id">아이디 찾기</button>
                </div>
            </form>
            <%-- 회원 아이디 찾기 / 비번찾기 변경 버튼 --%>
            <div class="findBox">
                <div class="findID activate" id="findID">아이디 찾기</div>
                <div class="findPW" id="findPW">비밀번호 찾기</div>
            </div>
            
    </main>
    <c:if test="${!empty message}">
        <script>
            alert("${message}")
        </script>
        <c:remove var="message"></c:remove>
    </c:if>
    <script src="/resources/js/hyodong/memberFindIdPw.js"></script>
</body>
</html>