(() =>{

    const myQuestionList = document.getElementById("myQuesionList");
    
    if(myQuestionList != null){
    
        myQuestionList.addEventListener("click", e => {
        
            if(loginMember.length == 0){
                alert("로그인 후 이용해주세요");
                return;
            } else {
                alert("로그인상태");
            }
        });
    }
})();

