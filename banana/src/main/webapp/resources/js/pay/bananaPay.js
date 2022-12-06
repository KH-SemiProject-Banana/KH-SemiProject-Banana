const payCharge = document.getElementById("payCharge");
const payRefund = document.getElementById("payRefund");
const payLog = document.getElementById("payLogArea");

let chargeFlag = false;
let refundFlag = false;


const payRemain = document.getElementById("payRemain");

payCharge.style.display = "none";
payRefund.style.display = "none";
payLog.style.display = "none";

//팝업 띄우기
function openPop() {
    document.getElementById("popup_layer").style.display = "block";

    const payRemain = document.getElementById("payRemain");

    $.ajax({
    url : "/searchRemainPay",
    data : {"memberNo" : memberNo},
    type : "GET",
    async : false,
    success : (result) => {
        payRemain.innerText = result;
    },
    error : () => {console.log("바나나페이 조회 실패");}
    });
    
    payLog.style.display = "block";
}


document.getElementById("chargeBtn").addEventListener("click", function () {
    payCharge.style.display = "block";
    payRefund.style.display = "none";
    payLog.style.display = "none";
});
document.getElementById("refundBtn").addEventListener("click", function () {
    payRefund.style.display = "block";
    payCharge.style.display = "none";
    payLog.style.display = "none";
});
document.getElementById("logBtn").addEventListener("click", function () {
    payLog.style.display = "block";
    payCharge.style.display = "none";
    payRefund.style.display = "none";
});

document.querySelector(".closeCharge").addEventListener("click", function () {
    payCharge.style.display = "none";
});
document.querySelector(".closeRefund").addEventListener("click", function () {
    payRefund.style.display = "none";
});
document.querySelector(".closeLog").addEventListener("click", function () {
    payLog.style.display = "none";
});




//팝업 닫기
function closePop() {
    document.getElementById("popup_layer").style.display = "none";
}

const chargePrice = document.getElementById("chargePrice");
chargePrice.value = Number(0);
const refundPrice = document.getElementById("refundPrice");
refundPrice.value = Number(0);


// if(payCharge.style.display != "none"){

document.getElementsByClassName("charge1")[0].addEventListener("click", function () {
    chargePrice.value = Number(chargePrice.value) + Number(10000);
    chargeValidate();
});
document.getElementsByClassName("charge5")[0].addEventListener("click", function () {
    chargePrice.value = Number(chargePrice.value) + Number(50000);
    chargeValidate();
});
document.getElementsByClassName("charge10")[0].addEventListener("click", function () {
    chargePrice.value = Number(chargePrice.value) + Number(100000);
    chargeValidate();
});
// }

// if(payRefund.style.display != "none"){

document.getElementsByClassName("charge1")[1].addEventListener("click", function () {
    refundPrice.value = Number(refundPrice.value) + Number(10000);
    refundValidate();
});
document.getElementsByClassName("charge5")[1].addEventListener("click", function () {
    refundPrice.value = Number(refundPrice.value) + Number(50000);
    refundValidate();
});
document.getElementsByClassName("charge10")[1].addEventListener("click", function () {
    refundPrice.value = Number(refundPrice.value) + Number(100000);
    refundValidate();
});

document.getElementById("chargeAll").addEventListener("click", function () {
    refundPrice.value = payRemain.innerText;
    refundValidate();
});
// }



// 금액 초기화
const resetPrice = document.getElementsByClassName("resetPrice");
resetPrice[0].addEventListener("click", function () {
    chargePrice.value = 0;
    chargeValidate();
});
resetPrice[1].addEventListener("click", function () {
    refundPrice.value = 0;
    refundValidate();
});



// 직접입력 input버튼에 콤마 구현, 유효성 검사
refundPrice.addEventListener("input", function () {
    refundValidate();
});

chargePrice.addEventListener("focusin", () => {
    if (chargePrice.value == 0) {
        chargePrice.value = "";
    }
});



chargePrice.addEventListener("input", function () {
    chargeValidate();
});


