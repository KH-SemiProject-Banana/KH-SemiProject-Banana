const checkObj = {
    "goodsImage": false,
    "goodsTitle": false,
    "goodsCategory": false,
    "goodsContent": false,
    "goodsPrice": false
};



// 이미지 미리보기
const inputImage = document.getElementsByClassName("inputImage"); // input
const preview = document.getElementsByClassName("preview"); // img태그
const deleteImage = document.getElementsByClassName("delete-image");

const deleteSet = new Set();


(()=>{

    document.getElementById("goodsCategory").children[3].setAttribute("selected", true);



    
    for(let i = 0; i < 5; i++) {
    
        inputImage[i].addEventListener("change", (e) => { // 이미지 삽입하겠다고 클릭
    
            if(e.target.files[0] != undefined) {
    
                const reader = new FileReader();
                reader.readAsDataURL(e.target.files[0]);
    
                reader.onload = e => {
    
                    preview[i].setAttribute("src", e.target.result);
                    deleteSet.delete(i);
                }
    
                const xButton = document.createElement("span");
                xButton.innerHTML = "&times;";
                xButton.classList.add("delete-image");
                inputImage[i].after(xButton);


                // xButton에 삭제기능 추가
                xButton.addEventListener("click", (e) => {
        
                    if(preview[i].getAttribute("src") != "/resources/images/image-upload.png") { // 기본이미지가 아닐 경우
            
                        e.target.remove();

                        preview[i].setAttribute("src", "/resources/images/image-upload.png");
                        inputImage[i].value = "";
            
                        e.target.delete;
            
                        deleteSet.add(i);

                    }
                });

                
    
    
            } else { // 취소
                return; // 아무일도 일어나지 않음
            }


            imageCount = deleteImage.length; // 전역변수
            document.getElementsByClassName("img__pic-count")[0].innerText = "(" + imageCount + "/5)";

        });
    
        
    }
    
    imageCount = deleteImage.length; // 전역변수
    document.getElementsByClassName("img__pic-count")[0].innerText = "(" + imageCount + "/5)";
    
})();



function loadFile(input) {


    var files = input.files;

    console.log(files);


    for (let file of files) {
        const temp = document.querySelectorAll("#image-show > img");

        if (temp.length == 10) {
            alert("최대 10개의 파일을 등록할 수 있습니다");
            return false;
        }


        var newImage = document.createElement("img");
        newImage.setAttribute("class", 'img');


        newImage.src = URL.createObjectURL(file);

        newImage.style.width = "140px";
        newImage.style.height = "140px";
        newImage.style.padding = "0";
        newImage.style.margin = "10px";
        newImage.style.border = "1px solid rgba(0,0,0,0.1)";
        newImage.style.borderRadius = "8px";
        newImage.style.objectFit = "contain";

        //--------------------------------------
        
        // 이미지 삭제 구현
        newImage.addEventListener("click", (e)=>{
           e.target.remove();

           console.log(files.indexOf(file));
           return;
        });


        //--------------------------------------

        var container = document.getElementById('image-show');

        // var del = document.createTextNode('삭제');


        container.appendChild(newImage);


        const count = container.childElementCount;
        document.getElementsByClassName("img__pic-count")[0].innerText = "(" + count + "/5)";

    }
    return true;
};








// form태그 제출시 유효성검사 후 실행
document.getElementById("register__form").addEventListener("submit", e => {


    // dk

    // 카테고리 유효성검사
    if (document.getElementById("goodsCategory").value == "") {
        checkObj.goodsCategory = false;
    } else {
        checkObj.goodsCategory = true;
    }

    // 상품 이미지 유효성검사(deleteSet == 5이면 이미지 없음->false)
    if(deleteSet.size == 5) {checkObj.goodsImage = false}
    else {checkObj.goodsImage = true}

    // 상품 제목 유효성 검사
    if(goodsTitle.value.trim().length == 0) {checkObj.goodsTitle = false}
    else {checkObj.goodsTitle = true}

    // 상품 설명 유효성 검사
    if(goodsContent.value.trim().length == 0) {checkObj.goodsContent = false}
    else {checkObj.goodsContent = true}

    // 상품 가격 유효성 검사
    if(goodsContent.value.trim().length == 0) {checkObj.goodsContent = false}
    else {checkObj.goodsContent = true}


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








