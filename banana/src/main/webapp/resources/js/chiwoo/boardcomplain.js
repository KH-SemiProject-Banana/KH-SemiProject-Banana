// 1페이지
const b_click  = document.getElementById("b_click");

// 2페이지
const b_click1 = document.getElementById("b_click1");
const b_click2 = document.getElementById("b_click2");
const b_click3 = document.getElementById("b_click3");
const b_click4 = document.getElementById("b_click4");
const b_click5 = document.getElementById("b_click5");
const b_click6 = document.getElementById("b_click6");

// 3페이지
const reportsubmit = document.getElementById("reportsubmit");

// 1페이지 카테고리들
const b_abc1 = document.getElementById("b_abc1"); 
const b_abc2 = document.getElementById("b_abc2");
const b_abc3 = document.getElementById("b_abc3");
const b_abc4 = document.getElementById("b_abc4");
const b_abc5 = document.getElementById("b_abc5");

// 1페이지 카테고리 배열
const b_abc = document.getElementsByClassName("b_abc");

// 사용자 신고하러 가기 
const fin = document.getElementById("fin");

// 뒤로가기
const b_back1 = document.getElementById("b_back1");
const b_back2 = document.getElementById("b_back2");

// 카테고리 번호
const b_ctg1 = document.getElementById("b_ctg1");
const b_ctg2 = document.getElementById("b_ctg2");

const disNone = () => {
    b_click1.style.display = "none";
    b_click2.style.display = "none";
    b_click3.style.display = "none";
    b_click4.style.display = "none";
    b_click5.style.display = "none";
    reportsubmit.style.display = "none";
    b_back1.style.display = "none";
    b_back2.style.display = "none";
    document.getElementById("popup_layer").style.display = "none";
    document.getElementById("poppingThing").style.display = "none";
}

disNone();

