<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 문자열 관련 메서드를 제공하는 JSTL (EL 형식) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon"  sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>

    <%--폰트 어썸  https://fontawesome.com/ key --%>
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
        <%--------------------- 회원 가입 진행도 시작 ---------------------%>
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
        <%--------------------- 회원 가입 진행도 끝 ---------------------%>
        <div class="SignUpAgreement3">
          <div id="SignUpAgreement3-1">개인 정보입력</div>
          <div id="SignUpAgreement3-2">
            * 아래 입력사항은 필수입력 사항입니다. *
          </div>
        </div>

        <!--------------------- 회원 정보 입력 시작  --------------------->
        <form action="/member/signUp/info" method="POST" name="signUp-frm" id="signUp-frm">

          <div>
            <!-- 아이디(이메일) -->
            <div class="signUp-input-Email textbox">
              <input 
                type="text"
                name="memberEmail"
                id="memberEmail"
                class="inputBox"
                placeholder="아이디 (이메일)"
                maxlength="30"
                autocomplete="off"
                value="${tempMember.memberEmail}"
              />
              <button id="sendAuthKeyBtn" type="button" class="checkButton">인증번호 받기</button>
            </div>
            <div class="emailMessageBox">
              <span class="signUp-message"id="emailMessage">인증번호를 받을 수 있는 이메일을 입력해주세요.</span>
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
              <button id="checkAuthKeyBtn" type="button" class="checkButton">인증하기</button>
            </div>
            <div class="firstBox">
              <span id="authKeyMessage" class="signUp-message "></span>
            </div>

            <!-- 비밀번호 -->
            <div class="signUp-input-password textbox">
              <input
                type="password"
                name="memberPw"
                class="inputBox"
                id="memberPw"
                placeholder="비밀번호"
                maxlength="16"
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
                maxlength="16"
              />
            </div>
            <div class="firstBox">
              <span class="signUp-message" id="pwMessage">영문자/숫자/특수문자 포함 8~16글자 사이로 입력해주세요.</span>
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
                value="${tempMember.memberNickname}"
              />
            </div>
            <div class="firstBox">
              <span class="signUp-message" id="nickMessage">한글,영어,숫자로만 2~10글자 사이로 입력해주세요.</span>
            </div>

            <!-- 이름/생년월일/휴대번호 -->
            <%-- 이름 --%>
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
              <%-- 생년월일 --%>
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
              <div class="firstBox">
                <span class="signUp-message" id="birthMessage">숫자로 생년월일 8자리를 입력해주세요.</span>
              </div>
              <%-- 휴대번호 --%>
            <div class="signUp-input-Tel textbox">
              <input
                type="text"
                name="memberTel"
                class="inputBox"
                id="memberTel"
                placeholder="휴대번호 ex)01045459986"
                maxlength="11"
                value="${tempMember.memberTel}"
              />
            </div>
            <div class="firstBox">
              <span class="signUp-message" id="temlMessage">전화번호를 입력해 주세요.(-제외)</span>
            </div>

            <%-- 주소 문자열 -> 배열로 쪼개기 --%>
            <c:set var="addr" value="${fn:split(tempMember.memberAddress,',,')}" />

            <!-- 우편 번호/주소/상세주소 -->
            <%-- 우편번호 --%>
            <div class="signUp-input-area textbox">
              <input
                type="text"
                name="memberAddress"
                class="inputBox"
                id="sample6_postcode"
                placeholder="우편번호"
                maxlength="6"
                value="${addr[0]}"
              />
              <button type="button" class="checkButton" onclick="sample6_execDaumPostcode()">검색</button>
            </div>
            <%-- 도로명/지번 주소 --%>
            <div class="signUp-input-area textbox">
              <input
                auto
                type="text"
                name="memberAddress"
                class="inputBox"
                id="sample6_address"
                placeholder="도로명/지번 주소"
                value="${addr[1]}"
              />
            </div>
            <%-- 상세주소 --%>
            <div class="signUp-input-area textbox">
              <input
                type="text"
                name="memberAddress"
                class="inputBox"
                id="sample6_detailAddress"
                placeholder="상세 주소"
                value="${addr[2]}"
              />
            </div>
          </div>
          <div class="firstBox">
            <span class="signUp-message" id="addMessage">검색을 눌러 주소를 입력해 주세요.</span>
          </div>

          <!--------------------- 회원 정보 입력 끝  --------------------->
          <%-- 회원 가입 다음 단계 --%>
          <div class="SignUpAgreement6">
            <button class="SignUp">회원 가입하기</button>
          </div>
        </form>
      </div>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <!-- jQuery 라이브러리(.js 파일) 추가(CDN 방식) -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <script src="/resources/js/hyodong/SignUpInfo.js"></script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  </body>
</html>
