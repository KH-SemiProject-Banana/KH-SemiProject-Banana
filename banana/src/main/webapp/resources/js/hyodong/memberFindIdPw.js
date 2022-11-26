const checkObj = {
    "memberNewEmail" : false
}
// 회원 가입 양식이 제출 되었을 때
document.getElementById("findForm").addEventListener("submit",function(event){

    for(let key in checkObj){

        let str;

        if(!checkObj[key]){

            switch(key){
                case "memberNewEmail" : str = "이메일이 유효하지 않습니다."; break;
            }
            alert(str);
            document.getElementById(key).focus();
            event.preventDefault(); // 제출 이벤트 제거
            return; 
        }
    }
})

/* 유효성검사 */
const newEmaiMessage =document.getElementById("newEmaiMessage");
const memberNewEmail =document.getElementById("memberNewEmail");


memberNewEmail.addEventListener("input",()=>{

    // 미입력시
    if(memberNewEmail.value.trim().length == 0){
        newEmaiMessage.innerText="메일을 받을 수 있는 새 메일을 정확하게 입력해주세요.";
        newEmaiMessage.classList.remove("confirm","error");
        memberNewEmail.value="";
        checkObj.memberNewEmail=false;
        return;
    }

    // 정규표현식
    const regEx = /^[A-Za-z\d\-\_]{4,}@[\w\-\_]+(\.\w+){1,3}$/;
    if(regEx.test(memberNewEmail.value)){ // 유효할때

        newEmaiMessage.innerText="이메일 형식이 유효 합니다."
        newEmaiMessage.classList.remove("error")
        newEmaiMessage.classList.add("confirm")
        checkObj.memberNewEmail = true;

    } else { //유효하지 않은 경우
        newEmaiMessage.innerText = "이메일 형식이 유효하지 않습니다.";
        newEmaiMessage.classList.remove("confirm");
        newEmaiMessage.classList.add("error");
        checkObj.memberNewEmail = false;
    }

});


/* pw/id 이동버튼 */
const findPW =document.getElementById("findPW");
const findID =document.getElementById("findID");
const findMainBoxText =document.getElementById("findMainBoxText");
const btn_id =document.getElementById("btn_id");
const memberName =document.getElementById("memberName");
const memberTel =document.getElementById("memberTel");
const findForm =document.getElementById("findForm");

//아이디 화면 -> 비밀번호 화면
findPW.addEventListener("click",()=>{
    
    findMainBoxText.innerText="비밀번호 찾기"
    btn_id.innerText="비밀번호 찾기"
    findID.classList.remove("activate");
    findPW.classList.add("activate");
    memberName.value=""
    memberTel.value=""
    memberNewEmail.value=""

    // 폼태그 속성 변경
    findForm.setAttribute("action","/member/findPw");

});

//비밀번호 화면 -> 아이디 화면
findID.addEventListener("click",()=>{

    findMainBoxText.innerText="아이디 찾기"
    btn_id.innerText="아이디 찾기"
    findPW.classList.remove("activate");
    findID.classList.add("activate");
    memberName.value=""
    memberTel.value=""
    memberNewEmail.value=""

     // 폼태그 속성 변경
    findForm.setAttribute("action","/member/findId");
});



