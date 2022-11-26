const browseBtn = document.getElementsByClassName("browse-btn")[0];

let preview = document.getElementsByClassName("preview");
let boardImg = document.getElementsByClassName("boardImg");

let imageCount = 0;




const imagePicCount = document.getElementsByClassName("img__pic-count")[0];




// 이미지 등록 버튼 클릭시
(()=>{

    // 있는 이미지만 보이게 하기
(()=>{

    for(let i = 0; i < 5; i++){
       if(preview[i].getAttribute("src") == ""){
           boardImg[i].style.display = "none";
       } else {
           
           imageCount++;
       }
    }

    imagePicCount.innerText = "(" + imageCount + "/5)";

})();

    browseBtn.addEventListener("click", () =>{
    
        if(imageCount >= 5){

            alert("최대 5개의 사진을 첨부할 수 있습니다.");
            return;

        } else {
            for(let i = 0; i < 5; i++){
                
                if(preview[i].getAttribute("src") == ""){
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

                    if(i == 0){
                        const imageShow = document.getElementsByClassName("image-show")[0];
                        imageShow.prepend(div);
                    } else{
                        boardImg[i-1].after = div;
                    }

                    (()=>{
                        input.click();
                    })();

                    imageCount = 0;
                    for(let i = 0; i < 5; i++){
                        if(preview[i].getAttribute("src") == ""){
                            boardImg[i].style.display = "none";
                        } else {
                            
                            imageCount++;
                        }
                     }
                 
                     imagePicCount.innerText = "(" + imageCount + "/5)";

                }
            }

        }
    
    });


})();