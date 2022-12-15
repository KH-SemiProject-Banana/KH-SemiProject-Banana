// 유효성 검사

const checkObj = {
    "questionTitle": false,
    "questionContent": false,
    "questionImage": false
};


const handler = {

    init() {
        const chooseFile = document.getElementById("chooseFile");
        const imageShow = document.getElementById("image-show");

        chooseFile.addEventListener("change", () => {
            const files = Array.from(chooseFile.files);
            const imgList = document.getElementsByClassName("img");

            if(imgList.length >= 5){
                alert("최대 5개의 이미지를 등록할 수 있습니다");
                return;
            }

            files.forEach(file => {

                
                if(imgList.length > 5){
                    alert("최대 5개의 이미지를 등록할 수 있습니다");
                    return;
                }
                

                imageShow.innerHTML +=
                `<p id="${file.lastModified}" class="imgArea">
                    <img class="img">
                    <button data-index='${file.lastModified}' class='file-remove'>X</button>
                </p>`;

                imgList[imgList.length -1].src = URL.createObjectURL(file);
                console.log(URL.createObjectURL(file));

                if (document.getElementsByClassName("img").length > 0) {
                    checkObj.questionImage = true;
                } else {
                    checkObj.questionImage = false;
                }
    
                const container = document.getElementById('image-show');
                const count = container.childElementCount;
                document.getElementsByClassName("img__pic-count")[0].innerText = "(" + count + "/5)";
            });

        });

    },

    removeFile: () => {
        document.addEventListener("click", e => {
            const removeTargetId = e.target.dataset.index;
            console.log(removeTargetId); 


            const removeTarget = document.getElementById(removeTargetId);
            const files = document.getElementById("chooseFile").files;
            const dataTransfer = new DataTransfer();

            Array.from(files)
                .filter(file => file.lastModified != removeTargetId)
                .forEach(file => { dataTransfer.items.add(file) });

            document.getElementById("chooseFile").files = dataTransfer.files;
            console.log(removeTarget);
            removeTarget.remove();



            if (document.getElementsByClassName("img").length > 0) {
                checkObj.questionImage = true;
            } else {
                checkObj.questionImage = false;
            }

            const container = document.getElementById('image-show');
            const count = container.childElementCount;
            document.getElementsByClassName("img__pic-count")[0].innerText = "(" + count + "/5)";

        })
    }
}

handler.init();
handler.removeFile();



// function loadFile(input) {
//     // let fileCount = document.getElementById("chooseFile");

//     const files = input.files;



//     for (let file of files) {


//         const temp = document.querySelectorAll("#image-show > img");

//         if (temp.length == 5) {
//             alert("최대 5개의 파일을 등록할 수 있습니다");
//             return false;
//         }


//         var newImage = document.createElement("img");
//         // var newImage = document.createElement("input");
//         newImage.setAttribute("class", 'img');
//         // newImage.setAttribute("type", 'file');


//         newImage.src = URL.createObjectURL(file);



//         var container = document.getElementById('image-show');

//         // var del = document.createTextNode('삭제');



//         container.appendChild(newImage);

//         // 이미지 삭제
//         newImage.addEventListener("click", (e) => {

//             container.removeChild(e.target);
//             deleteFile(e.target);

//         })


//         const count = container.childElementCount;
//         document.getElementsByClassName("img__pic-count")[0].innerText = "(" + count + "/5)";



//     }

//     list = document.getElementsByClassName("img");
//     console.log(list.length);
//     if (list.length > 0) {
//         checkObj.questionImage = true;
//     } else {
//         checkObj.questionImage = false;
//     }

//     return true;

// };



function deleteFile(img) {

    let fileNum = -1;
    for (let i = 0; i < list.length; i++) {
        if (list[i] == img) {
            fileNum = i;
            break;
        }
    }

    if (fileNum > -1) {
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



// 전체보기
const questionList = document.getElementById("questionList");



    questionList.addEventListener("click", () => {

        if (confirm("현재 문의글을 작성중입니다. 현재 페이지를 벗어나시겠습니까?")) {
            location.href = "/board/3";
        } else {
            return;
        }
    });







// 나의 문의/안내 내역
const myQuestionList = document.getElementById("myQuestionList");


    myQuestionList.addEventListener("click", () => {

        if (confirm("현재 문의글을 작성중입니다. 현재 페이지를 벗어나시겠습니까?")) {
                location.href = "/question/myQuestion";

        } else {
            return;
        }
    });




