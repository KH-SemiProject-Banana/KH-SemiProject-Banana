




// 이미지 등록 버튼 클릭시
(() => {


    const browseBtn = document.getElementsByClassName("browse-btn")[0];
    let preview = document.getElementsByClassName("preview");

    let boardImg = document.getElementsByClassName("boardImg");

    let imageCount = 0;




    const imagePicCount = document.getElementsByClassName("img__pic-count")[0];

    // 있는 이미지만 보이게 하기
    // (() => {

    for (let i = 0; i < 5; i++) {
        if (preview[i].getAttribute("src") == "") {
            boardImg[i].remove();
        } else {

            imageCount++;
        }
    }

    imagePicCount.innerText = "(" + imageCount + "/5)";

    // })();

    browseBtn.addEventListener("click", () => {

        if (imageCount >= 5) {

            alert("최대 5개의 사진을 첨부할 수 있습니다.");
            return;

        } else {
            for (let i = 0; i < 5; i++) {

                if (preview[i].getAttribute("src") == "") {
                    const img = document.createElement("img");
                    img.classList.add("preview");

                    const label = document.createElement("label");
                    label.setAttribute("for", "img" + i);

                    label.append(img);

                    const input = document.createElement("input");
                    input.setAttribute("type", "file");
                    input.setAttribute("name", "images");
                    input.classList.add("inputImage");
                    input.setAttribute("id", "img" + i);
                    input.setAttribute("accept", "image/*");

                    const div = document.createElement("div");
                    div.classList.add("boardImg");
                    div.append(label, input);


                    document.getElementById("image-show").append(div);


                    (() => {
                        input.click();
                    })();

                    imageCount = 0;
                    for (let i = 0; i < 5; i++) {
                        if (preview[i].getAttribute("src") == "") {
                            boardImg[i].style.display = "none";
                        } else {

                            imageCount++;
                        }
                    }

                    imagePicCount.innerText = "(" + imageCount + "/5)";

                    return;
                }
            }

        }

    });


})();



// 이미지 삭제시 deleteImage(list)에 추가
const deleteImage = document.getElementsByClassName("delete-image");
const inputImage = document.getElementsByClassName("inputImage");

const deleteSet = new Set();

for (let i = 0; i < inputImage.length; i++) {



    inputImage[i].addEventListener("change", (e) => {

        if (e.target.files[0] != undefined) { // 선택된 파일이 있을 경우

            const reader = new FileReader(); // 파일을 읽는 객체
            reader.readAsDataURL(e.target.files[0]);
            // 지정된 input type=files의 파일 정보를 읽어와 URL 형태로 저장

            reader.onload = e => { // 파일을 다 읽어온 후

                // e.target == reader
                // e.target.result == 읽어온 파일 URL
                preview[i].setAttribute("src", e.target.result);

                // 미리보기가 추가됨 ==  파일이 추가되었다
                // == 삭제하면 안된다 == deleteSet에서 해당 순번을 제거
                deleteSet.delete(i);
            }
        } else { // 취소가 눌러진 경우

            preview[i].removeAttribute("src");
        }
    });


}







// 유효성 검사
const checkObj = {
    "questionTitle": false,
    "questionContent": false,
    "questionImage": false
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


