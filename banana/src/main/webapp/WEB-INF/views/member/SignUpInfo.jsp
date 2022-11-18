<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon"  sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>

    <script src="https://kit.fontawesome.com/f7459b8054.js"crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1023652dd4.js" crossorigin="anonymous"></script>


    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/hyodong/SignUpInfo.css">
  </head>
  <body>
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

      <div class="signUpInfoClass">
        <div class="SignUpAgreement1">
          <div>회원가입</div>
        </div>
        <div class="SignUpAgreement2">
          <div class="one">
            <div id="lineBreak">
              <i class="fa-solid fa-user-check"></i>
              <p>약관동의</p>
            </div>
          </div>

          <div class="next1">
            <!-- 다음 -->
            <i class="fa-solid fa-circle-chevron-right"></i>
          </div>

          <div class="one" id="midCircle">
            <div id="lineBreak">
              <i class="fa-solid fa-file-pen"></i>
              <p>정보입력</p>
            </div>
          </div>

          <div class="next2">
            <!-- 다음 -->
            <i class="fa-solid fa-circle-chevron-right"></i>
          </div>

          <div class="one">
            <div id="lineBreak">
              <i class="fa-regular fa-circle-check"></i>
              <p>가입완료</p>
            </div>
          </div>
        </div>
        <div class="SignUpAgreement3">
          <div id="SignUpAgreement3-1">개인 정보입력</div>
          <div id="SignUpAgreement3-2">
            * 아래 입력사항은 필수입력 사항입니다. *
          </div>
        </div>

        <!------------------------------------------->
        <form action="" method="POST" name="signUp-frm" id="signUp-frm">


          <div>
            <!-- 아이디(이메일) -->
            <div class="signUp-input-Email textbox">
              <input 
                type="text"
                name="memberEmail"
                id="memberEmail"
                class="inputBox"
                placeholder="아이디 (이메일)"
                maxlength="20"
                autocomplete="off"
              />
              <button type="button" class="checkButton">인증번호 받기</button>
            </div>
            <div class="emailMessageBox">
              <span class="signUp-message"id="emailMessage">메일을 받을 수 있는 이메일을 입력해주세요.</span>
            </div>

            <!-- 인증번호 입력 -->
            <div class="signUp-input-EmailCertification textbox">
              <input
                type="text"
                name="memberEmailCertification"
                id="memberEmailCertification"
                class="inputBox"
                placeholder="인증번호 입력"
                maxlength="6"
                autocomplete="off"
              />
              <button type="button" class="checkButton">인증하기</button>
            </div>
            <div class="firstBox">
              <span class="signUp-message ">인증되었습니다.</span>
            </div>

            <!-- 비밀번호 -->
            <div class="signUp-input-password textbox">
              <input
                type="password"
                name="memberPw"
                class="inputBox"
                id="memberPw"
                placeholder="비밀번호"
                maxlength="20"
              />
            </div>
            <%-- 비밀번호확인 --%>
            <div class="signUp-input-password textbox">
              <input
                type="password"
                name="memberPwConfirm"
                class="inputBox"
                id="memberPwConfirm"
                placeholder="비밀번호 확인"
                maxlength="20"
              />
            </div>
            <div class="firstBox">
              <span class="signUp-message">비밀번호가 일치하지 않습니다.</span>
            </div>

            <!-- 닉네임 -->
            <div class="signUp-input-Nickname textbox">
              <input
                type="text"
                name="memberNickname"
                class="inputBox"
                id="memberNickname"
                placeholder="닉네임"
                maxlength="10"
              />
            </div>
            <div class="firstBox">
              <span class="signUp-message">사용 가능한 닉네임 입니다.</span>
            </div>

            <!-- 이름/생년월일/휴대번호 -->
            <div class="signUp-input-Name textbox">
              <input
                type="text"
                name="memberName"
                class="inputBox"
                id="memberName"
                placeholder="이름"
                maxlength="10"
              />
            </div>
            <div class="signUp-input-Birth textbox">
              <input
                type="text"
                name="memberBirth"
                class="inputBox"
                id="memberBirth"
                placeholder="생년월일 ex)19910502"
                maxlength="8"
                
              />
            </div>
            <div class="signUp-input-Tel textbox">
              <input
                type="text"
                name="memberTel"
                class="inputBox"
                id="memberTel"
                placeholder="휴대번호 ex)01045459986"
                maxlength="11"
              />
            </div>
            <div class="firstBox">
              <span class="signUp-message">전화번호 형식이 올바르지 않습니다</span>
            </div>

            <!-- 우편 번호/주소/상세주소 -->
            <div class="signUp-input-area textbox">
              <input
                type="text"
                name="memberAddress"
                class="inputBox"
                id="memberAddress"
                placeholder="우편번호"
                maxlength="6"
              />
              <button type="button" class="checkButton">검색</button>
            </div>

            <div class="signUp-input-area textbox">
              <input
                auto
                type="text"
                name="memberAddress"
                class="inputBox"
                placeholder="도로명/지번 주소"
              />
            </div>

            <div class="signUp-input-area textbox">
              <input
                type="text"
                name="memberAddress"
                class="inputBox"
                placeholder="상세 주소"
              />
            </div>
          </div>

          <!--------------------------->

          <div class="SignUpAgreement6">
            <button class="SignUp">회원 가입하기</button>
          </div>
        </form>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/hyodong/SignUpInfo.js"></script>
  </body>
</html>
