// 별로예요 section
const conB = document.getElementById("badsection");
// 최고예요 section
const conG = document.getElementById("goodsection");

//최고예요를 누르면, 최고section이 나오고 별로section이 들어간다.
document.getElementById("badchoice").addEventListener("click",function(){
    if(conB.style.display=='none'){ 		
    conB.style.display = 'block';
    conG.style.display = 'none'; 	
}

})


//별로예요를 누르면, 별로section이 나오고 최고section이 들어간다.
document.getElementById("goodchoice").addEventListener("change",function(){
        if(conG.style.display=='none'){ 		
        conG.style.display = 'block';
        conB.style.display = 'none'; 	
        }

})

//x버튼 누르면 없어짐(그니까 나왔다가 들어가면 다시 리셋인거임)
// const xButton = document.getElementById("fa-x");
// xButton.addEventListener("click",function(){
//     conB.style.display = 'none';
//     conG.style.display = 'none';
// })



