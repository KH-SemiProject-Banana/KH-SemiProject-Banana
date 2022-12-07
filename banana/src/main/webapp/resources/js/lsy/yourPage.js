document.getElementById("sellingA").addEventListener("click",function(){
    const myBananaSell = document.getElementById("myBanana-sell");
    myBananaSell.action = "/member/myPage/yourPageMain?myPageCt=5";
    myBananaSell.submit();
})

document.getElementById("soldA").addEventListener("click",function(){
    const myBananaSell = document.getElementById("myBanana-sell");
    myBananaSell.action = "/member/myPage/yourPageMain?myPageCt=1";
    myBananaSell.submit();
})

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