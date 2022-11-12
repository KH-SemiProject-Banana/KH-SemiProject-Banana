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

}


document.getElementById("chargeBtn").addEventListener("click", function(){
    payCharge.style.display = "block";
    payRefund.style.display = "none";
    payLog.style.display = "none";
});
document.getElementById("refundBtn").addEventListener("click", function(){
    payRefund.style.display = "block";
    payCharge.style.display = "none";
    payLog.style.display = "none";
});
document.getElementById("logBtn").addEventListener("click", function(){
    payLog.style.display = "block";
    payCharge.style.display = "none";
    payRefund.style.display = "none";
});

document.querySelector(".closeCharge").addEventListener("click", function(){
    payCharge.style.display = "none";
});
document.querySelector(".closeRefund").addEventListener("click", function(){
    payRefund.style.display = "none";
});
document.querySelector(".closeLog").addEventListener("click", function(){
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
    
    document.getElementsByClassName("charge1")[0].addEventListener("click", function(){
        chargePrice.value = Number(chargePrice.value) + Number(10000);
    });
    document.getElementsByClassName("charge5")[0].addEventListener("click", function(){
        chargePrice.value = Number(chargePrice.value) + Number(50000);
    });
    document.getElementsByClassName("charge10")[0].addEventListener("click", function(){
        chargePrice.value = Number(chargePrice.value) + Number(100000);
    });
// }

// if(payRefund.style.display != "none"){
    
    document.getElementsByClassName("charge1")[1].addEventListener("click", function(){
        refundPrice.value = Number(refundPrice.value) + Number(10000);
    });
    document.getElementsByClassName("charge5")[1].addEventListener("click", function(){
        refundPrice.value = Number(refundPrice.value) + Number(50000);
    });
    document.getElementsByClassName("charge10")[1].addEventListener("click", function(){
        refundPrice.value = Number(refundPrice.value) + Number(100000);
    });
    
    document.getElementById("chargeAll").addEventListener("click", function(){    
        refundPrice.value = payRemain.innerText;
    });
// }



// 금액 초기화
const resetPrice = document.getElementsByClassName("resetPrice");
resetPrice[0].addEventListener("click", function(){
    chargePrice.value = 0;
});
resetPrice[1].addEventListener("click", function(){
    refundPrice.value = 0;
});



// 직접입력 input버튼에 콤마 구현, 유효성 검사
refundPrice.addEventListener("input", function(){



    const refundMessage = document.getElementById("refundMessage");

    if(refundPrice.value.trim().length == 0){
        refundMessage.innerText = "숫자만 입력해주세요";
        refundMessage.value = 0;
        refundMessage.classList.remove("error", "confirm");

        refundFlag = false;
        return;
    }

    const regEx = /^[0-9]{1,7}$/;
    const regEx2 = /^[0-9]{8,}$/;



    if(regEx.test(refundPrice.value)){ // 유효한 경우

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
}
);



chargePrice.addEventListener("input", function(){



    const chargeMessage = document.getElementById("chargeMessage");

    if(chargePrice.value.trim().length == 0){
        chargeMessage.innerText = "숫자만 입력해주세요";
        chargeMessage.value = 0;
        chargeMessage.classList.remove("error", "confirm");

        chargeFlag = false;
        return;
    }

    const regEx = /^[0-9]{1,7}$/;
    const regEx2 = /^[0-9]{8,}$/;



    if(regEx.test(chargePrice.value)){ // 유효한 경우

        chargePrice.value = Number(chargePrice.value);

        chargeMessage.innerText = "유효한 형식입니다(숫자)";
        chargeMessage.classList.remove("error");
        chargeMessage.classList.add("confirm");

        chargeFlag = true;


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
}
);








//충전하기
document.getElementById("chargeSubmitBtn").addEventListener("click", function(e){

    if(!chargeFlag){

        if(chargePrice.value == 0){
            alert("0원을 충전할 수 없습니다. 금액을 입력해주세요");
            chargePrice.value = Number(0);
            chargePrice.focus();
            e.preventDefault();
            return;
        }
        if(chargePrice.value % 10000 != 0){
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
document.getElementById("refundSubmitBtn").addEventListener("click", function(e){

    if(refundPrice.value == 0){
        alert("0원을 환불할 수 없습니다. 환불할 금액을 입력해주세요");
        refundPrice.value = Number(0);
        refundPrice.focus();
        e.preventDefault();
        return;
    }
    if(refundPrice.value - payRemain.innerText > 0){
        alert("현재 잔액보다 더 큰 금액을 환불할 수 없습니다.");
        refundPrice.value = Number(0);
        refundPrice.focus();
        e.preventDefault();
        return;
    }

});



/* -------------------------------------------------------------------- */
// 내 페이 사용내역

