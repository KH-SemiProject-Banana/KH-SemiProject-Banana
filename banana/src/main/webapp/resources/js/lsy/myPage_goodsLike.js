// // 체크박스 값 가져오기
// const chkBox = document.getElementsByName("location");
// const params = new URL(location.href).searchParams;
// const arr = params.getAll("location");

// for(let i = 0; i < chkBox.length; i++){
//     if(chkBox[i].value == arr[0] || chkBox[i].value == arr[1] || chkBox[i].value == arr[2]){
//         chkBox[i].checked = true;
//     }
// }

// // 체크한 구 표시
// const Gu = document.getElementById("Gu");
// Gu.innerHTML = "";

// for(let i = 0; i < chkBox.length; i++){
//     if(chkBox[i].checked){
//         Gu.innerHTML += "<div class='checkGu'><span class='remove'>×</span><span>" + chkBox[i].value + "</span></div>";
//     }
// }

// // 최신순, 저가순, 고가순 표시
// const orderSelect = document.querySelectorAll("select > option");
// const order = params.get("order");

// switch(order) {
//     case "1": orderSelect[0].selected = true; break;
//     case "2": orderSelect[1].selected = true; break;
//     case "3": orderSelect[2].selected = true; break;
// }

// // 체크박스 개수 제한
// function count_check(chk){
//     let count = 0;
    
//     for(let i = 0; i < chkBox.length; i++){
//         if(chkBox[i].checked){
//             count++;
//         }
//     }

//     if(count > 3){
//         alert("3개까지 체크할 수 있습니다.");
//         chk.checked = false;
//     }
// }

// // × 눌렀을 때 체크박스 해제
// const remove = document.getElementsByClassName("remove");

// for(let item of remove){
//     item.addEventListener("click", function(){
//         const goo = this.nextElementSibling.innerText;
    
//         document.querySelector("input[value='" + goo + "']").checked = false;
    
//         this.parentElement.remove();
//     })
// }

// 찜
const likeChk = document.getElementsByClassName("likeChk");

for(let i = 0; i < likeChk.length; i++) {
    likeChk[i].addEventListener("change", () => {
        if(memberNo == "") {
            alert("로그인 후 이용해주세요.");
            likeChk[i].checked = false;
            location.href = "/member/login";
            return;
        }
        
        const goodsNo = likeChk[i].value;
        let sellerNo; 

        $.ajax({
            url : "/goodsLikeSelf",
            data : {"goodsNo" : goodsNo},
            async : false,
            type : "GET",
            success : (result) => {
                sellerNo = result;
            },
            error : () => {console.log(sellerNo);}
        });

        if (memberNo == sellerNo) {
            alert("자신의 게시글에는 찜할 수 없습니다.");
            likeChk[i].checked = false;
            return;
        }

        if(likeChk[i].checked) {
            $.ajax({
                url : "/goodsLikeUp",
                data : {"goodsNo" : goodsNo, "memberNo" : memberNo},
                type : "GET",
                success : (result) => {
                    if (result > 0) {
                        alert("찜 목록에 추가되었습니다.");
                    } else {
                        console.log("찜 실패");
                    }
                },
                error : () => {console.log("찜 에러");}
            });

        } else {
            $.ajax({
                url : "/goodsLikeDown",
                data : {"goodsNo" : goodsNo, "memberNo" : memberNo},
                type : "GET",
                success : (result) => {
                    if (result > 0) {
                        alert("찜 목록에서 삭제되었습니다.");
                    } else {
                        console.log("취소 실패");
                    }
                },
                error : () => {console.log("취소 에러");}
            });
        }
    })
}

// 검색어 남기기
// if(query != null) {
//     document.getElementById("query").value = query;
// }

// 시행착오 코드
// 1페이지(초기화면)
// const selectPage = document.getElementsByClassName("selectPage");
// const pageNo = document.getElementsByClassName("pageNo");

// if(selectPage.length == 0){
//     pageNo[0].classList.add("selectPage");
// }

// 페이지 번호
// for(let i = 0; i < pageNo.length; i++){
//     pageNo[i].addEventListener('click', function(){

//         for(let j = 0; j < pageNo.length; j++){
//             pageNo[j].classList.remove("selectPage");
//         }

//         pageNo[i].classList.add("selectPage");
//     });
// };

// 페이지 이동 - 왼쪽 화살표
// document.getElementById("leftArrow").addEventListener("click", function(){
//     const selectPage = document.getElementsByClassName("selectPage")[0].innerText;
//     let href;

//     if(pageNo != 1){
//         pageNo[selectPage-2].classList.add("selectPage");
//         pageNo[selectPage-1].classList.remove("selectPage");
//         href = pageNo[selectPage-2].href;
//         location.href = href;
//     }
// });

// 페이지 이동 - 오른쪽 화살표
// document.getElementById("rightArrow").addEventListener("click", function(){
//     const selectPage = document.getElementsByClassName("selectPage")[0].innerText;
//     let href;

//     if(pageNo != 10){
//         pageNo[selectPage].classList.add("selectPage");
//         pageNo[selectPage-1].classList.remove("selectPage");
//         href = pageNo[selectPage].href;
//         location.href = href;
//     }
// });