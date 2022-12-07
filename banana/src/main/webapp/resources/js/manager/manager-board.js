
// 정렬
const order = document.getElementById("order");
const orderInput = document.getElementById("orderInput");

const orderBy = () => {

    switch(order.value){
        case "order1" : orderInput.value = 1; break;
        case "order2" : orderInput.value = 2; break;
        case "order3" : orderInput.value = 3; break;
        case "order4" : orderInput.value = 4; break;
    }

    document.getElementById("frmSearchBase").submit();
};


// 게시글 삭제
const btnDel = document.getElementsByClassName("btnDel");
for(let btn of btnDel) {

    btn.addEventListener("click", e => {

        const boardNo = e.target.getAttribute("id");
        
        if(confirm("정말 게시글을 삭제하시겠습니까?")){

            $.ajax({

                url : "/manager/boardDelete",
                data : {"boardNo": boardNo},
                type : "get",
                success : (result) => {
                    if(result > 0) {
                        alert("게시글이 삭제되었습니다");
                        document.getElementById("frmSearchBase").submit();
                    } else {
                        alert("게시글 삭제 실패");
                    }
                }, 
                error : () => {console.log("게시글 삭제 중 에러 발생");}

            })
        }
    });
}


// 상품 삭제 취소
const btnDelBack = document.getElementsByClassName("btnDelBack");
for(let btn of btnDelBack) {

    btn.addEventListener("click", e => {

        const boardNo = e.target.getAttribute("id");
        
        if(confirm("정말 상품 정보를 복구하시겠습니까?")){

            $.ajax({

                url : "/manager/boardDeleteBack",
                data : {"boardNo": boardNo},
                type : "get",
                success : (result) => {
                    if(result > 0) {
                        alert("게시글이 복구되었습니다");
                        document.getElementById("frmSearchBase").submit();
                    } else {
                        alert("게시글 복구 실패");
                    }
                }, 
                error : () => {console.log("게시글 복구 중 에러 발생");}

            })
        }
    });
}