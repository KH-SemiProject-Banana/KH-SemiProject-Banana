// 팝업
const payLL = document.getElementById("payLL");
let remainPay;

function openPop5() {
    document.getElementById("popup_layer").style.display = "block";
    const payRemain = document.getElementById("payRemain");

    $.ajax({
    url : "/searchRemainPay",
    data : {"memberNo" : memberNo},
    type : "GET",
    async : false,
    success : (result) => {
        remainPay = result;
        payRemain.innerText = result.toLocaleString();
    },
    error : () => {console.log("바나나페이 조회 실패");}
    });

    payLog.style.display = "block";
    payCharge.style.display = "none";
    payRefund.style.display = "none";

    payLogList(order);
    chargeMe();
    refundMe();
}

// selectYear, selectMonth 변화 감지
var observer = new MutationObserver(mutations => {
    mutations.forEach(mutation => {
        payLogList(order);
    });
});

var config = {
    childList: true,
    attributes: true,
    characterData: true,
    subtree: false,
    attributeOldValue: false,
    characterDataOldValue: false
};

observer.observe(selectYear, config);
observer.observe(selectMonth, config);

// 조회
const payLogList = order => {
    $.ajax({
        url : "/searchPayLogList",
        data : {"memberNo" : memberNo,
                "selectYear" : selectYear.innerText,
                "selectMonth" : selectMonth.innerText,
                "order" : order},
        type : "GET",
        success : (result) => {
            payLL.innerHTML = "";
            let monthDay = "";
            let payText = "";

            for(let item of result) {
                if(monthDay != item.monthDay) {
                    payLL.innerHTML += "<div class='monthDateArea'>" + item.monthDay + "</div>";
                    monthDay = item.monthDay;
                }

                payText = "<div class='useDetail'>"
                        + "<div class='useDetail__title'>"
                        + "<p>" + item.status + "</p>"
                        + "<p>" + item.orderDate + "</p>"
                        + "</div>";

                if(item.usePoint > 0 ) {
                    payLL.innerHTML += payText
                                     + "<div class='useDetail__money moneyPlus'>+" + item.usePoint.toLocaleString() + "</div>"
                                     + "</div>";
                                     
                } else {
                    payLL.innerHTML += payText
                                     + "<div class='useDetail__money'>" + item.usePoint.toLocaleString() + "</div>"
                                     + "</div>";
                }
            }

            if(payLL.innerHTML == "") {
                payLL.innerHTML += "<div class='noList'>조회 결과가 없습니다.</div>"
            }
        },
        error : () => {console.log("바나나페이 조회 실패");}
        });
}

// 결제
var IMP = window.IMP;
IMP.init("imp06652703");

document.getElementById("chargeSubmitBtn").addEventListener("click", () => {
    if(chargeFlag) {
        const chargePrice = document.getElementById("chargePrice");
        let orderNo;
        
        $.ajax({
            url : "/searchOrderNo",
            type : "GET",
            async : false,
            success : (result) => {
                orderNo = result;
            },
            error : () => {console.log("주문번호를 가져오지 못했습니다.");}
        });

        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid: orderNo,
            name : '바나나페이 포인트 결제',
            amount : Number(chargePrice.value),
            buyer_email : buyerEmail,
            buyer_name : buyerName,
            buyer_tel : memberTel,
            buyer_addr : memberAddress,
        }, function(rsp) {
            if(rsp.success) {
                $.ajax({
                    url : "/payHistory",
                    data : {"memberNo" : memberNo,
                            "inputPrice" : Number(chargePrice.value)},
                    type : "POST",
                    success : (result) => {
                        if(result > 0) {
                            const price = Number(chargePrice.value).toLocaleString();
                            remainPay = remainPay + Number(chargePrice.value);
                            payRemain.innerText = remainPay.toLocaleString();
                            chargeMe();
                            alert("결제가 완료되었습니다.\n결제한 금액 : " + price + "원");

                        } else {
                            alert("결제 중 오류가 발생했습니다.");
                        }
                    },
                    error : () => {alert("결제 중 오류가 발생했습니다.");}
                });

            } else {alert("결제가 취소되었습니다.");}
        });

    } else {return;}
})

// 환불
document.getElementById("refundSubmitBtn").addEventListener("click", () => {
    if(refundFlag) {
        if(confirm("정말 환불하시겠습니까?")) {
            const refundPrice = document.getElementById("refundPrice");

            $.ajax({
                url : "/payHistory",
                type : "POST",
                data : {"memberNo" : memberNo,
                        "inputPrice" : Number(refundPrice.value) * (-1)},
                success : (result) => {
                    if(result > 0) {
                        const price = Number(refundPrice.value).toLocaleString();
                        remainPay = remainPay - Number(refundPrice.value);
                        payRemain.innerText = remainPay.toLocaleString();
                        refundMe();
                        alert("환불이 완료되었습니다.\n환불한 금액 : " + price + "원");

                    } else {
                        alert("환불 중 오류가 발생했습니다.");
                    }
                },
                error : () => {alert("환불 중 오류가 발생했습니다.");}
            });

        } else {alert("환불이 취소되었습니다.");}

    } else {return;}
})