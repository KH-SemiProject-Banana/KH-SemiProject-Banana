<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 문자열 관련 메서드를 제공하는 JSTL (EL형식) --%>
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
    <link rel="stylesheet" href="/resources/css/hyodong/myPage_UpdateInfo.css">

  </head>
  <body>
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="signUpInfoClass">
        <div class="SignUpAgreement1">
            <div>내 정보 수정</div>
        </div>

        <div class="SignUpAgreement3">
            <div id="SignUpAgreement3-1">개인 정보 수정</div>
            <div id="SignUpAgreement3-2">* 회색 부분은 수정이 불가능합니다. *</div>
        </div>

        <!--------------------- 회원 정보 수정 입력 시작  --------------------->
        <form action="/member/myPage/updateInfo" method="POST" name="signUp-frm" id="signUp-frm">

          <div>
            <!-- 아이디(이메일) -->
            <div class="signUp-input-Email textboxNo">
              <input 
                type="text"
                name="memberEmail"
                id="memberEmail"
                class="inputBoxNo"
                placeholder="아이디 (이메일)"
                maxlength="30"
                autocomplete="off"
                value="${loginMember.memberEmail}"
                disabled
              />
            </div>

            <!-- 새 비밀번호 -->
            <div class="signUp-input-password textbox">
              <input
                type="password"
                name="memberPw"
                class="inputBox"
                id="memberPw"
                placeholder="새 비밀번호"
                maxlength="16"
              />
            </div>
            <%-- 새 비밀번호확인 --%>
            <div class="signUp-input-password textbox">
              <input
                type="password"
                name="memberPwConfirm"
                class="inputBox"
                id="memberPwConfirm"
                placeholder="새 비밀번호 확인"
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
                value="${loginMember.memberNickname}"
              />
              <%-- <input type = "hidden" id= "memberNicknameBefore" value="${loginMember.memberNickname}"/>
              ${loginMember.memberNickname} 값을 아래 선언해서 외부스크립트에서 사용가능
              --%>
            </div>
            <div class="firstBox">
              <span class="signUp-message" id="nickMessage">한글,영어,숫자로만 2~10글자 사이로 입력해주세요.</span>
            </div>

            <!-- 이름/생년월일/휴대번호 -->
            <%-- 이름 --%>
            <div class="signUp-input-Name textboxNo">
              <input
                type="text"
                name="memberName"
                class="inputBoxNo"
                id="memberName"
                placeholder="이름"
                maxlength="10"
                disabled
                value="${loginMember.memberName}"
              />
            </div>
              <%-- 생년월일 --%>
            <div class="signUp-input-Birth textboxNo">
              <input
                type="text"
                name="memberBirth"
                class="inputBoxNo"
                id="memberBirth"
                placeholder="생년월일 ex)19910502"
                maxlength="8"
                disabled
                value="${loginMember.memberBirth}"
              />
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
                value="${loginMember.memberTel}"
              />
            </div>
            <div class="firstBox">
              <span class="signUp-message" id="temlMessage">전화번호를 입력해 주세요.(-제외)</span>
            </div>

            <%-- 주소 문자열 -> 배열로 쪼개기 --%>
            <c:set var="addr" value="${fn:split(loginMember.memberAddress,',,')}" />
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
            <%-- 상세 주소 --%>
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
          <!--------------------- 회원 정보 수정 입력 끝  --------------------->

          <div class="SignUpAgreement6">
              <a href="/member/myPage/secessionPage" class="secession">회원 탈퇴</a><%-- 수정중 --%>
              <button class="SignUp">내 정보 수정 완료</button>
          </div>
        </form>

      </div>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script>
      const existingMemberNickname="${loginMember.memberNickname}";
      const existingMemberTel="${loginMember.memberTel}";
    </script>
    <!-- jQuery 라이브러리(.js 파일) 추가(CDN 방식) -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="/resources/js/hyodong/myPage_UpdateInfo.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  </body>
</html>
