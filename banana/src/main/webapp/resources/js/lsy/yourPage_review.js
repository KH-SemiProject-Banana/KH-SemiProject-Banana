
//'판매내역'을 클릭했을 때, form태그 제출 (판매완료인 목록들이 조회됨)
document.getElementById("firstCt").addEventListener("click",function(){
    const myBananaSell = document.getElementById("first-category");
    myBananaSell.action = "/member/myPage/yourPageMain?myPageCt=1";
    myBananaSell.submit();
})
//'후기'을 클릭했을 때, form태그 제출 (후기 조회됨)
document.getElementById("lastCt").addEventListener("click",function(){
    const myBananaSell = document.getElementById("fourth-category");
    myBananaSell.action = "/member/myPage/selectAllYourReview";
    myBananaSell.submit();
})

// //'판매중'을 클릭했을 때, form태그 제출 (판매중인 목록들이 조회됨)
// document.getElementById("sellingA").addEventListener("click",function(){
//     const myBananaSell = document.getElementById("myBanana-sell");
//     myBananaSell.action = "/member/myPage/yourPageMain?myPageCt=5";
//     myBananaSell.submit();
// })

// //'판매완료'을 클릭했을 때, form태그 제출 (판매완료인 목록들이 조회됨)
// document.getElementById("soldA").addEventListener("click",function(){
//     const myBananaSell = document.getElementById("myBanana-sell");
//     myBananaSell.action = "/member/myPage/yourPageMain?myPageCt=1";
//     myBananaSell.submit();
// })

//일단 각자 페이지에 넣어놓음(주석처리 해놓음)
// //추가
//'받은 매너 평가'를 클릭했을 때, form태그 제출
document.getElementById("goToManner").addEventListener("click",function(){
    const myBananaSell = document.getElementById("title_section_1");
    myBananaSell.action = "/member/myPage/yourReview/good";
    myBananaSell.submit();
})

// //



// //추가
// //'받은 거래 후기'를 클릭했을 때, form태그 제출
// document.getElementById("bothD").addEventListener("click",function(){
//     const myBananaSell = document.getElementById("category_border");
//     myBananaSell.action = "/member/myPage/yourReview/detail?detailCt=1";
//     myBananaSell.submit();
// })
// document.getElementById("bothB").addEventListener("click",function(){
//     const myBananaSell = document.getElementById("category_border");
//     myBananaSell.action = "/member/myPage/yourReview/detail?detailCt=2";
//     myBananaSell.submit();
// })
// document.getElementById("bothS").addEventListener("click",function(){
//     const myBananaSell = document.getElementById("category_border");
//     myBananaSell.action = "/member/myPage/yourReview/detail?detailCt=3";
//     myBananaSell.submit();
// })



// 페이지네이션 a태그 얻어오기
const list = document.querySelectorAll(".pagination a");


for(let item of list){
    const data = item.getAttribute("data");
    if(data != null){
        
        item.addEventListener("click", e => {
            document.getElementById("cp").value = data;
            document.submitFrm.submit();
        })
    }
}