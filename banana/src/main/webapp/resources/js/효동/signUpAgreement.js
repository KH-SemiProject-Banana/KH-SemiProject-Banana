//인라인 모델로 탈퇴처리
function memberSignUpAgreement(){


    // 체크 여부 검사
    const nextSignUp = document.getElementById("nextSignUp");

    // 체크가 되어있지 않은 경우
    if(!nextSignUp.checked){ 
        alert("회원약관에 동의를 해주세요")
        nextSignUp.focus();
        return false; 
}

    // 탈퇴여부 확인
    // if(!confirm("정말로 탈퇴 하시겠습니까?")){
    //     alert("탈퇴 취소");
    //     return false;
    // }
        
    return true;

}