// 목록으로 버튼
(()=>{

    const goToListBtn = document.getElementById("goToListBtn");
    
    if(goToListBtn != null){
    
        goToListBtn.addEventListener("click", ()=>{

            const pathname = location.pathname; //   /board/1/1500
            const queryString = location.search; // ?cp=7

            const url = pathname.substring(0, pathname.lastIndexOf("/")) + queryString; // /board/1?cp=7


            location.href= url;
        });
    }

})();



(() =>{

    const myQuestionList = document.getElementById("myQuesionList");
    
    if(myQuestionList != null){
    
        myQuestionList.addEventListener("click", () => {
        
            if(loginMember.length == 0){
                alert("로그인 후 이용해주세요");
                return;
            } else {
                alert("로그인상태");
            }
        });
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


// 수정하기
const updateBtn = document.getElementById("updateBtn");

if(updateBtn != null) {

    updateBtn.addEventListener("click", () =>{
    
        // 상세조회 : /board/{boardCode}/{boardNo}/update/?cp=10
    
        location.href = location.pathname + "/update" + location.search;
    
    });
}





// 삭제하기
const deleteBtn = document.getElementById("deleteBtn");

if(deleteBtn != null) {

    deleteBtn.addEventListener("click", () =>{
    
        if(confirm("정말 삭제하시겠습니까?")){
    
            location.href = location.pathname + "/delete";
        }
    });
}
