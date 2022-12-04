//팝업 띄우기
//const popupLayerList = document.getElementsByClassName("popup_layer"); //추가

// function clickBtn(){
//     const btn1Value = document.getElementById("first-category");
//     document.getElementById("btn1ValueSave").value= btn1Value.value;
//     document.getElementById("frm").submit();
// }

//네번째 팝업 띄우기(프로필 팝업)
document.getElementById("profilePop").addEventListener("click",function(){
    
    document.getElementById("popup_layer4").style.display = "block";

})


//판매중/판매완료/구매완료인지에 따라 글씨체 bold로 바뀌는거 
switch(myPageCt){
    case 1: document.getElementById("first-category").style.fontWeight = "bold"; 
    document.getElementById("sold").style.fontWeight = "bold";
    break;
    case 2: document.getElementById("second-category").style.fontWeight = "bold"; break;
    case 5: 
    document.getElementById("first-category").style.fontWeight = "bold";
    document.getElementById("selling").style.fontWeight = "bold"; break;
}


const first = document.getElementById("myBanana-sellList");
const fourth = document.querySelector("#changeJsp");

fourth.style.display = "none";

// (1)판매목록 카테고리 클릭 시 오픈
document.getElementById("first-category").addEventListener("click",function(e){
    alert("첫번째 카테고리 open");

    
    fourth.style.display = "none";
    if(first.style.display == "none"){
        first.style.display = "block";
        fourth.style.display = "none";
    } else {
        fourth.style.display = "none";  
    }
    
    const firstValue = e.target.getAttribute("value"); // 1
    

    
})


// document.getElementById("first-category").addEventListener("click", ()=>{

//     document.getElementbyId("status").setAttribute("value","sell");
//     document.getElementById("status").setAttribute("name","sell");
//     document.getElementById("button").click();
// })


// (2)후기 카테고리 클릭 시 오픈
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

let reviewGoodsNo;
let reviewBuyerNo;
let reviewSellerNo;

//첫번째 팝업 띄우기
function openPop(goodsNo, buyerNo, buyerNickname,sellerNo, sellerNickname) {
    console.log(goodsNo);
    console.log(buyerNo);
    console.log(buyerNickname);
    console.log(sellerNo);
    console.log(sellerNickname);
    $("input[name ='good']").prop("checked",false);
    $("input[name ='bad']").prop("checked",false);
    reviewGoodsNo = goodsNo;
    reviewBuyerNo = buyerNo;
    reviewSellerNo = sellerNo;
    if(loginMemberNo == sellerNo){
        document.getElementById("buyerNickname").innerText = buyerNickname;
    }
    if(loginMemberNo ==buyerNo){
        document.getElementById("buyerNickname").innerText = sellerNickname;
    }
    
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
    console.log(reviewSellerNo);

    const goodCheckeJoin = (goodCheckedArr.length == 0) ? null : goodCheckedArr.join();
    const badCheckeJoin = (badCheckedArr.length == 0) ? null : badCheckedArr.join();
    console.log(badCheckeJoin);
    $.ajax({
        url: "/member/myPage/sendingReview",
        data : {"goodChecked":goodCheckeJoin,"badChecked":badCheckeJoin,"reviewText":reviewText.value,
        "reviewGoodsNo":reviewGoodsNo,"reviewBuyerNo":reviewBuyerNo,"reviewSellerNo":reviewSellerNo},
        success:(result) => {
    
            if(result > 0){ //성공

                
                alert("db에 제출 완료된 듯?");
                /* 새로 바꾸는 중 */
                //결과 : 전체가 바뀜.
                // $("#popopen").attr("href","javascript:openReview(${sold.ratingNo},${sold.buyerNo},'${sold.buyerNickname}','${sold.title}',${sold.sellerNo},'${sold.sellerNickname}')")
                // $(".testcolor").attr("class","testcolor2");



            } else { //실패
                console.log("서버에 저장 실패");
            }

        },
        error : () => {console.log("동작에러남");},

        complete : () => { //success, error 수행여부 관계없이 무조건 수행
            console.log("아무때나 나타나는 친구");
        }


    })

    goodCheckedArr.length = 0;//배열 비우기(누적방지용)
    badCheckedArr.length = 0;//배열 비우기(누적방지용)

})

//팝업 닫기
function closePop() {
    document.getElementById("popup_layer").style.display = "none";
//    for(let popupLayer of popupLayerList){

//     popupLayer.style.display = "none";
// }

}