// 충전 유효성 검사
const chargeValidate = () => {
    const chargeMessage = document.getElementById("chargeMessage");

    if (chargePrice.value.trim().length == 0 || chargePrice.value == 0) {
        chargeMessage.innerText = "숫자만 입력해주세요";
        chargeMessage.value = 0;
        chargeMessage.classList.remove("error", "confirm");

        chargeFlag = false;
        return;
    }

    const regEx = /^[0-9]{1,7}$/;
    const regEx2 = /^[0-9]{8,}$/;



    if (regEx.test(chargePrice.value)) { // 유효한 경우

        // chargeMessage.innerText = "유효한 형식입니다(숫자)";
        // chargeMessage.classList.remove("error");
        // chargeMessage.classList.add("confirm");

        if(chargePrice.value % 10000 != 0){
            chargePrice.value = Number(chargePrice.value);
            chargeMessage.innerText = "만 원 단위로만 입력해주세요";
            chargeMessage.classList.add("error");
            chargeMessage.classList.remove("confirm");
            chargeFlag = false;
            return;

        } else {
            chargeMessage.innerText = "유효한 형식입니다(숫자)";
            chargeMessage.classList.remove("error");
            chargeMessage.classList.add("confirm");
            chargeFlag = true;
        }

    } else if (regEx2.test(chargePrice.value)) {

        chargePrice.value = Number(chargePrice.value);

        chargeMessage.innerText = "입력한 금액이 너무 큽니다";
        chargeMessage.classList.add("error");
        chargeMessage.classList.remove("confirm");

        chargeFlag = false;
        return;

    } else {
        chargeMessage.innerText = "";
        chargeMessage.innerText = "숫자만 입력해주세요";
        chargeMessage.classList.add("error");
        chargeMessage.classList.remove("confirm");

        chargeFlag = false;
        return;
    }
};


// 환불 유효성 검사
const refundValidate = () => {

    const refundMessage = document.getElementById("refundMessage");

    if (refundPrice.value.trim().length == 0 || refundPrice.value == 0) {
        refundMessage.innerText = "숫자만 입력해주세요";
        refundMessage.value = 0;
        refundMessage.classList.remove("error", "confirm");

        refundFlag = false;
        return;
    }

    const regEx = /^[0-9]{1,7}$/;
    const regEx2 = /^[0-9]{8,}$/;



    if (regEx.test(refundPrice.value)) { // 유효한 경우

        refundPrice.value = Number(refundPrice.value);

        refundMessage.innerText = "유효한 형식입니다(숫자)";
        refundMessage.classList.remove("error");
        refundMessage.classList.add("confirm");

        refundFlag = true;


    } else if (regEx2.test(refundPrice.value)) {

        refundPrice.value = Number(refundPrice.value);

        refundMessage.innerText = "입력한 금액이 너무 큽니다";
        refundMessage.classList.add("error");
        refundMessage.classList.remove("confirm");

        refundFlag = false;
        return;

    } else {
        refundMessage.innerText = "";
        refundMessage.innerText = "숫자만 입력해주세요";
        refundMessage.classList.add("error");
        refundMessage.classList.remove("confirm");

        refundFlag = false;
        return;
    }
};


//충전하기
document.getElementById("chargeSubmitBtn").addEventListener("click", function (e) {

    if (!chargeFlag) {

        if (chargePrice.value == 0) {
            alert("0원을 충전할 수 없습니다. 금액을 입력해주세요");
            chargePrice.value = Number(0);
            chargePrice.focus();
            e.preventDefault();
            return;
        }
        if (chargePrice.value % 10000 != 0) {
            alert("충전할 금액을 만 원 단위로 입력해주세요");
            chargePrice.value = Number(0);
            chargePrice.focus();
            e.preventDefault();
            return;
        }
        return;
    }

});

// 환불하기
document.getElementById("refundSubmitBtn").addEventListener("click", function (e) {

    if (refundPrice.value == 0) {
        alert("0원을 환불할 수 없습니다. 환불할 금액을 입력해주세요");
        refundPrice.value = Number(0);
        refundPrice.focus();
        e.preventDefault();
        return;
    }
    if (refundPrice.value - payRemain.innerText > 0) {
        alert("현재 잔액보다 더 큰 금액을 환불할 수 없습니다.");
        refundPrice.value = Number(0);
        refundPrice.focus();
        e.preventDefault();
        return;
    }

});




/* 내 페이 사용내역--------------------------------------------------------- */
const dropdownContent2 = document.querySelectorAll(".dropdown-content2 > div");
const selectMonth = document.getElementById("selectMonth");
const dropdownContent1 = document.querySelectorAll(".dropdown-content1 > div");
const selectYear = document.getElementById("selectYear");



