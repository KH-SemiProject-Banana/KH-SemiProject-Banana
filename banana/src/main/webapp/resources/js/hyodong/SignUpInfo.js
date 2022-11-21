const checkObj = {
    "memberEmail"   : false,
    "memberPw"      : false,
    "memberPwConfirm" : false,
    "memberNickname" : false,
    "memberBirth" : false,
    "memberTel" : false,
    "memberEmailCertification" : false
}
// 회원 가입 양식이 제출 되었을 때
document.getElementById("signUp-frm").addEventListener("submit",function(event){

    for(let key in checkObj){

        let str;

        if(!checkObj[key]){

            switch(key){
                case "memberEmail"              : str = "이메일이 유효하지 않습니다.";        break;
                case "memberPw"                 : str = "비밀번호가 유효하지 않습니다.";      break;
                case "memberPwConfirm"          : str = "비밀번호 확인이 유효하지 않습니다."; break;
                case "memberNickname"           : str = "닉네임이 유효하지 않습니다.";        break;
                case "memberBirth"              : str = "생년월일이 유효하지 않습니다.";      break;
                case "memberTel"                : str = "전화번호가 유효하지 않습니다.";      break;
                case "memberEmailCertification" : str = "인증이 완료되지 않았습니다.";        break;
            }
            alert(str);
            document.getElementById(key).focus();
            event.preventDefault(); // 제출 이벤트 제거
            return; 
        }
    }
})

/*************************** 이메일 유효성 검사 ***************************/
const memberEmail = document.getElementById("memberEmail");
const emailMessage = document.getElementById("emailMessage");

memberEmail.addEventListener("input",()=>{

    // 미입력시
    if(memberEmail.value.trim().length == 0){
        emailMessage.innerText="인증번호를 받을 수 있는 이메일을 입력해주세요.";
        emailMessage.classList.remove("confirm","error");emailMessage
        memberEmail.value="";
        checkObj.memberEmail = false;
        return;
    }

    // 정규표현식
    const regEx = /^[A-Za-z\d\-\_]{4,}@[\w\-\_]+(\.\w+){1,3}$/;
    
    if(regEx.test(memberEmail.value)){ // 유효할때
        $.ajax({
            url : "/emailDupCheck",
            data : {"memberEmail" : memberEmail.value}, 
            success : (result) => {
                if(result == 0) {// 중복 아닐떄
                    emailMessage.innerText="사용 가능한 이메일 입니다."
                    emailMessage.classList.remove("error")
                    emailMessage.classList.add("confirm")
                    checkObj.memberEmail = true;

                }else{// 중복 일떄
                    emailMessage.innerText="이미 사용중인 이메일 입니다."
                    emailMessage.classList.remove("confirm")
                    emailMessage.classList.add("error")
                    checkObj.memberEmail = false;
                }
            }, 
            error : () => { 
                console.log("이메일 ajax 중복검사 실패");
            },
            complete : () => {
                console.log("이메일 ajax 중복검사 완료");
            },
        });

    } else { //유효하지 않은 경우
        emailMessage.innerText = "이메일 형식이 유효하지 않습니다.";
        emailMessage.classList.remove("confirm");
        emailMessage.classList.add("error");
        checkObj.memberEmail = false;
    }
});



/*************************** 비밀번호/비밀번호 확인 유효성 검사 ***************************/
const memberPw = document.getElementById("memberPw");
const memberPwConfirm =document.getElementById("memberPwConfirm");
const pwMessage = document.getElementById("pwMessage");