function openPop(){
    document.getElementById("popup_layer").style.display = "block";
    document.getElementById("poppingThing").style.display = "block";
    b_click.style.display = "block";
    fin.style.display = "block";


    b_abc1.addEventListener("click",function(){
        // if(b_click1.style.display == "none"){
            b_click.style.display = "none";
            b_click1.style.display = "block";
            fin.style.display="none";
            b_back1.style.display = "block";
        // }
    })

    b_abc2.addEventListener("click", () => {
        // if(b_click2.style.display == "none") {
            b_click.style.display = "none";
            b_click2.style.display = "block"
            fin.style.display="none";
            b_back1.style.display = "block";
        // }
    })

    b_abc3.addEventListener("click",function(){
        // if(b_click3.style.display == "none"){
            b_click.style.display = "none";
            b_click3.style.display = "block";
            fin.style.display="none";
            b_back1.style.display = "block";
        // }  
    })

    b_abc4.addEventListener("click",function(){
        // if(b_click4.style.display == "none"){
            b_click.style.display = "none";
            b_click4.style.display = "block";
            fin.style.display="none";
            b_back1.style.display = "block";
        // }
    })


    b_abc5.addEventListener("click",function(){
        // if(b_click5.style.display == "none"){
            b_click.style.display = "none";
            b_click5.style.display = "block";
            fin.style.display="none";
            b_back1.style.display = "block";
        // }  
    })

    b_click1.addEventListener("click", () => {
        // if(reportsubmit.style.display == "none") {
            b_click1.style.display = "none";
            reportsubmit.style.display = "block";
            b_back1.style.display = "none";
            b_back2.style.display = "block";
        // }
    })

    b_click2.addEventListener("click", () => {
        // if(reportsubmit.style.display == "none") {
            b_click2.style.display = "none";
            reportsubmit.style.display = "block";
            b_back1.style.display = "none";
            b_back2.style.display = "block";
        // }
    })

    b_click3.addEventListener("click", () => {
        // if(reportsubmit.style.display == "none") {
            b_click3.style.display = "none";
            reportsubmit.style.display = "block";
            b_back1.style.display = "none";
            b_back2.style.display = "block";
        // }
    })

    b_click4.addEventListener("click", () => {
        // if(reportsubmit.style.display == "none") {
            b_click4.style.display = "none";
            reportsubmit.style.display = "block";
            b_back1.style.display = "none";
            b_back2.style.display = "block";
        // }
    })

    b_click5.addEventListener("click", () => {
        // if(reportsubmit.style.display == "none") {
            b_click5.style.display = "none";
            reportsubmit.style.display = "block";
            b_back1.style.display = "none";
            b_back2.style.display = "block";
        // }
    })

    for(let i = 0; i < b_abc.length; i++) {

        // b_abc의 i번째가 눌렸을 때 
        b_abc[i].addEventListener("click", () => {

            // 0번부터 눌리니깐 +1
            b_ctg1.value = i + 1;
        
            
            // b_ctg2 설명을 담을 껍데기 변수 선언
            let b_ctg2dsc;
            
            // ctg 1벨류가 특정값일때 
            switch (b_ctg1.value) {
                case "1":
                    b_ctg2dsc = document.getElementById("b_click1").children;
                    // 클릭1 자식요소 가져오기
                    break;
        
                case "2":
                    b_ctg2dsc = document.getElementById("b_click2").children;
                    // 클릭 2 자식요소(세부카테고리) 가져오기
                    break;
        
                case "3":
                    b_ctg2dsc = document.getElementById("b_click3").children;
                    break;
        
                case "4":
                    b_ctg2dsc = document.getElementById("b_click4").children;
                    break;
        
                case "5":
                    b_ctg2dsc = document.getElementById("b_click5").children;
                    break;
            }

            // b_ctg2dsc = document.getElementById("click" + b_ctg1.value).children;
            console.log(b_ctg2dsc);

            // 위에서 가져온 세부 카테고리 배열 반복문으로 검사
            for(let i = 0; i < b_ctg2dsc.length; i++){

                // 몇번째 인덱스가 클릭되었을때 이벤트 발생
                b_ctg2dsc[i].addEventListener("click", () => {

                    // 0번째 인덱스는 디비에 없으니 +1
                    b_ctg2.value = i + 1;
                    console.log(b_ctg2);
                })
            }
        })
    }

    b_back2.addEventListener("click", () => {
        reportsubmit.style.display = "none";

        switch (b_ctg1.value) {
            case "1":
                b_click1.style.display = "block";
            break;
                
            case "2":
                b_click2.style.display = "block";
            break;

            case "3":
                b_click3.style.display = "block";
            break;

            case "4":
                b_click4.style.display = "block";
            break;

            case "5":
                b_click5.style.display = "block";   
            break;          
        }

            b_back1.style.display = "block";
            b_back2.style.display = "none";
    });

    b_back1.addEventListener("click",() => {
        switch (b_ctg1.value) {
            case "1":
                b_click1.style.display = "none";
            break;
                
            case "2":
                b_click2.style.display = "none";
            break;
                    
            case "3":
                b_click3.style.display = "none";
            break;
                        
            case "4":
                b_click4.style.display = "none";   
            break;
            
            case "5":
                b_click5.style.display = "none";   
            break; 
        }

        b_back1.style.display = "none";
        b_click.style.display = "block";
        fin.style.display= "block";
    });
    
    document.getElementById("b-report-submit-button").addEventListener("click", () => {
            $.ajax({
                url : "/reportsubmit",
                data : {"memberNo2" : document.getElementById("memberNo2").value,
                        "b_ctg1" : document.getElementById("b_ctg1").value,
                        "b_ctg2" : document.getElementById("b_ctg2").value,
                        "goodsNo2" : document.getElementById("goodsNo2").value,
                        "reportbox" : document.getElementById("reportbox").value},
                type : "POST",
                success : (result) => {
                    if(result > 0) {
                        alert("신고 가즈앗!!.");
                        closePop();
                    } else {
                        alert("신고중 오류가 발생했습니다.");
                    }
                },
                error : () => {alert("신고중 오류가 발생했습니다.");}
            });
        }
    )


    document.getElementById("b-report-submit-button").addEventListener("submit",function(e){

        $.ajax({
            url : "/duplicateCheck",
            data:{"memberNo":memberNo,"memberNo2":memberNo2},
            success:(result) => {
                if(result>0){ //중복된 값이 있다.
                    alert("중복된 신고 입니다.");
                    e.preventEvent();
                } else { //중복된 값이 없다.
                    alert("신고 완료!")
                }
            },
            error:() => {
                console.log("동작 에러남")

            },
            complete:() =>{
                console.log("완료시 콘솔에 떠라")
            }

        })


    })
    






}

function closePop(){
    disNone();
}