//팝업 띄우기
function openPop() {
    document.getElementById("popup_layer").style.display = "block";

}


// 충전 버튼
document.getElementById("chargeBtn").addEventListener("click", function(){

    document.getElementById("bananaPay").style.display = "block";
});



document.querySelector(".closePay").addEventListener("click", function(){
    
});







//팝업 닫기
function closePop() {
    document.getElementById("popup_layer").style.display = "none";
}

const chargePrice = document.getElementById("chargePrice");
chargePrice.value = Number(0);

document.getElementById("charge1").addEventListener("click", function(){
    chargePrice.value = Number(chargePrice.value) + Number(1);
});
document.getElementById("charge5").addEventListener("click", function(){
    chargePrice.value = Number(chargePrice.value) + Number(5);
});
document.getElementById("charge10").addEventListener("click", function(){
    chargePrice.value = Number(chargePrice.value) + Number(10);
});



