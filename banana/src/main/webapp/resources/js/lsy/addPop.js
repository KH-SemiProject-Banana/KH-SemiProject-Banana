//팝업 띄우기
function openPop() {
    document.getElementById("popup_layer").style.display = "block";

}

//팝업 닫기
function closePop() {
    document.getElementById("popup_layer").style.display = "none";
}

//////////////////////////////////////////////////////////////////////////////

//팝업 띄우기 
function openPop2() {
    document.getElementById("popup_layer2").style.display = "block";
    

}

//팝업 닫기
function closePop2() {
    document.getElementById("popup_layer2").style.display = "none";
    const popopen = document.getElementById("popopen");

    // popopen.innerText= "<div class='testcolor2'>보낸 후기 보기</div>";
    popopen.innerText = "보낸 후기 보기"
    popopen.classList.add("testcolor2");

    popopen.setAttribute("href", "#");
    
}

document.getElementById("submitButton").addEventListener("click",function(){

    document.getElementById("popup_layer2").style.display = "block";
    document.getElementById("popup_layer").style.display = "none";

})






// document.getElementById("anotherPop").style.display="none";
// document.getElementById("dot").addEventListener("click", function(){

//     document.getElementById("anotherPop").style.display = "block";

// })


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
// const intro = document.getElementById("p_intro");
// document.getElementById("pen_intro").addEventListener("click",function(){

//     const introChangeForm = document.createElement("form");



// })



/*
document.getElementById("fourth-category").addEventListener("click",function(){
    alert("안녕");
    // document.getElementById("popup_layer2").style.display = "block";
    console.log(document.getElementById("myBanana-sellList"));
    document.getElementById("myBanana-sellList").style.display = "none";
    document.getElementById("reviewsss").style.display = "block";
})
*/
// document.getElementById("first-category").addEventListener("click",function(){
//     alert("안녕");
//     // document.getElementById("popup_layer2").style.display = "block";
//     console.log(document.getElementById("myBanana-sellList"));
//     document.getElementById("myBanana-sellList").style.display = "block";
//     document.getElementById("reviewsss").style.display = "none";
// })



// const fourth = document.querySelector("#changeJsp");
// const ms = document.getElementById("myBanana-sellList");


// document.getElementById("fourth-category").addEventListener("click",function(){
//     alert("안녕");

//     console.log(document.querySelector("#changeJsp"));

//     fourth.innerHTML="<jsp:include page='/WEB-INF/views/member/myPage_review.jsp'/>";
//     ms.style.display = "none";
    

    
// })

const first = document.getElementById("myBanana-sellList");
const fourth = document.querySelector("#changeJsp");

fourth.style.display = "none";

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

const introUpdateBtn = document.getElementById("introUpdateBtn");

introUpdateBtn.addEventListener("click", e => {
    // e.preventDefault();
    // console.log(e.target);
    const pIntro = document.getElementById("p_intro");
    const input = document.createElement("input");
    
    input.value = pIntro.innerText;
    pIntro.after(input); //after():선택한요소뒤에 컨텐츠삽입 - pIntro뒤에 input삽입
    pIntro.remove();
    
    input.classList.add("changed");

})

document.getElementById("changedBtn").addEventListener("click",function(){

    
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
