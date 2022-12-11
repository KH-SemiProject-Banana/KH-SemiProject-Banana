
const checkObj = {
    "goodsImage": false,
    "goodsTitle": false,
    "goodsCategory": false,
    "goodsContent": false,
    "goodsPrice": false
};



const handler = {

    init() {
        const chooseFile = document.getElementById("chooseFile");
        const imageShow = document.getElementById("image-show");

        chooseFile.addEventListener("change", () => {
            const files = Array.from(chooseFile.files);
            const imgList = document.getElementsByClassName("img");

            files.forEach(file => {

                if(imgList != null){
                    if(imgList.length >= 5){
                        alert("최대 5개의 이미지를 등록할 수 있습니다");
                        return;
                    }
                }

                imageShow.innerHTML +=
                `<p id="${file.lastModified}" class="imgArea">
                    <img class="img">
                    <button data-index='${file.lastModified}' class='file-remove'>X</button>
                </p>`;

                imgList[imgList.length -1].src = URL.createObjectURL(file);
                console.log(URL.createObjectURL(file));

                if (document.getElementsByClassName("img").length > 0) {
                    checkObj.goodsImage = true;
                } else {
                    checkObj.goodsImage = false;
                }
    
                const container = document.getElementById('image-show');
                const count = container.childElementCount;
                document.getElementsByClassName("img__pic-count")[0].innerText = "(" + count + "/5)";
            });

        });

    },

    removeFile: () => {
        document.addEventListener("click", e => {
            const removeTargetId = e.target.dataset.index; // x버튼의 데이터값
            console.log(removeTargetId); 


            const removeTarget = document.getElementById(removeTargetId); // x버튼들 클래스 모음
            const files = document.getElementById("chooseFile").files; // input태그의 파일들
            const dataTransfer = new DataTransfer();

            Array.from(files)
                .filter(file => file.lastModified != removeTargetId) // x버튼을 눌렀을때
                .forEach(file => { dataTransfer.items.add(file) });

            document.getElementById("chooseFile").files = dataTransfer.files;
            console.log(removeTarget);
            removeTarget.remove();



            if (document.getElementsByClassName("img").length > 0) {
                checkObj.goodsImage = true;
            } else {
                checkObj.goodsImage = false;
            }

            const container = document.getElementById('image-show');
            const count = container.childElementCount;
            document.getElementsByClassName("img__pic-count")[0].innerText = "(" + count + "/5)";

        })
    }
}

handler.init();
handler.removeFile();







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








