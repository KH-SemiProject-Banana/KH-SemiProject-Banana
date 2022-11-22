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


}

        



    

function closePop(){
    document.getElementById("popup_layer").style.display = "none";
}






