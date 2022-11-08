function loadFile(input) {


  var files = input.files;	

  console.log(files);


  for(let file of files){
      const temp = document.querySelectorAll("#image-show > img");

      if( temp.length == 5){
          alert("최대 5개의 파일을 등록할 수 있습니다");
          return false;
      }


      var newImage = document.createElement("img");
      newImage.setAttribute("class", 'img');

  
      newImage.src = URL.createObjectURL(file);   

      newImage.style.width = "170px";
      newImage.style.height = "170px";
      newImage.style.padding = "0";
      newImage.style.margin = "10px";
      newImage.style.border = "1px solid rgba(0,0,0,0.1)";
      newImage.style.borderRadius = "8px";
      newImage.style.objectFit = "contain";


      var container = document.getElementById('image-show');
      
      // var del = document.createTextNode('삭제');


      container.appendChild(newImage);


      const count = container.childElementCount;
      document.getElementsByClassName("img__pic-count")[0].innerText = "("+count+"/5)";
      
  }
  return true;
};






// 유효성 검사

const checkObj = {
  "questionCategory" : false,
  "questionTitle" : false,
  "questionContent" : false
};



document.getElementById("question-form").addEventListener("submit", function(e){

  // 카테고리 유효성검사
  if(document.getElementById("question-category").value == ""){
      checkObj.questionCategory = false;
  } else{
      checkObj.questionCategory = true;
  }


  for(let key in checkObj){

      let str;

      if(!checkObj[key]){
          switch(key){
            case "questionCategory" : str="카테고리를 설정해주세요"; break;
            case "questionTitle" : str="글 제목을 입력해주세요"; break;
              case "questionContent" : str="글 내용을 입력해주세요"; break;
          }
      }
      alert(str);
      document.getElementById(key).focus();
      e.preventDefault();
      return;
  }


});


// 글제목 유효성검사
const questionTitle = document.getElementById("question-title");
questionTitle.addEventListener("input", function(){
    const titleMessage = document.getElementById("titleMessage");

    if(questionTitle.value.trim().length == 0){
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
questionContent.addEventListener("input", function(){
    const contentMessage = document.getElementById("contentMessage");

    if(questionContent.value.trim().length == 0){
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