
// 찜
const likeChk = document.getElementsByClassName("likeChk");

for(let i = 0; i < likeChk.length; i++) {
    likeChk[i].addEventListener("change", () => {
        // if(memberNo == "") {
        //     alert("로그인 후 이용해주세요.");
        //     likeChk[i].checked = false;
        //     location.href = "/member/login";
        //     return;
        // }
        
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

        // if (memberNo == sellerNo) {
        //     alert("자신의 게시글에는 찜할 수 없습니다.");
        //     likeChk[i].checked = false;
        //     return;
        // }

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

