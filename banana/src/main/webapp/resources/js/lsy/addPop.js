//팝업 띄우기
//const popupLayerList = document.getElementsByClassName("popup_layer"); //추가
let reviewGoodsNo;
let reviewBuyerNo;

//첫번째 팝업 띄우기
function openPop(goodsNo, buyerNo, buyerNickname) {
    $("input[name ='good']").prop("checked",false);
    $("input[name ='bad']").prop("checked",false);
    reviewGoodsNo = goodsNo;
    reviewBuyerNo = buyerNo;
    document.getElementById("buyerNickname").innerText = buyerNickname;
    
    document.getElementById("popup_layer").style.display = "block";
 
   

    
}


//(첫번째 팝업 내부) 클릭이벤트로 클릭 시에 다른 쪽에 있는 체크박스 전부해제하는 코드
const badChoice = document.getElementById("badchoice");
const goodChoice = document.getElementById("goodchoice");
const badArr = document.getElementsByClassName("bad");
const goodArr = document.getElementsByClassName("good");

badChoice.addEventListener("click",()=>{
    
    $("input[name ='good']").prop("checked",false);
})

goodChoice.addEventListener("click",()=>{
   
    $("input[name ='bad']").prop("checked",false);
})


//첫번째 팝업의 [제출하기] 버튼
const submitBtn = document.getElementById("submitButton");

const goodCheckedArr = [];
const badCheckedArr = [];
const reviewText = document.getElementById("reviewText");
submitBtn.addEventListener("click", function(){
    const goodCheckArr = document.querySelectorAll("input[name ='good']:checked"); 
    const badCheckArr = document.querySelectorAll("input[name ='bad']:checked"); 

    console.log(goodCheckArr);
    for(let i = 0; i<goodCheckArr.length ; i++){
        goodCheckedArr.push(goodCheckArr[i].value);
    }
    console.log(badCheckArr);
    for(let i = 0; i<badCheckArr.length ; i++){
        badCheckedArr.push(badCheckArr[i].value);
    }
    console.log(goodCheckedArr); // [1, 2]
    console.log(badCheckedArr); // []
    console.log(reviewText.value); 
    console.log(reviewGoodsNo);
    console.log(reviewBuyerNo);

    const goodCheckeJoin = (goodCheckedArr.length == 0) ? null : goodCheckedArr.join();
    const badCheckeJoin = (badCheckedArr.length == 0) ? null : badCheckedArr.join();
    console.log(badCheckeJoin);
    $.ajax({
        url: "/member/myPage/sendingReview",
        data : {"goodChecked":goodCheckeJoin,"badChecked":badCheckeJoin,"reviewText":reviewText.value,
        "reviewGoodsNo":reviewGoodsNo,"reviewBuyerNo":reviewBuyerNo},
        success:(result) => {
    
            if(result > 0){ //성공

                
                alert("db에 제출 완료된 듯?");

            } else { //실패
                console.log("서버에 저장 실패");
            }

        },
        error : () => {console.log("동작에러남");},

        complete : () => { //success, error 수행여부 관계없이 무조건 수행
            console.log("아무때나 나타나는 친구");
        }


    })

    goodCheckedArr.length = 0;
    badCheckedArr.length = 0;

})

//팝업 닫기
function closePop() {
    document.getElementById("popup_layer").style.display = "none";
//    for(let popupLayer of popupLayerList){

//     popupLayer.style.display = "none";
// }

}

//////////////////////////////////////////////////////////////////////////////

//document.querySelectorAll("[name='good']:checked")[0].nextElementSibling.innerText

//팝업 띄우기 
// function openPop2() {
//     document.getElementById("popup_layer2").style.display = "block";
    

// }

//팝업 닫기
function closePop2() {
    document.getElementById("popup_layer2").style.display = "none";
    const popopen = document.getElementById("popopen");

    // popopen.innerText= "<div class='testcolor2'>보낸 후기 보기</div>";
    popopen.innerText = "보낸 후기 보기"
    popopen.classList.add("testcolor2");

    popopen.setAttribute("href", "#");
    
}

//2번째 팝업 열리는 기능
document.getElementById("submitButton").addEventListener("click",function(){

    document.getElementById("popup_layer2").style.display = "block";
    document.getElementById("popup_layer").style.display = "none";

    //document.querySelectorAll("[name='good']:checked")[0].nextElementSibling.innerText

    //기존 꺼 삭제(누적 방지)
    document.querySelector("#messageList").innerHTML = "";
    
    
    const chkArr = document.querySelectorAll(".chk:checked");

    for(let i = 0; i < chkArr.length;i++){
        let li1 = document.createElement("li")
        li1.innerText= chkArr[i].nextElementSibling.innerText;
        document.querySelector("#messageList").append(li1);

    }

    

    
})

