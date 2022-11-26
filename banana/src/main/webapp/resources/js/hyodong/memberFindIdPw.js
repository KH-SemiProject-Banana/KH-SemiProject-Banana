

/* pw/id 이동버튼 */
const findPW =document.getElementById("findPW");
const findID =document.getElementById("findID");
const findMainBoxText =document.getElementById("findMainBoxText");
const btn_id =document.getElementById("btn_id");
const memberName =document.getElementById("memberName");
const memberTel =document.getElementById("memberTel");
const memberNewEmail =document.getElementById("memberNewEmail");
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

/* 유효성검사 */

