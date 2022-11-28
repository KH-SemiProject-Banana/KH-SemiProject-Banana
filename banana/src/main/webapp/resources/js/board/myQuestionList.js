
// 문의하기
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