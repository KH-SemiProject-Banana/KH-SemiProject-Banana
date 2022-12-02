const likeChk = document.getElementsByClassName("likeChk");

for (let i = 0; i < likeChk.length; i++) {

    const goodsNo = likeChk[i].value;

    likeChk[i].addEventListener("click", () => {

        if (memberNo == "") {
            alert("로그인 후 이용해주세요.");
            likeChk[i].checked = false;
            location.href = "/member/login";
            return;
        }

        const goodsNo = likeChk[i].value;

        if (likeChk[i].checked) {
            $.ajax({
                url: "/goodsLikeUp",
                data: { "goodsNo": goodsNo, "memberNo": memberNo },
                type: "GET",
                success: (result) => {
                    if (result > 0) {
                        alert("찜 목록에 추가되었습니다.");
                    } else {
                        console.log("좋아요 실패");
                    }
                },
                error: () => { console.log("좋아요 에러"); }
            });

        } else {
            $.ajax({
                url: "/goodsLikeDown",
                data: { "goodsNo": goodsNo, "memberNo": memberNo },
                type: "GET",
                success: (result) => {
                    if (result > 0) {
                        alert("찜 목록에서 삭제되었습니다.");
                    } else {
                        console.log("취소 실패");
                    }
                },
                error: () => { console.log("취소 에러"); }
            });
        }
    })
}