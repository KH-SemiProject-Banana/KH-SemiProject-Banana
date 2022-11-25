// 목록으로 버튼
(()=>{

    const goToListBtn = document.getElementById("goToListBtn");
    
    if(goToListBtn != null){
    
        goToListBtn.addEventListener("click", ()=>{
        
            location.href= document.referrer;
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


// 게시글 수정
