const checkObj = {
    "memberEmail"   : false,
    "memberPw"      : false,
    "memberPwConfirm" : false,
    "memberNickname" : false,
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
                case "memberTel"                : str = "전화번호가 유효하지 않습니다.";      break;
                case "memberEmailCertification" : str = "인증이 완료되지 않았습니다.";        break;
            }

            alert(str); // 대화상자 출력
            
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
        emailMessage.innerText="메일을 받을 수 있는 이메일을 입력해주세요.";
        memberEmail.value="";

        emailMessage.classList.remove("confirm","error");emailMessage

        // 유효성 검사 확인 객체에 현재 상태 저장
        checkObj.memberEmail = false;
        return;
    }

    // 정규표현식
    const regEx = /^[A-Za-z\d\-\_]{4,}@[\w\-\_]+(\.\w+){1,3}$/;
    
    if(regEx.test(memberEmail.value)){ // 유효할때
        $.ajax({

            url : "/emailDupCheck", 
            data : {"memberEmail" : memberEmail.value}, 
            type : "GET", 
            success : (result) => {

                if(result == 0) {// 중복 아님
                    emailMessage.innerText="사용 가능한 이메일 입니다."
                    emailMessage.classList.remove("error")
                    emailMessage.classList.add("confirm")

                    checkObj.memberEmail = true;

                }else{// 중복 임
                    emailMessage.innerText="이미 사용중인 이메일 입니다."
                    emailMessage.classList.remove("confirm")
                    emailMessage.classList.add("error")

                    checkObj.memberEmail = false;
                }
            }, 
            error : () => { //비동기 통신이 실패했을 때, 수행한다.
                console.log("ajax 통신 실패");
            },
            complete : () => { // success, error 수행여부 관계없이 무조건 수행
                console.log("중복 검사 수행 완료");
            },

        });

    } else { //유효하지 않은 경우

        emailMessage.innerText = "이메일 형식이 유효하지 않습니다.";
        emailMessage.classList.remove("confirm");
        emailMessage.classList.add("error");

        // 유효성 검사 확인 객체에 현재 상태 저장
        checkObj.memberEmail = false;

    }


});

