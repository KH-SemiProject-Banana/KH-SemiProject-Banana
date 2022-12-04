
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
const editBoard1 = document.getElementById("editBoard1");
if(editBoard1 != null) {
    editBoard1.addEventListener("click", (e) => {

        e.target.classList.add("cancelEdit");
        e.target.innerText = "글 작성 취소";

        if(e.target.classList.contains("cancelEdit")) {

            document.getElementsByClassName("alarm-or-question")[0].previousElementSibling.remove();
        }


        const questionContent = document.createElement("form");
        questionContent.classList.add("frequent-question__content");



        // 제목 영역
        const titleInput = document.createElement("input");
        titleInput.setAttribute("name", "boardTitle");
        titleInput.style.width = "100%";

        const titleArea = document.createElement("div");
        titleArea.classList.add("frequent-question__content");
        titleArea.append(titleInput);
        titleArea.style.width = "100%";

        const faCircleQuestion = document.createElement("i");
        faCircleQuestion.classList.add("fa-solid", "fa-circle-question");

        const titleA = document.createElement("a");
        titleA.classList.add("frequent-question__content-detail");
        titleA.append(faCircleQuestion, titleArea);
        // titleA.setAttribute("onclick", "this.nextElementSibling.style.display=(this.nextElementSibling.style.display=='none')?'block':'none'; ");


        // 내용 영역
        const bananaImg = document.createElement("img");
        bananaImg.setAttribute("src", "/resources/images/banana-logo.png");
        bananaImg.classList.add("admin-img");

        const profileImg = document.createElement("div");
        profileImg.classList.add("profile-img");
        profileImg.append(bananaImg);

        const nickname = document.createElement("p");
        nickname.classList.add("nickname");
        nickname.setAttribute("id", "admin-name");
        nickname.innerText = "바나나마켓_운영지원팀";

        const nameDate = document.createElement("div");
        nameDate.classList.add("name-date");
        nameDate.append(nickname);


        const profile = document.createElement("div");
        profile.classList.add("profile");
        profile.append(profileImg, nameDate);

        const contentInput = document.createElement("textarea");
        contentInput.setAttribute("name", "boardContent");
        contentInput.classList.add("user-content");

        const contentArea = document.createElement("div");
        contentArea.classList.add("question-content");
        contentArea.append(contentInput);

        const area = document.createElement("div");
        area.classList.add("area");
        area.style.display = "block";
        area.append(profile, contentArea);

        const button = document.createElement("button");
        button.innerText = "자주묻는질문 수정";


        questionContent.append(titleA, area, button);

        document.getElementsByClassName("alarm-or-question")[0].before(questionContent);




        button.addEventListener("click", () => {

            $.ajax({
                url : "/manager/editBoard1",
                data : {"memberNo" : loginMember.memberNo, "boardCode" : boardCode,
                    "boardTitle" : boardTitle,  "boardContent" : boardContent},
                type : "GET",
                success : (result) => {
                    if(result > 0) {
                        alert(result);
                        alert("자주묻는 질문 편집이 완료되었습니다");
                        // location.href = "/board/1";
                    } else {
                        alert("자주 묻는 질문 편집 실패");
                    }
                },
                error : () => {console.log("자주 묻는 질문 편집 중 에러 발생");}
            })
        })

        
    });
}