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

const userreportsubmit = document.getElementById("userreportsubmit");

userreportsubmit.style.display = "none";

const back1 = document.getElementById("back1");
const back2 = document.getElementById("back2");
const back3 = document.getElementById("back3");

//담을 전역변수
let category1;
let category2;

document.getElementById("poppingThing").style.display = "none";
function openPop(){
    //document.getElementById("popup_layer").style.display = "block";
    
    document.getElementById("popup_layer").style.display = "block";
    document.getElementById("poppingThing").style.display = "block";
    // document.getElementById("popup_box").style.display = "block";
    
    click1.style.display = "none";
    //click1.style.backgroundColor = "red";
    click2.style.display = "none";
    click6.style.display = "none";
    click7.style.display = "none";
    
    
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
        back1.style.display = "block";
            
        }
        
        
    })
    
    abc2.addEventListener("click", () => {
    
        if(click2.style.display == "none") {
            click.style.display = "none";
            click2.style.display = "block"
            back1.style.display = "block";

            
        }
        
    })
    
    abc3.addEventListener("click",function(){
        
        if(userreportsubmit.style.display == "none"){
            click.style.display = "none";
            userreportsubmit.style.display = "block";
            back3.style.display = "block";
        }
        
    })
    
    
    abc4.addEventListener("click",function(){
        
        if(userreportsubmit.style.display == "none"){
            click.style.display = "none";
            userreportsubmit.style.display = "block";
            back3.style.display = "block";
        }
        
    })
    
    
    abc5.addEventListener("click",function(){
        
        if(userreportsubmit.style.display == "none"){
            click.style.display = "none";
            userreportsubmit.style.display = "block";
            back3.style.display = "block";
            
        }
        
    })
    
    abc6.addEventListener("click",function(){
    
        if(click6.style.display == "none"){
            click.style.display = "none";
            click6.style.display = "block";
            back1.style.display = "block";
        }
        
    })
    
    abc7.addEventListener("click",function(){
        
        if(click7.style.display == "none"){
            click.style.display = "none";
            click7.style.display = "block";
            back1.style.display = "block";
        }
        
    })
    
    
    abc8.addEventListener("click",function(){
        
        if(userreportsubmit.style.display == "none"){
            click.style.display = "none";
            userreportsubmit.style.display = "block";
            back3.style.display = "block";
        }
        
    })
    
    

    
    
    
    click1.addEventListener("click", () => {
        if(userreportsubmit.style.display == "none") {
            click1.style.display = "none";
            userreportsubmit.style.display = "block";
            back2.style.display = "block";
                        
        }                
    })

    click2.addEventListener("click", () => {
        if(userreportsubmit.style.display == "none") {
            click2.style.display = "none";
            userreportsubmit.style.display = "block";
            back2.style.display = "block";
        }
    })
                
    click6.addEventListener("click", () => {
            if(userreportsubmit.style.display == "none") {
                        click6.style.display = "none";
                        userreportsubmit.style.display = "block";
                        back2.style.display = "block";
        }
        
    })

    click7.addEventListener("click", () => {
        if(userreportsubmit.style.display == "none") {
            click7.style.display = "none";
            userreportsubmit.style.display = "block";
            back2.style.display = "block";
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
                    
                    // 위에서 가져온 세부카테고리 배열 반복문으로 검사
                    for(let i = 0; i < ctg2dsc.length; i++){
                        // 몇번째 인덱스가 클릭되었을때 이벤트 발생

                ctg2dsc[i].addEventListener("click", () => {
                    // 0번째 인덱스는 디비에 없으니 +1
                    
                    if(i == 2 || i ==3 || i== 4 ||  i== 7){
                        
                        ctg2.value = i;
                        
                    } else{
                        ctg2.value = i + 1;
                        
                    }
                    
                    console.log(ctg2);

                    //담기
                    category1 = ctg1;
                    category2 = ctg2;
                    console.log(category1);
                    console.log(category2);
                    
                    
                })
            }
        })
    }

    document.getElementById("reportsubmit").addEventListener("click",function(){

        $.ajax({
            url : "/duplicateCheck",
            data:{"category1":category1,"category2":category2},
            success:(result) => {
                if(result>0){ //중복된 값이 있다.
                    alert("중복된 신고 사유입니다.");
                    document.getElementById("userreportsubmit").setAttribute("onsubmit","return false");
                } else { //중복된 값이 없다.
                    alert("중복검사 완료!")
                }
            },
            error:() => {
                console.log("동작 에러남")

            },
            complete:() =>{
                console.log("아무때나 나타나는 신호")
            }

        })


    })
    
        back3.addEventListener("click", () => {
            userreportsubmit.style.display = "none";
            click.style.display = "block";
            back3.style.display = "none";
        });
    

    


    // back2.style.display = "none";

    back1.addEventListener("click",() => {
        switch (ctg1.value) {
            case 1:
                click1.style.display = "none";
            break;
                
            case 2:
                click2.style.display = "none";
            break;

                            
            case 6:
                click6.style.display = "none";
            break;
    
            case 7:
                click7.style.display = "none";   
            break;          
            }

            click.style.display = "block";
            back1.style.display = "none";
    })


    back2.addEventListener("click",() => {
        userreportsubmit.style.display = "none";

        switch (ctg1.value) {
            case 1:
                click1.style.display = "block";
            break;
                
            case 2:
                click2.style.display = "block";
            break;

                            
            case 6:
                click6.style.display = "block";
            break;
    
            case 7:
                click7.style.display = "block";   
            break;          
            }

            back2.style.display = "none";
    })

    // back2.addEventListener("click", () => {
        
    //     click.style.display = "block";
       

    // })

   /*  back2.addEventListener("click", () => {

        ctg2.value ="";

    }) */



    



    

function closePop(){
    document.getElementById("popup_layer").style.display = "none";
}





