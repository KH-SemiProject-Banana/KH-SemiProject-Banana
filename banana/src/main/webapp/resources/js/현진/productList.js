const chkBox = document.getElementsByName("location");
const Gu = document.getElementById("Gu");

Gu.innerHTML = "";

// 체크박스 값 가져오기
const params = new URL(location.href).searchParams;
const arr = params.getAll("location");

for(let i = 0; i < chkBox.length; i++){
    if(chkBox[i].value == arr[0] || chkBox[i].value == arr[1] || chkBox[i].value == arr[2]){
        chkBox[i].checked = true;
    }
}

// 체크한 구 표시
for(let i = 0; i < chkBox.length; i++){
    if(chkBox[i].checked){
        Gu.innerHTML += "<div class='checkGu'><span class='remove'>×</span><span>" + chkBox[i].value + "</span></div>";
    }
}

// 체크박스 개수 제한
function count_check(chk){
    let count = 0;
    
    for(let i = 0; i < chkBox.length; i++){
        if(chkBox[i].checked){
            count++;
        }
    }

    if(count > 3){
        alert("3개까지 체크할 수 있습니다.");
        chk.checked = false;
    }
}

// × 눌렀을 때 체크박스 해제
const remove = document.getElementsByClassName("remove");

for(let item of remove){
    item.addEventListener("click", function(){
        const goo = this.nextElementSibling.innerText;
    
        document.querySelector("input[value='" + goo + "']").checked = false;
    
        this.parentElement.remove();
    })
}

// 1페이지(초기화면)
const selectPage = document.getElementsByClassName("selectPage");
const pageNo = document.getElementsByClassName("pageNo");

if(selectPage.length == 0){
    pageNo[0].classList.add("selectPage");
}

// 페이지 번호
for(let i = 0; i < pageNo.length; i++){
    pageNo[i].addEventListener('click', function(){

        for(let j = 0; j < pageNo.length; j++){
            pageNo[j].classList.remove("selectPage");
        }

        pageNo[i].classList.add("selectPage");
    });
};

// 페이지 이동 - 왼쪽 화살표
document.getElementById("leftArrow").addEventListener("click", function(){
    const selectPage = document.getElementsByClassName("selectPage")[0].innerText;
    let href;

    if(pageNo != 1){
        pageNo[selectPage-2].classList.add("selectPage");
        pageNo[selectPage-1].classList.remove("selectPage");
        href = pageNo[selectPage-2].href;
        location.href = href;
    }
});

// 페이지 이동 - 오른쪽 화살표
document.getElementById("rightArrow").addEventListener("click", function(){
    const selectPage = document.getElementsByClassName("selectPage")[0].innerText;
    let href;

    if(pageNo != 10){
        pageNo[selectPage].classList.add("selectPage");
        pageNo[selectPage-1].classList.remove("selectPage");
        href = pageNo[selectPage].href;
        location.href = href;
    }
});