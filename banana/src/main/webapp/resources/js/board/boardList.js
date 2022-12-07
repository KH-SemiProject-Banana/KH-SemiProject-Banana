
// 글쓰기 버튼

(() => {

    const insertBtn = document.getElementById("insertBtn");

    if (insertBtn != null) {


        (insertBtn.addEventListener("click", e => {

            if (loginMember != '') {

                

                location.href = "/write/" + boardCode;

            } else {

                alert("로그인 후 이용해주세요");
            }
        }));

    }



})();


// 전체보기
(() => {

    const questionList = document.getElementById("questionList");
    if(questionList != null){

        questionList.addEventListener("click", () =>{
            location.href = "/board/3";
        });
    }
})();


// 나의 문의/안내 내역
(() => {

    const myQuestionList = document.getElementById("myQuestionList");
    if(myQuestionList != null){

        myQuestionList.addEventListener("click", () =>{

            if(loginMember != ""){
                
                location.href = "/question/myQuestion";
            } else {
                alert("로그인 후 이용해주세요");
                return;
            }
        });
    }
})();



// board1 - 모두 접기
const foldAll = document.getElementById("foldAll");
if(foldAll != null){
    foldAll.addEventListener("click", ()=>{
    
        const area = document.getElementsByClassName("area");
        for(let content of area){
            content.style.display = "none";
        }
    });

}



// 관리자: 글 편집하기
// const writeBtn = document.getElementById("writeBtn");
// if(writeBtn != null) {
//     writeBtn.addEventListener("click", (e) => {

//         // 글 작성하기
//         if(e.target.innerHTML == '글 작성하기'){
            

//             e.target.innerHTML = '글&nbsp;작성&nbsp;취소';
//             document.getElementById("writeBoard1").style.display = "block";

//             const boardTitle = document.getElementById("inputTitle");
//             const boardContent = document.getElementById("inputContent");


//             document.getElementById("finishWrite").addEventListener("click", () => {
    
    
//                 $.ajax({
//                     url : "/manager/editBoard1",
//                     data : {"memberNo" : loginMember.memberNo, "boardCode" : boardCode,
//                         "boardTitle" : boardTitle,  "boardContent" : boardContent},
//                     type : "get",
//                     success : (result) => {
//                         if(result > 0) {
//                             alert(result);
//                             alert("자주묻는 질문 편집이 완료되었습니다");
//                             // location.href = "/board/1";
//                         } else {
//                             alert("자주 묻는 질문 편집 실패");
//                         }
//                     },
//                     error : () => {console.log("자주 묻는 질문 편집 중 에러 발생");}
//                 })
//             })
//         }
       

//         // 글 작성 취소
//         if(writeBtn.innerHTML == '글 작성 취소'){
    
//             e.target.innerHTML = '글 작성하기';
//             e.target.classList.remove("cancelWrite");
//             document.getElementById("writeBoard1").style.display = "none";
            
//         }



        
//     });

    
// }