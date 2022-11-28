// 최고예요 section
const conB = document.getElementById("badsection");
const conG = document.getElementById("goodsection");
conB.style.display = 'none';
// document.getElementById("badchoice").addEventListener("click",function(){
//         if(conB.style.display=='none'){ 		
//     	conB.style.display = 'block';
//         conG.style.display = 'none'; 	
//     }else{ 		
//     	conB.style.display = 'none';

//     }

// })

document.getElementById("badchoice").addEventListener("click",function(){
    if(conB.style.display=='none'){ 		
    conB.style.display = 'block';
    conG.style.display = 'none'; 	
}

})



// 별로예요 section
conG.style.display = 'none';
document.getElementById("goodchoice").addEventListener("change",function(){
        if(conG.style.display=='none'){ 		
        conG.style.display = 'block';
        conB.style.display = 'none'; 	
        }

})

//x버튼 누르면 없어짐(그니까 나왔다가 들어가면 다시 리셋인거임)
const xButton = document.getElementById("fa-x");
xButton.addEventListener("click",function(){
    conB.style.display = 'none';
    conG.style.display = 'none';
})



