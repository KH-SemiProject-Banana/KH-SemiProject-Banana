const click =  document.getElementById("click");
const click1 = document.getElementById("click1");
const click2 = document.getElementById("click2");
const click3 = document.getElementById("click3");
const click4 = document.getElementById("click4");
const click5 = document.getElementById("click5");
const reportsubmit = document.getElementById("reportsubmit");
const abc1 = document.getElementById("abc1");
const abc2 = document.getElementById("abc2");
const abc3 = document.getElementById("abc3");
const abc4 = document.getElementById("abc4");
const abc5 = document.getElementById("abc5");
const fin = document.getElementById("fin");
// const ctg = document.getElementsByClassName("ctg")
reportsubmit.style.display = "none";


function openPop(){
    //document.getElementById("popup_layer").style.display = "block";
    document.getElementById("popup_layer").style.display = "block";
    // document.getElementById("popup_box").style.display = "block";

        click1.style.display = "none";
        //click1.style.backgroundColor = "red";
        click2.style.display = "none";
        click3.style.display = "none";
        click4.style.display = "none";
        click5.style.display = "none";
    
    


    //   console.log(abc1);
    // abc1.addEventListener("click",function(){
    //     alert("szdvsadfa");
        
    //     if(click2.style.display == "none"){
    //         click1.style.display = "none";
    //         click2.style.display = "block";
    //         alert("szdvsadfa");
    //     }else{
    //         alert("szdvsadfa");
    //         click1.style.display = "none";

    //     }

    // })

    abc1.addEventListener("click",function(){
    
       
        if(click1.style.display == "none"){
            click.style.display = "none";
            click1.style.display = "block";
            fin.style.display="none";
        
        

        }
        
    })

    abc2.addEventListener("click", () => {
    
        if(click2.style.display == "none") {
            click.style.display = "none";
            click2.style.display = "block"
            fin.style.display="none";
        }

    })

    abc3.addEventListener("click",function(){
    
        if(click3.style.display == "none"){
            click.style.display = "none";
            click3.style.display = "block";
            fin.style.display="none";
        

        }
        
    })


    abc4.addEventListener("click",function(){
    
        if(click4.style.display == "none"){
            click.style.display = "none";
            click4.style.display = "block";
            fin.style.display="none";
        

        }
        
    })


    abc5.addEventListener("click",function(){
    
        if(click5.style.display == "none"){
            click.style.display = "none";
            click5.style.display = "block";
            fin.style.display="none";
        

        }
        
    })


    click1.addEventListener("click", () => {
        if(reportsubmit.style.display == "none") {
            click1.style.display = "none";
            reportsubmit.style.display = "block";



//     abc[i].addEventListener("click", () => {
//         click[i].style.display="block";
//         click1.style.display="none";
        
//     })
    
//     break;
// }
    

//     for(let i = 0; i < abc.length; i++){
//         abc[i].addEventListener("click", () => {
//             click[i].style.display="block";
//             click1.style.display="none";
            
//         })
        
//         break;
//     }

    

        }

})
    click2.addEventListener("click", () => {
        if(reportsubmit.style.display == "none") {
            click2.style.display = "none";
            reportsubmit.style.display = "block";

        }

    })

    click3.addEventListener("click", () => {
        if(reportsubmit.style.display == "none") {
            click3.style.display = "none";
            reportsubmit.style.display = "block";

        }

    })

    click4.addEventListener("click", () => {
        if(reportsubmit.style.display == "none") {
            click4.style.display = "none";
            reportsubmit.style.display = "block";

        }

    })

    click5.addEventListener("click", () => {
        if(reportsubmit.style.display == "none") {
            click5.style.display = "none";
            reportsubmit.style.display = "block";

        }

    })

    // abc 클래스 친구들 다 데려오기
    const abc = document.getElementsByClassName("abc");
    const ctg1 = document.getElementsByName("ctg1");
    const ctg2 = document.getElementsByName("ctg2");

    for(let i = 0; i < abc.length; i++) {
        // abc의 i번째 친구가 눌렸을 때 
        abc[i].addEventListener("click", () => {
            // 0번부터 눌리니깐 +1
            ctg1.value = i + 1;
            console.log(ctg1);
            document.getElementById("input1").setAttribute("value",ctg1.value);
            // ctg2 설명을 담을 껍데기 변수 선언
            let ctg2dsc;

            // ctg 1벨류가 특정값일때 
            switch (ctg1.value) {
                case 1:
                    ctg2dsc = document.getElementById("click1").children;
                    // 클릭1 자식요소 가져오기
                    break;
        
                case 2:
                    ctg2dsc = document.getElementById("click2").children;
                    // 클릭 2 자식요소(세부카테고리) 가져오기
                    break;
        
                case 3:
                    ctg2dsc = document.getElementById("click3").children;
                    break;
        
                case 4:
                    ctg2dsc = document.getElementById("click4").children;
                    break;
        
                case 5:
                    ctg2dsc = document.getElementById("click5").children;
                    break;
            }

            // 위에서 가져온 세부카테고리 배열 반복문으로 검사
            for(let i = 0; i < ctg2dsc.length; i++){
                // 몇번째 인덱스가 클릭되었을때 이벤트 발생
                ctg2dsc[i].addEventListener("click", () => {
                    // 0번째 인덱스는 디비에 없으니 +1
                    ctg2.value = i + 1;
                    console.log(ctg2);
                    document.getElementById("input2").setAttribute("value",ctg2.value);
                    
                })
            }
        })
    }

}

        



    

function closePop(){
    document.getElementById("popup_layer").style.display = "none";
}