// 비밀번호 유효성 검사
memberPw.addEventListener("input",()=>{

    // 비밀번호 미입력 시
    if(memberPw.value.trim().length == 0){
        pwMessage.innerText ="영문자/숫자/특수문자 포함 8~16글자 사이로 입력해주세요.";
        pwMessage.classList.remove("confirm","error");
        memberPw.value="";
        checkObj = false;
        return;
    }

    // 비밀번호 정규 표현식
    const regEx =/^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[`~!@$!%*#^?&\\(\\)\\-_=+])(?!.*[^a-zA-z0-9`~!@$!%*#^?&\\(\\)\\-_=+]).{8,16}$/;
    
    if(regEx.test(memberPw.value)){ // 정규표현식이 일치할경우
        checkObj.memberPw = true;

        // 비밀번호 확인 미 작성시
        if(memberPwConfirm.value.trim().length == 0){
            pwMessage.innerText="유효한 비밀번호 형식입니다";
            pwMessage.classList.remove("error");
            pwMessage.classList.add("confirm");

        } else { // 유효한 비밀번호 == 비밀번호 확인 동일한지 확인

            if(memberPw.value == memberPwConfirm.value){ // 동일한 경우
                pwMessage.innerText ="비밀번호가 일치합니다.";
                pwMessage.classList.remove("error");
                pwMessage.classList.add("confirm");
                checkObj.memberPwConfirm = true;

            } else { // 동일하지 않은 경우
                pwMessage.innerText = "비밀번호가 일치하지 않습니다.";
                pwMessage.classList.remove("confirm");
                pwMessage.classList.add("error");
                checkObj.memberPwConfirm = false;
            }
        }

    } else { // 정규표현식이 일치하지 않을 경우
        pwMessage.innerText="비밀번호 형식이 유효하지 않습니다.";
        pwMessage.classList.remove("confirm");
        pwMessage.classList.add("error");
        checkObj.memberPw = false;
    }
});

// 비밀번호 확인 유효성 검상
memberPwConfirm.addEventListener("input",()=>{

    // 정규표현식이 일치할경우
    if(checkObj.memberPw){

        if(memberPw.value == memberPwConfirm.value){ // 동일한 경우
            pwMessage.innerText="비밀번호가 일치합니다.";
            pwMessage.classList.remove("error");
            pwMessage.classList.add("confirm");
            checkObj.memberPwConfirm = true;

        } else { // 동일하지 않을 경우
            pwMessage.innerText="비밀번호가 일치하지 않습니다.";
            pwMessage.classList.remove("confirm");
            pwMessage.classList.add("error");
            checkObj.memberPwConfirm = false;
        }

    }else{ // 정규표현식이 일치하지 않을 경우
        checkObj.memberPwConfirm = false;
    }
})

/*************************** 닉네임 확인 유효성 검사 ***************************/
const memberNickname = document.getElementById("memberNickname");
const nickMessage = document.getElementById("nickMessage");

memberNickname.addEventListener("input",()=>{

    // 닉네임 미입력 시
    if(memberNickname.value.trim().length == 0){
        nickMessage.innerText="한글,영어,숫자로만 2~10글자 사이로 입력해주세요.";
        nickMessage.classList.remove("confirm","error");
        checkObj.memberNickname= false;
        return;
    }
    // 닉네임 정규 표현식
    const regEx =/^[가-힣\w]{2,10}$/;

    if(regEx.test(memberNickname.value)){ // 정규표현식 일치하는 경우

        // 닉네임 중복검사
        const dbNicknameCheck = {"memberNickname":memberNickname.value};

        $.ajax({
            url  : '/nicknameDupCheck',
            data : dbNicknameCheck,
            success : (result)=>{

                if(result == 0){ // 중복된 닉네임이 없다면
                    nickMessage.innerText="유효한 닉네임 형식 입니다.";
                    nickMessage.classList.remove("error");
                    nickMessage.classList.add("confirm");
                    checkObj.memberNickname=true;

                }else{ // 중복된 닉네임이 있다면
                    nickMessage.innerText="이미 사용중인 닉네임 입니다.";
                    nickMessage.classList.remove("confirm");
                    nickMessage.classList.add("error");
                    checkObj.memberNickname = false;
                }
            },
            error : ()=>{
                console.log("닉네임 ajax 중복검사 실패");
            },
            complete : ()=>{
                console.log("닉네임 ajax 중복검사 완료");
            }
        });

    } else { // 정규표현식 일치하지 않은 경우
        nickMessage.innerText="유효한 닉네임 형식이 아닙니다.";
        nickMessage.classList.remove("confirm");
        nickMessage.classList.add("error");
        checkObj.memberNickname= false;
    }
});
/*************************** 생년월일 유효성 검사 ***************************/
const memberBirth = document.getElementById("memberBirth");
const birthMessage = document.getElementById("birthMessage");

memberBirth.addEventListener("input",()=>{

    // 생년월일 미 입력시
    if(memberBirth.value.trim().length == 0){
        birthMessage.innerText="숫자로 생년월일 8자리를 입력해주세요.";
        birthMessage.classList.remove("confirm","error");
        checkObj.memberBirth = false;
        return;
    }

    //생년월일 정규표현식 검사
    const regEx =/^[\d]{8}$/;

    if(regEx.test(memberBirth.value)){ // 정규표현식이 일치한 경우
        birthMessage.innerText="유효한 생년월일 형식 입니니다.";
        birthMessage.classList.remove("error");
        birthMessage.classList.add("confirm");
        checkObj.memberBirth = true;
    } else { // 정규표현식이 일치 하지 않는 경우
        birthMessage.innerText="유효하지 않은 생년월일 형식 입니다.";
        birthMessage.classList.remove("confirm");
        birthMessage.classList.add("error");
        checkObj.memberBirth = false;
    }
});

/*************************** 전화번호 유효성 검사 ***************************/
const memberTel = document.getElementById("memberTel");
const temlMessage = document.getElementById("temlMessage");

memberTel.addEventListener("input",()=>{

    // 전화번호 미 입력시
    if(memberTel.value.trim().length == 0){
        temlMessage.innerText="전화번호를 입력해 주세요.(-제외)";
        temlMessage.classList.remove("confirm","error");
        checkObj.memberTel = false;
        return;
    } 

    // 전화번호 정규표현식
    const regEx = /^0(1[01679]|2|[3-6][1-5]|70)[1-9]\d{2,3}\d{4}$/;

    if(regEx.test(memberTel.value)){ // 정규표현식이 일치한 경우
        temlMessage.innerText="사용 가능한 전화번호 입니다.";
        temlMessage.classList.remove("error");
        temlMessage.classList.add("confirm")
        checkObj.memberTel = true;

    } else { // 정규표현식이 일치하지 않는 경우
        temlMessage.innerText="전화번호 형식이 유효하지 않습니다.";
        temlMessage.classList.remove("confirm");
        temlMessage.classList.add("error");
        checkObj.memberTel = false;
    }
})
