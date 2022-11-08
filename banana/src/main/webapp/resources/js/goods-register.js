// 첨부파일 추가

// const realUpload = document.querySelector('.real-upload');
// const upload = document.querySelector('.upload');

// upload.addEventListener('click', () => realUpload.click());




function loadFile(input) {


    var files = input.files;	

    console.log(files);


    for(let file of files){
        const temp = document.querySelectorAll("#image-show > img");

        if( temp.length == 10){
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
        newImage.addEventListener("click", deleteImg);

        var container = document.getElementById('image-show');
        
        // var del = document.createTextNode('삭제');


        container.appendChild(newImage);


        const count = container.childElementCount;
        document.getElementsByClassName("img__pic-count")[0].innerText = "("+count+"/10)";
        
    }
    return true;
};




const goodsPrice = document.getElementById("goods-price");
goodsPrice.addEventListener("input", function(){
    const priceMessage = document.getElementById("priceMessage");

    if(goodsPrice.value.trim().length == 0){
        priceMessage.innerText = "숫자만 입력해주세요";
        goodsPrice.value = "";
        priceMessage.classList.remove("error");
    }

    if()
});

