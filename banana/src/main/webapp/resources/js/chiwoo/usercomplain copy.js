const click =  document.getElementById("click");
const click1 = document.getElementById("click1");
const click2 = document.getElementById("click2");
const click6 = document.getElementById("click6");
const click7 = document.getElementById("click7");


const abc1 = document.getElementById("abc1");
const abc2 = document.getElementById("abc2");
const abc3 = document.getElementById("abc3");
const abc4 = document.getElementById("abc4");
const abc5 = document.getElementById("abc5");
const abc6 = document.getElementById("abc6");
const abc7 = document.getElementById("abc7");
const abc8 = document.getElementById("abc8");

reportsubmit = document.getElementById("reportsubmit");



// const ctg = document.getElementsByClassName("ctg")



function openPop(){
    //document.getElementById("popup_layer").style.display = "block";
    document.getElementById("popup_layer").style.display = "block";
    // document.getElementById("popup_box").style.display = "block";

        click1.style.display = "none";
        //click1.style.backgroundColor = "red";
        click2.style.display = "none";
        click6.style.display = "none";
        click7.style.display = "none";

        reportsubmit = document.getElementById("reportsubmit");

        if(reportsubmit != null) {

            reportsubmit.style.display = "none";
        }
    
};
    


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
            
        }
        
    })

    abc2.addEventListener("click", () => {
    
        if(click2.style.display == "none") {
            click.style.display = "none";
            click2.style.display = "block"
            
        }

    })

    abc3.addEventListener("click",function(){
    
        if(reportsubmit.style.display == "none"){
            click.style.display = "none";
            reportsubmit.style.display = "block";
            
        }
        
    })


    abc4.addEventListener("click",function(){
    
        if(reportsubmit.style.display == "none"){
            click.style.display = "none";
            reportsubmit.style.display = "block";

        }
        
    })


    abc5.addEventListener("click",function(){
    
        if(reportsubmit.style.display == "none"){
            click.style.display = "none";
            reportsubmit.style.display = "block";

        }
        
    })

    abc6.addEventListener("click",function(){
    
        if(click6.style.display == "none"){
            click.style.display = "none";
            click6.style.display = "block";

        }
        
    })

    abc7.addEventListener("click",function(){
    
        if(click7.style.display == "none"){
            click.style.display = "none";
            click7.style.display = "block";

        }
        
    })
    
    
    abc8.addEventListener("click",function(){
    
        if(reportsubmit.style.display == "none"){
            click.style.display = "none";
            reportsubmit.style.display = "block";

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

    click6.addEventListener("click", () => {
        if(reportsubmit.style.display == "none") {
            click6.style.display = "none";
            reportsubmit.style.display = "block";

        }

    })

    click7.addEventListener("click", () => {
        if(reportsubmit.style.display == "none") {
            click7.style.display = "none";
            reportsubmit.style.display = "block";

        }

    })



    // abc ????????? ????????? ??? ????????????
    const abc = document.getElementsByClassName("abc");
    const ctg1 = document.getElementsByName("ctg1");
    const ctg2 = document.getElementsByName("ctg2");

    for(let i = 0; i < abc.length; i++) {
        // abc??? i?????? ????????? ????????? ??? 
        abc[i].addEventListener("click", () => {
            // 0????????? ???????????? +1
            ctg1.value = i + 1;
            console.log(ctg1);
    
            // ctg2 ????????? ?????? ????????? ?????? ??????
            let ctg2dsc;

            // ctg 1????????? ??????????????? 
            switch (ctg1.value) {
                case 1:
                    ctg2dsc = document.getElementById("click1").children;
                    // ??????1 ???????????? ????????????
                    break;
        
                case 2:
                    ctg2dsc = document.getElementById("click2").children;
                    // ?????? 2 ????????????(??????????????????) ????????????
                    break;
                case 3:
                    ctg2dsc = 0;
                    break;

                case 4:
                    ctg2dsc = 0;
                break;

                case 5:
                    ctg2dsc = 0;
                break;

                case 6:
                    ctg2dsc = document.getElementById("click6").children;
                    break;
        
                case 7:
                    ctg2dsc = document.getElementById("click7").children;
                    break;
                case 8:
                    ctg2dsc = 0;
                break;

            }

            // ????????? ????????? ?????????????????? ?????? ??????????????? ??????
            for(let i = 0; i < ctg2dsc.length; i++){
                // ????????? ???????????? ?????????????????? ????????? ??????
                ctg2dsc[i].addEventListener("click", () => {
                    // 0?????? ???????????? ????????? ????????? +1
                    
                    if(i == 2 || i ==3 || i== 4 ||  i== 7){
                        
                        ctg2.value = "null";
                    } else{
                        ctg2.value = i + 1;

                    }
                    
                    console.log(ctg2);
                
                    
                })
            }
        })
    }



        



    

function closePop(){
    document.getElementById("popup_layer").style.display = "none";
}





