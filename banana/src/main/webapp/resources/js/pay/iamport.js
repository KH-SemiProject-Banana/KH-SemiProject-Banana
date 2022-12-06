// 팝업
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
    payCharge.style.display = "none";
    payRefund.style.display = "none";

    // payLogList();
}

document.getElementById("selectYear").addEventListener("change", () => {
    payLogList();
})

document.getElementById("selectMonth").addEventListener("change", () => {
    payLogList();
})

const payMain = document.getElementsByClassName("payMain")[0];

// 조회
const payLogList = () => {
    $.ajax({
        url : "/searchPayLogList",
        data : {"memberNo" : memberNo,
                "selectYear" : selectYear.innerText,
                "selectMonth" : selectMonth.innerText},
        type : "GET",
        async : false,
        success : (result) => {
            // result == payLogList
            let monthDay = "";

            for(let item of result) {
                if(monthDay != item.monthDay) {
                    payMain.innerHTML += "<div class='monthDateArea'>" + item.monthDay + "</div>";
                    monthDay = item.monthDay;
                }

                payMain.innerHTML += "<div class='useDetail'>"
                                   + "<div class='useDetail__title'>"
                                   + "<p>" + item.status + "</p>"
                                   + "<p>" + item.orderDate + "</p>"
                                   + "</div>"
                                   + "<div class='useDetail__money moneyPlus'>" + item.usePoint + "</div>"
                                   + "</div>"; 
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
                            payRemain.innerText = Number(payRemain.innerText) + Number(chargePrice.value);
                            chargePrice.value = "";
                            alert("결제가 완료되었습니다.\n결제한 금액 : " + price);

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
                        payRemain.innerText = Number(payRemain.innerText) - Number(refundPrice.value);
                        refundPrice.value = "";
                        alert("환불이 완료되었습니다.\n환불한 금액 : " + price);

                    } else {
                        alert("환불 중 오류가 발생했습니다.");
                    }
                },
                error : () => {alert("환불 중 오류가 발생했습니다.");}
            });

        } else {alert("환불이 취소되었습니다.");}

    } else {return;}
})