for (let month of dropdownContent2) {
    if (Number(month.innerText.substring(0, 2)) == new Date().getMonth() + 1) {
        month.classList.add("selected");
        selectMonth.innerText = month.innerText;
    }
}




for (let year of dropdownContent1) {
    if (Number(year.innerText.substring(0, 4)) == new Date().getFullYear()) {
        year.classList.add("selectedYear");
        selectYear.innerText = year.innerText;
    }
}





document.querySelector(".dropdown-content2").addEventListener("mouseover", () => {
    selectMonth.nextElementSibling.style.display = "block";
    selectYear.nextElementSibling.style.display = "none";
});

selectMonth.addEventListener("mouseenter", () => {
    selectMonth.nextElementSibling.style.display = "block";
    selectYear.nextElementSibling.style.display = "none";
});

for (let month of dropdownContent2) {
    month.addEventListener("mouseleave", () => {
        selectYear.nextElementSibling.style.display = "none";
        selectMonth.nextElementSibling.style.display = "none";
    })
    month.addEventListener("click", () => {
        selectMonth.innerText = month.innerText;
        selectMonth.nextElementSibling.style.display = "none";

        document.querySelector(".selected").classList.remove("selected");
        month.classList.toggle("selected");
    });

};





document.querySelector(".dropdown-content1").addEventListener("mouseover", () => {
    selectYear.nextElementSibling.style.display = "block";
    selectMonth.nextElementSibling.style.display = "none";
})

selectYear.addEventListener("mouseenter", () => {
    selectYear.nextElementSibling.style.display = "block";
    selectMonth.nextElementSibling.style.display = "none";
})

for (let year of dropdownContent1) {
    year.addEventListener("mouseleave", () => {
        selectYear.nextElementSibling.style.display = "none";
        selectMonth.nextElementSibling.style.display = "none";
    })
    year.addEventListener("click", () => {
        selectYear.innerText = year.innerText;
        selectYear.nextElementSibling.style.display = "none";
    });

}


document.getElementById("monthBefore").addEventListener("click", () => {
    const selectMonth = document.getElementById("selectMonth");
    if (selectMonth.innerText == "01월") {
        if (selectYear.innerText == "2022년") {
            alert("바나나마켓이 출시한 연도보다 이전 날짜를 조회할 수 없어요~ ^^*");
        } else {
            selectYear.innerText = (Number(selectYear.innerText.substring(0, 4)) - 1) + "년";
            selectMonth.classList.remove("selected");
            document.getElementById("month12").classList.add("selected");
            selectMonth.innerText = "12월";
        }
    } else {
        const el = document.getElementsByClassName("selected")[0];
        el.classList.toggle("selected");
        el.previousElementSibling.classList.toggle("selected");
        selectMonth.innerText = el.previousElementSibling.innerText;

    }

});

document.getElementById("monthAfter").addEventListener("click", () => {
    const selectMonth = document.getElementById("selectMonth");
    if (selectMonth.innerText == "12월") {
        if (selectYear.innerText == "2024년") {
            alert("조회할 수 없습니다");
        } else {
            selectYear.innerText = (Number(selectYear.innerText.substring(0, 4)) + 1) + "년";
            selectMonth.classList.remove("selected");
            document.getElementById("month1").classList.add("selected");
            selectMonth.innerText = "01월";
        }
    } else {
        const el = document.getElementsByClassName("selected")[0];
        el.classList.toggle("selected");
        el.nextElementSibling.classList.toggle("selected");
        selectMonth.innerText = el.nextElementSibling.innerText;

    }

});



/* 전체, 입금, 출금----------------------------------------------- */
const selectPayCtg = document.getElementsByClassName("payCtg2__div");

selectPayCtg[0].classList.add("ctgChecked");

selectPayCtg[0].addEventListener("click", () => {
    selectPayCtg[0].classList.add("ctgChecked");
    selectPayCtg[1].classList.remove("ctgChecked");
    selectPayCtg[2].classList.remove("ctgChecked");
});

selectPayCtg[1].addEventListener("click", () => {
    selectPayCtg[0].classList.remove("ctgChecked");
    selectPayCtg[1].classList.add("ctgChecked");
    selectPayCtg[2].classList.remove("ctgChecked");
});

selectPayCtg[2].addEventListener("click", () => {
    selectPayCtg[0].classList.remove("ctgChecked");
    selectPayCtg[1].classList.remove("ctgChecked");
    selectPayCtg[2].classList.add("ctgChecked");
});