//[보낸 후기 보기]를 할 때, 팝업 열리기!
function openReview(ratingNo,buyerNickname,title) {

    //2번째 팝업페이지가 block되게 한다!
    document.getElementById("popup_layer2").style.display = "block";

    //매개변수로 가져온 값을 집어넣었음.
    document.getElementById("nickName1").innerText = buyerNickname;
    document.getElementById("nickName2").innerText = buyerNickname;
    document.getElementById("goodsTitle").innerText = title;

    // //기존 꺼 삭제(누적 방지)
    document.querySelector("#messageList").innerHTML = "";
    
    //수업용 ajax 참고하려고 가져옴!!
    $.ajax({
        url:"/member/myPage/selectSendingReview",
        data:{"ratingNo":ratingNo},
        type:"POST",
        dataType : "JSON", // 응답데이터의 형식이 JSON이다. -> 자동으로 JS객체로 변환해줌...
        success : (reviewList) => {
            console.log(reviewList); //레알 reviewList가 나오는지 console로 찍어볼게용

            // 1) JSON 형태의 문자열로 반환된 경우(JSON -> JS 객체)
            // 방법 1) JSON.parse(문자열)
            //console.log(JSON.parse(member));

            // 방법 2) dataType : "JSON" 추가

            // 2. Jackson라이브러리를 이용하면 걍 그 자체가 옴...js객체로...

            //----------------------------------------------------
            
            for(let review of reviewList){

                const li1 = document.createElement("li");
                li1.innerText = review.mannerDescription;
                document.querySelector("#messageList").append(li1);

            }

        },
        error : () => {

            console.log("받은/매너후기/목록 실패");

        }
    });
}



//글 안에 (dot) 누를 때 1. 열리고 / 2. 아무데나 누르면(dot제외) 닫히는 기능
const dotList = document.getElementsByClassName("dot");

for(let dot of dotList){
    dot.addEventListener("click", function(e){


        // .anotherPop 있는지 검사
        const anotherPop = document.getElementsByClassName("anotherPop")[0];

        if(anotherPop != undefined){ // 기존에 열린게 있으면 지워라
            anotherPop.remove();
        }

        const container = document.createElement("div");
        const div1 = document.createElement("div");
        const div2 = document.createElement("div");
        const div3 = document.createElement("div");
        
        container.classList.add("anotherPop");

        div1.classList.add("anotherPop1" , "babo");
        div1.innerText = "글 수정하기";
        div1.addEventListener("click", function(){
            location.href = "http://192.168.10.76:5500/html/myPage_review_good.html";
        })

        div2.classList.add("anotherPop1" , "babo");
        div2.innerText = "글 삭제하기";
        div2.addEventListener("click", function(){
            
        })

        div3.classList.add("anotherPop1");
        div3.innerText = "끌어올리기";
        div3.addEventListener("click", function(){
            
        })

        container.append(div1, div2, div3);

        dot.after(container);


    });
}


// 화면 어디를 클릭하든
document.addEventListener("click",function(e){

    
    if(e.target.classList.contains("dot")){
        return;
    }
    

    // .anotherPop 있는지 검사
    const anotherPop = document.getElementsByClassName("anotherPop")[0];

    if( anotherPop != undefined){ // 기존에 열린게 있으면 지워라
        // anotherPop.remove();

        const temp = document.querySelectorAll(".anotherPop, .anotherPop > *");

        for(let t of temp){
            if(t == e.target){
                return;
            }
        }

        anotherPop.remove();
    }



})






const first = document.getElementById("myBanana-sellList");
const fourth = document.querySelector("#changeJsp");

fourth.style.display = "none";

// 판매목록 카테고리 클릭 시 오픈
document.getElementById("first-category").addEventListener("click",function(){
    alert("첫번째 카테고리 open");

    
    fourth.style.display = "none";
    if(first.style.display == "none"){
        first.style.display = "block";
        fourth.style.display = "none";
    } else {
        fourth.style.display = "none";  
    }
    
    

    
})


// 후기 카테고리 클릭 시 오픈
document.getElementById("fourth-category").addEventListener("click",function(){
    alert("네번째 오픈");

    //first.style.display == "none";
    // console.log(document.querySelector("#changeJsp"));
    if(fourth.style.display == "none"){
        fourth.style.display = "block";
        first.style.display = "none";
     } else {
        first.style.display = "none";
    }
    
       
    
})


//강사님과 함께...

// const introUpdateBtn = document.getElementById("introUpdateBtn");

// introUpdateBtn.addEventListener("click", e => {
//     e.preventDefault();
//     console.log(e.target);
//     const pIntro = document.getElementById("p_intro");
//     const input = document.createElement("input");
    
//     input.value = pIntro.innerText;
//     pIntro.after(input); //after():선택한요소뒤에 컨텐츠삽입 - pIntro뒤에 input삽입
//     pIntro.remove();
    
//     input.classList.add("changed");

// })


//자기소개 수정하기 
const introUpdateBtn2 = document.getElementById("introUpdateBtn2");
const pIntro = document.getElementById("p_intro");

