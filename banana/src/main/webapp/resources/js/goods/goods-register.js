// 첨부파일 추가

// const realUpload = document.querySelector('.real-upload');
// const upload = document.querySelector('.upload');

// upload.addEventListener('click', () => realUpload.click());

const checkObj = {
    "goodsImage": false,
    "goodsTitle": false,
    "goodsCategory": false,
    "goodsContent": false,
    "goodsPrice": false
};




function loadFile(input) {


    const files = input.files;


    for (let file of files) {
        const temp = document.querySelectorAll("#image-show > img");

        if (temp.length == 5) {
            alert("최대 5개의 파일을 등록할 수 있습니다");
            return false;
        }

        var newImage = document.createElement("img");
        newImage.classList.add("img");
        newImage.src = URL.createObjectURL(file);

        var container = document.getElementById('image-show');
        container.appendChild(newImage);


        // 이미지 삭제 구현
        newImage.addEventListener("click", (e) => {

            container.removeChild(e.target);
            deleteFile(e.target);
        });


        const count = container.childElementCount;
        document.getElementsByClassName("img__pic-count")[0].innerText = "(" + count + "/5)";

    }

    // 이미지 선택 완료시
    // 기존 input태그의 id속성을 바꾸고, 새 input태그를 만들어 id속성값을 기존걸로 바꿔서
    // label태그와 연결되게 한다



    const inputClone = document.createElement("input");
    inputClone.setAttribute("type", "file");
    inputClone.setAttribute("id", "chooseFile");
    inputClone.classList.add("chooseFile");
    inputClone.setAttribute("name", "inputImage");
    inputClone.setAttribute("accept", "image/*");
    inputClone.setAttribute("onchange", "return loadFile(this)");
    inputClone.setAttribute("multiple", "true");
    inputClone.style.visibility="hidden";
    document.getElementById("chooseFile").after(inputClone);

    document.getElementById("chooseFile").removeAttribute("id");






    list = document.getElementsByClassName("img");
    console.log(list.length);
    if (list.length > 0) {
        checkObj.goodsImage = true;
    } else {
        checkObj.goodsImage = false;
    }

    return true;

};



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
        let fileCount = document.getElementById("chooseFile"); // label

        let files = fileCount.files; // 사용자가 입력한 파일을 변수에 할당

        let fileArray = Array.from(files); // 배열로 변환
        console.log(fileNum);
        console.log(fileArray);
        fileArray.splice(fileNum, 1);

        fileArray.forEach(file => { dataTransfer.items.add(file) });
        console.log(dataTransfer.files);
        fileCount.files = dataTransfer.files;
    }
}










document.getElementById("register__form").addEventListener("submit", e => {

    // 카테고리 유효성검사
    if (document.getElementById("goodsCategory").value == "") {
        checkObj.goodsCategory = false;

    } else {
        checkObj.goodsCategory = true;
    }


    for (let key in checkObj) {

        let str;

        if (!checkObj[key]) {
            switch (key) {

                case "goodsImage": str = "이미지를 등록해주세요"; break;
                case "goodsTitle": str = "상품 제목을 입력해주세요"; break;
                case "goodsCategory": str = "카테고리를 설정해주세요"; break;
                case "goodsContent": str = "상품 설명을 입력해주세요"; break;
                case "goodsPrice": str = "상품 가격을 입력해주세요"; break;
            }
            alert(str);

            e.preventDefault();
            return;
        }

    }
});




// 상품 이미지 유효성검사
const chooseFile = document.getElementById("chooseFile");
chooseFile.addEventListener("change", () => {

    if (chooseFile.value == '') {

        goodsImage = false;

    } else {
        goodsImage = true;
    }



});


// 상품제목 유효성검사
const goodsTitle = document.getElementById("goodsTitle");
goodsTitle.addEventListener("input", function () {
    const titleMessage = document.getElementById("titleMessage");

    if (goodsTitle.value.trim().length == 0) {
        titleMessage.innerText = "공백문자는 입력할 수 없습니다";
        goodsTitle.value = "";
        titleMessage.classList.remove("confirm");
        titleMessage.classList.add("error");

        checkObj.goodsTitle = false;
        return;
    }
    else { // 유효한 경우
        titleMessage.innerText = "유효한 형식입니다";
        titleMessage.classList.remove("error");
        titleMessage.classList.add("confirm");

        checkObj.goodsTitle = true;

    }
});


// 상품설명 유효성검사
const goodsContent = document.getElementById("goodsContent");
goodsContent.addEventListener("input", function () {
    const contentMessage = document.getElementById("contentMessage");

    if (goodsContent.value.trim().length == 0) {
        contentMessage.innerText = "공백문자는 입력할 수 없습니다";
        goodsContent.value = "";
        contentMessage.classList.remove("confirm");
        contentMessage.classList.add("error");

        checkObj.goodsContent = false;
        return;
    }
    else { // 유효한 경우
        contentMessage.innerText = "유효한 형식입니다";
        contentMessage.classList.remove("error");
        contentMessage.classList.add("confirm");

        checkObj.goodsContent = true;

    }
});


// 판매금액 유효성 검사
const goodsPrice = document.getElementById("goodsPrice");
goodsPrice.addEventListener("input", function (e) {
    const priceMessage = document.getElementById("priceMessage");

    if (goodsPrice.value.trim().length == 0) {
        priceMessage.innerText = "숫자만 입력해주세요";
        goodsPrice.value = "";
        priceMessage.classList.remove("error", "confirm");

        checkObj.goodsPrice = false;
        return;
    }

    const regEx = /^[0-9]{1,9}$/;

    let value = e.target.value;
    // value = Number(value.replaceAll(',', ''));
    // const formatValue = value.toLocaleString('ko-KR');
    // goodsPrice.value = formatValue;

    // if(regEx.test(goodsPrice.value.replaceAll(',', ''))){ // 유효한 경우
    if (regEx.test(goodsPrice.value)) { // 유효한 경우
        priceMessage.innerText = "유효한 형식입니다(숫자)";
        priceMessage.classList.remove("error");
        priceMessage.classList.add("confirm");

        checkObj.goodsPrice = true;


    } else {

        if (goodsPrice.value.length > 12) {
            priceMessage.innerText = "입력한 금액이 너무 큽니다";
            priceMessage.classList.add("error");
            priceMessage.classList.remove("confirm");

            checkObj.goodsPrice = false;
            return;

        } else {

            goodsPrice.value = "";
            priceMessage.innerText = "숫자만 입력해주세요";
            priceMessage.classList.add("error");
            priceMessage.classList.remove("confirm");

            checkObj.goodsPrice = false;
            return;
        }

    }
});








