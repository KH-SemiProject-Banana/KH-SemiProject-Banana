

// 이미지 미리보기
const inputImage = document.getElementsByClassName("inputImage");
const preview = document.getElementsByClassName("preview");
const deleteImage = document.getElementsByClassName("delete-image");

const deleteSet = new Set();

for(let i = 0; i < inputImage.length; i++) {

    inputImage[i].addEventListener("change", (e) => {

        if(e.target.files[0] != undefined) {

            const reader = new FileReader();
            reader.readAsDataURL(e.target.files[0]);

            reader.onload = e => {

                preview[i].setAttribute("src", e.target.result);

                deleteSet.delete(i);
            }
        } else {
            preview[i].removeAttribute("src");
        }
    });


    // 삭제 버튼
    deleteImage[i].addEventListener("click", (e) => {

        if(preview[i].getAttribute("src") != "/resources/images/image-upload.png") {
            preview[i].setAttribute("src", "/resources/images/image-upload.png");
            inputImage[i].value = "";

            e.target.delete;

            deleteSet.add(i);
        }
    });
}







// 유효성 검사
const checkObj = {
    "questionTitle": false,
    "questionContent": false,
};

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


document.getElementById("question-form").addEventListener("submit", e => {



    if(questionTitle.value.trim().length != 0) {
        checkObj.questionTitle = true;
    }
    if(questionContent.value.trim().length != 0) {
        checkObj.questionContent = true;
    }



    for (let key in checkObj) {

        let str;

        if (!checkObj[key]) {
            switch (key) {
                case "questionTitle": str = "글 제목을 입력해주세요"; break;
                case "questionContent": str = "글 내용을 입력해주세요"; break;
            }
            alert(str);

            e.preventDefault();
            return;
        }
    }

    document.getElementById("deleteList").value = Array.from(deleteSet);
    console.log(deleteSet);




});