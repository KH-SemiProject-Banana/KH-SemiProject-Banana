function memberSignUpAgreement(){

    // 체크 여부 검사
    const nextSignUp = document.getElementById("nextSignUp");

    // 체크가 되어있지 않은 경우
    if(!nextSignUp.checked){ 
        alert("회원약관에 동의를 해주세요.")
        nextSignUp.focus();
        return false; 
}
    return true;
}