introUpdateBtn2.addEventListener("click", e => {
    // e.preventDefault();
    // console.log(e.target);
    const input = document.createElement("input");
    input.setAttribute("maxlength","40");
    input.setAttribute("placeholder","자기소개를 작성해주세요.");
    input.style.display = "block";
    input.value = pIntro.innerText;

    const changedBtn = document.createElement("p");
    changedBtn.setAttribute("id", "changedBtn");
    changedBtn.classList.add("changedBtn");
    changedBtn.innerText = "수정하기";


    pIntro.after(input); //after():선택한요소뒤에 컨텐츠삽입 - pIntro뒤에 input삽입
    introUpdateBtn2.after(changedBtn);
    pIntro.style.display = "none";
    

    
    input.classList.add("changed");
    introUpdateBtn2.style.display = "none";
    if(changedBtn.style.display == "none"){
        changedBtn.style.display = "block";
    }

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//자기소개 db에 수정된 거 넘기는 기능
    changedBtn.addEventListener("click",function(e){
        console.log(input.value);
        $.ajax({
            url : "/member/myPage/changeIntroduce",
            data : {"introduce":input.value},
            success:(result) => {
    
                if(result > 0){ //성공
    
                    // changedBtn.style.display = "none";
                    // if( introUpdateBtn2.style.display == "none"){
                    //     introUpdateBtn2.style.display= "block";
                    // }
                    changedBtn.remove();
                    input.remove();

                    pIntro.innerText = input.value;
                    pIntro.style.display = "block";
                    introUpdateBtn2.style.display = "block";
                    
                    alert("수정 완료된 듯?");
    
                } else { //실패
                    console.log("서버에 저장 실패");
                }
    
            },
            error : () => {console.log("동작에러남");},
            complete : () => { //success, error 수행여부 관계없이 무조건 수행
                console.log("아무때나 나타나는 친구");
            }
        });
    })
})



































// const introUpdateBtn = document.getElementById("introUpdateBtn");

// introUpdateBtn.addEventListener("click", () => {
//     //e.preventDefault();
//     //console.log(e.target);
//     const pIntro = document.getElementById("p_intro");
//     const input = document.createElement("input");
//     input.value = pIntro.innerText;
    
//     pIntro.after(input);
//     pIntro.remove();
//     input.classList.add("changed");
//     introUpdateBtn.innerText = "수정하기";
//     introUpdateBtn.classList.add("changedBtn");
//     introUpdateBtn.classList.remove("introUpdateBtn");

    

//     if(introUpdateBtn.classList.contains("changedBtn")){

//         $.ajax({
//             url : "/changeInfo",
//             data : {"changedInfo" : input.value},
//             success:(result) => {

//                 if(result > 0){ //성공

//                     pIntro.innerText = input.value;
//                     input.classList.remove("changed");
//                     introUpdateBtn.classList.add("introUpdateBtn");
//                     introUpdateBtn.classList.add("changedBtn");


                    
                

//                 } else { //실패
//                     console.log("서버에 저장 실패");
//                 }

//             },
//             error : () => {console.log("동작 에러난듯?");
//             pIntro.innerText = input.value;
//                     input.classList.remove("changed");
//                     introUpdateBtn.classList.add("introUpdateBtn");
//                     introUpdateBtn.classList.add("changedBtn");
        
//             }


//         })

//     }


// })

// //좋아요 버튼 클릭 시 동작
// //(전역변수 memberNo,boardNo 사용(boardDetail.jsp))
// const boardLike = document.getElementById("boardLike");

// boardLike.addEventListener("click", e => {

   

    


//     // 로그인 상태이면서 + 좋아요 상태가 아닌 경우
//     if(e.target.classList.contains('fa-regular')){//빈 하트인 경우

//         $.ajax({
//             url : "/boardLikeUp",
//             data : {"boardNo":boardNo , "memberNo":memberNo},
//             type : "GET",
//             success : (result) => {

//                 if(result > 0){ //성공
//                     e.target.classList.remove('fa-regular'); //빈 하트 클래스 삭제
//                     e.target.classList.add('fa-solid'); //채워진 하트 클래스 추가
            
                

//                 } else { //실패
//                     console.log("증가 실패");
//                 }

//             },

//             error : () => {console.log("증가 에러");}
//         });

//     }
//     // 로그인 상태이면서 + 좋아요 상태인 경우
//     else{ //채워진 하트인 경우
        

//         $.ajax({
//             url : "/boardLikeDown",
//             data : {"boardNo":boardNo , "memberNo":memberNo},
//             type : "GET",
//             success : (result) => {

//                 if(result > 0){ //성공
//                     e.target.classList.add('fa-regular'); //채워진 하트 삭제
//                     e.target.classList.remove('fa-solid'); //빈 하트 클래스  추가
                    

//                 } else { //실패
//                     console.log("감소 실패");
//                 }

//             },

//             error : () => {console.log("감소 에러");}
//         });
//     }


// });