//팝업 닫기
function closePop2() {
    document.getElementById("popup_layer").style.display = "none";
    document.getElementById("popup_layer2").style.display = "none";
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

    
    popopen.innerText = "보낸 후기 보기"
    popopen.classList.add("testcolor2");
    console.log("받은 후기버튼 누를 때 잘 되는지 확인해보는 용도")

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
function openReview(ratingNo,buyerNo,buyerNickname,title,sellerNo,sellerNickname) {
    console.log(ratingNo);
    console.log(buyerNo);
    console.log(buyerNickname);
    console.log(title);
    console.log(sellerNo);
    console.log(sellerNickname);
  

    //2번째 팝업페이지가 block되게 한다!
    document.getElementById("popup_layer2").style.display = "block";

    //매개변수로 가져온 값을 집어넣었음.
    if(loginMemberNo == sellerNo){
        document.getElementById("nickName1").innerText = buyerNickname;
        document.getElementById("nickName2").innerText = buyerNickname;
    }
    if(loginMemberNo == buyerNo){
        document.getElementById("nickName1").innerText = sellerNickname;
        document.getElementById("nickName2").innerText = sellerNickname;
    }
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

        const goodsNo = e.target.getAttribute("id");
        console.log("goodsNo : " + goodsNo);


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


        container.append(div1, div2, div3);

        dot.after(container);

        
        div1.classList.add("anotherPop1" , "babo");
        div1.innerText = "글 수정하기";
        div1.addEventListener("click", function(){
            location.href = "/goods/update/" + goodsNo;
        })


        div2.classList.add("anotherPop1" , "babo");
        div2.innerText = "글 삭제하기";
        // div2.addEventListener("click", $.ajax({

        //     url : "/goods/delete",
        //     data : {"goodsNo" : goodsNo},
        //     type : "GET",
        //     success : (result) => {
        //         if(result > 0) {
        //             // 상품태그 메인에서 지우기
        //             e.target.parentElement.parentElement.parentElement.remove();
        //         } else {
        //             console.log("상품글 삭제 실패");
        //         }
        //     },
        //     error : () => {
        //         console.log("상품글 삭제 중 오류 발생");
        //     }
        // }))

        div3.classList.add("anotherPop1");
        div3.innerText = "끌어올리기";
        div3.addEventListener("click", function(){
            
        })

        


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

/* ****************************************************************** */
//------------------------------------------------------------------------------------------------------
// 프로필 수정

const profileImage =  document.getElementById("profile-image");
const deleteImage =  document.getElementById("delete-image");
const imageInput = document.getElementById("image-input");

// 초기 프로필 이미지 상태를 저장하는 변수
// (true : 업로드된 이미지가 있음, false : 기본 이미지 상태)
let initCheck; 

// 이미지가 업로드 되었거나 삭제되었음을 나타내는 변수
// (-1 : 초기값, 0 :프로필 삭제(X버튼 클릭), 1 : 새 이미지 업로드)
let deleteCheck = -1;



// 프로필 수정 페이지에 처음 들어왔을 때의 이미지 경로
const originalImage = profileImage.getAttribute("src"); 

// 프로필 수정 화면일 경우

if(imageInput != null){

    // 해당 화면 진입 시 프로필 이미지 상태를 저장(initCheck)
    if(profileImage.getAttribute("src") == "/resources/images/user.png"){

        // 기본 이미지인 경우
        initCheck = false;

    } else {
        
        initCheck = true;
    }

    //이미지가 선택되었을 때 미리보기

    // * input type = "file" 요소는 값이 없을 때는 ''(빈칸)이다.
    // * input type = "file" 요소는 이전에 선택한 파일이 있어도 취소하면 다시 ''(빈칸)이 된다.
    // * input type = "file" 요소로 파일을 선택하면 change 이벤트가 발생한다.

    imageInput.addEventListener("change", e => {

        //e.target : 이벤트가 발생한 요소 (==imageInput)
        // *화살표 함수에서는 this를 못쓰기 때문에...(this는 window 객체를 의미하기 때문....)
        //e.target을 쓴다.

        console.log(e.target.files); 
        
        // e.target.files -> 선택된 파일의 목록이 나온다. 
        // 근데 우리는 늘 1개만 선택하잖아. 그니까...목록 중에서 [0]이지...
        console.log(e.target.files[0]); 

        //-----------------------------------------------------------------------------------------
        
        //선택된 파일이 있을 경우(없으면 undefined 나옴...)
        if(e.target.files[0] != undefined){

            const reader = new FileReader(); 
            // 자바스크립트가 제공하는 객체 중에 FileReader라는 객체가 있음.
            // FileReader (file을 읽는 객체)
            // - 웹 애플리케이션이
            // 비동기적으로 데이터를 읽기 위하여
            // 읽을 파일을 가리키는 File 객체이다.
            // 쉽게 말해서 file을 읽는 객체임!
            
            // + 읽어들인 파일을 사용자 컴퓨터에 저장할 수 있다!

            reader.readAsDataURL(e.target.files[0]); //이걸 적는 순간 이제 실제로 파일을 읽어들인다....
            // FileReader.readAsDataURL("파일정보")
            // -> 지정된 파일을 읽기 시작함

            // FileReader.onload : 파일 읽기가 완료되었을 때...라는 고전이벤트 형식이래..그에 대한 응답 지정하는 형식
            reader.onload = event => {

                console.log(event.target);

                //  event.target.result : 읽어진 파일의 결과(실제 이미지 파일)의 경로
                event.target.result

                // img 태그의 src 속성으로 읽은 이미지 파일 경로를 추가
                // == 이미지 미리보기
                profileImage.setAttribute("src", event.target.result);

                deleteCheck = 1;
            } 

        } else { // 취소가 눌러진 경우 , 이전 이미지로 돌아가게 해볼게!

            //1) 처음 이미지 경로를 변수 지정해준다음에....
            //const originalImage = profileImage.getAttribute("src"); 라고 위에 씀.
            profileImage.setAttribute("src", originalImage);

        }
        

    })

    //x버튼이 클릭되었을 경우 -> 기본 이미지(화면 들어올 때의 이미지가 아니고 걍 아예 쌩처음이미지)로 변경하겠다!!!!!
    deleteImage.addEventListener("click", () =>{
        profileImage.setAttribute("src", "/resources/images/user.png");
        imageInput.value = "";
        deleteCheck = 0;
    })

}

function profileValidate(){


    //이미지가 없다가 -> 있음
    if(!initCheck && deleteCheck == 1){
        return true;
    }


    //이미지가 있었다가 -> x를 눌러서 없어짐.
    if(initCheck && deleteCheck == 0){
        return true;
    }
        
    //있음 -> 있음(새로운 이미지 업로드)
    if(initCheck && deleteCheck == 1){
        return true;
    }

    alert("이미지 변경 후 클릭하세요");
    return false;
}





























