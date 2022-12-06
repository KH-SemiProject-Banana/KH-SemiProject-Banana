const checkObj = {
    "memberNewEmail" : false,
    "memberPw" : false,
    "memberName" : false
}
// 회원 가입 양식이 제출 되었을 때
const deleteMeber=event => {

    for(let key in checkObj){

        let str;

        if(!checkObj[key]){

            switch(key){
                case "memberNewEmail" : str = "이메일이 유효하지 않습니다.";   break;
                case "memberPw"       : str = "비밀번호가 유효하지 않습니다."; break;
                case "memberName"     : str = "이름이 유효하지 않습니다.";     break;
            }
            alert(str);
            document.getElementById(key).focus();
            // event.preventDefault(); // 제출 이벤트 제거
            return false; 
        }
    }
    if(!confirm("정말로 탈퇴 하시겠습니까?")){
        alert("탈퇴 취소");
        // event.preventDefault(); // 제출 이벤트 제거
        return false; 
    }
    return true;
}

/* 전역 변수 선언  */
const findPW =document.getElementById("findPW");
const findID =document.getElementById("findID");
const findMainBoxText =document.getElementById("findMainBoxText");
const btn_id =document.getElementById("btn_id");
const memberName =document.getElementById("memberName");
const memberPw =document.getElementById("memberPw");
const findForm =document.getElementById("findForm");



/**************************** 유효성검사 ****************************/
/* 이름 유효성 검사 */
if(memberName.value.trim().length == 0){
    checkObj.memberName = false;
}else{
    checkObj.memberName = true;
}

memberName.addEventListener("input",()=>{

    // 미입력시
    if(memberName.value.trim().length == 0){
        checkObj.memberName = false;
    }else{
        checkObj.memberName = true;
    }
});

/* 비밀번호 유효성 검사 */

if(memberPw.value.trim().length == 0){
    checkObj.memberPw = false;
}
const regEx =/^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[`~!@$!%*#^?&\\(\\)\\-_=+])(?!.*[^a-zA-z0-9`~!@$!%*#^?&\\(\\)\\-_=+]).{8,16}$/;

if(regEx.test(memberPw.value)){ // 정규표현식이 일치한 경우
    checkObj.memberPw = true;

}else{ //정규표현식 미일치하는 경우
    checkObj.memberPw = false;
}

memberPw.addEventListener("input",()=>{

    //미입력시
    if(memberPw.value.trim().length == 0){
        checkObj.memberPw = false;
        return;
    }
    const regEx =/^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[`~!@$!%*#^?&\\(\\)\\-_=+])(?!.*[^a-zA-z0-9`~!@$!%*#^?&\\(\\)\\-_=+]).{8,16}$/;

    if(regEx.test(memberPw.value)){ // 정규표현식이 일치한 경우
        checkObj.memberPw = true;

    }else{ //정규표현식 미일치하는 경우
        checkObj.memberPw = false;
    }
});

/* 이메일 유효성 검사  */
const newEmaiMessage =document.getElementById("newEmaiMessage");
const memberNewEmail =document.getElementById("memberNewEmail");

if(memberNewEmail.value.trim().length == 0){
    memberNewEmail.value="";
    checkObj.memberNewEmail=false;
}else{
    // 정규표현식
    const regEx = /^[A-Za-z\d\-\_]{4,}@[\w\-\_]+(\.\w+){1,3}$/;
    if(regEx.test(memberNewEmail.value)){ // 유효할때
        checkObj.memberNewEmail = true;

    } else { //유효하지 않은 경우
        checkObj.memberNewEmail = false;
    }
}

memberNewEmail.addEventListener("input",()=>{

    // 미입력시
    if(memberNewEmail.value.trim().length == 0){
        memberNewEmail.value="";
        checkObj.memberNewEmail=false;
        return;
    }

    // 정규표현식
    const regEx = /^[A-Za-z\d\-\_]{4,}@[\w\-\_]+(\.\w+){1,3}$/;
    if(regEx.test(memberNewEmail.value)){ // 유효할때
        checkObj.memberNewEmail = true;

    } else { //유효하지 않은 경우
        checkObj.memberNewEmail = false;
    }
});



