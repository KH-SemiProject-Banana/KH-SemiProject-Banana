// 유효성 검사

const checkObj = {
    "questionTitle": false,
    "questionContent": false,
    "questionImage": false
};



function loadFile(input) {
    let fileCount = document.getElementById("chooseFile");

    const files = input.files;

    
    

   

    // console.log(files);
    
    // console.log(temp);

    let i = 0;
    for (let file of files) {

        
        
        

        const temp = document.querySelectorAll("#image-show > img");

        if (temp.length == 5) {
            alert("최대 5개의 파일을 등록할 수 있습니다");
            return false;
        }


        var newImage = document.createElement("img");
        // var newImage = document.createElement("input");
        newImage.setAttribute("class", 'img');
        // newImage.setAttribute("type", 'file');


        newImage.src = URL.createObjectURL(file);



        var container = document.getElementById('image-show');

        // var del = document.createTextNode('삭제');



        container.appendChild(newImage);

        newImage.addEventListener("click", (e) => {

            container.removeChild(e.target);
            deleteFile(e.target);

        })


        const count = container.childElementCount;
        document.getElementsByClassName("img__pic-count")[0].innerText = "(" + count + "/5)";

        
        i++;
    }

    const list = document.getElementsByClassName("img");
    console.log(list.length);
    if (list.length > 0) {
        checkObj.questionImage = true;
    } else {
        checkObj.questionImage = false;
    }

    return true;

};



function deleteFile(img)  {
    
    let fileNum = -1;
    for(let i = 0 ; i<list.length ; i++){
        if(list[i] == img){
            fileNum = i;
            break;
        }
    }

    if(fileNum > -1){
        const dataTransfer = new DataTransfer();
        let fileCount = document.getElementById("chooseFile");
        
        let files = fileCount.files;	//사용자가 입력한 파일을 변수에 할당

        let fileArray = Array.from(files);
        console.log(fileNum);
        console.log(fileArray);
        fileArray.splice(fileNum, 1);

        fileArray.forEach(file => { dataTransfer.items.add(file); });
        console.log(dataTransfer.files)
        fileCount.files = dataTransfer.files;
    }
}









// 글제목 유효성검사
const questionTitle = document.getElementById("question-title");
questionTitle.addEventListener("input", function () {
    const titleMessage = document.getElementById("titleMessage");

    if (questionTitle.value.trim().length == 0) {
        titleMessage.innerText = "공백문자는 입력할 수 없습니다";
        questionTitle.value = "";
        titleMessage.classList.remove("confirm");
        titleMessage.classList.add("error");

        checkObj.questionTitle = false;
        return;
    }
    else { // 유효한 경우
        titleMessage.innerText = "유효한 형식입니다";
        titleMessage.classList.remove("error");
        titleMessage.classList.add("confirm");

        checkObj.questionTitle = true;

    }
});


// 상품설명 유효성검사
const questionContent = document.getElementById("question-content");
questionContent.addEventListener("input", function () {
    const contentMessage = document.getElementById("contentMessage");

    if (questionContent.value.trim().length == 0) {
        contentMessage.innerText = "공백문자는 입력할 수 없습니다";
        questionContent.value = "";
        contentMessage.classList.remove("confirm");
        contentMessage.classList.add("error");

        checkObj.questionContent = false;
        return;
    }
    else { // 유효한 경우
        contentMessage.innerText = "유효한 형식입니다";
        contentMessage.classList.remove("error");
        contentMessage.classList.add("confirm");

        checkObj.questionContent = true;

    }
});


document.getElementById("question-form").addEventListener("submit", e=>{

    
    
        for (let key in checkObj) {
    
            let str;
    
            if (!checkObj[key]) {
                switch (key) {
                    case "questionImage": str = "이미지를 최소 1개 등록해주세요"; break;
                    case "questionTitle": str = "글 제목을 입력해주세요"; break;
                    case "questionContent": str = "글 내용을 입력해주세요"; break;
                }
                alert(str);
                
                e.preventDefault();
                return;
            }
        }
    

});



// 전체보기
(() => {

    const questionList = document.getElementById("questionList");

    if(questionList != null){

        if(confirm("현재 문의글을 작성중입니다. 현재 페이지를 벗어나시겠습니까?")){
    
            questionList.addEventListener("click", () =>{
                location.href = "/board/3";
            });

        } else {
            return;
        }
    
    } 

})();


// 나의 문의/안내 내역
(() => {


    const myQuestionList = document.getElementById("myQuestionList");
    if(myQuestionList != null){

        myQuestionList.addEventListener("click", () =>{

            if(confirm("현재 문의글을 작성중입니다. 현재 페이지를 벗어나시겠습니까?")){

                if(loginMember != ""){
                    
                    location.href = "/question/myQuestion";
                } else {
                    alert("로그인 후 이용해주세요");
                    return;
                }

            } else {
                return;
            }
        });
    
    } 
})();