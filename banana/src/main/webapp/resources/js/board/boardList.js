
// 글쓰기 버튼

(() => {

    const insertBtn = document.getElementById("insertBtn");

    if (insertBtn != null) {


        (insertBtn.addEventListener("click", e => {

            if (loginMember != "") {

                location.href = "/write/" + boardCode;

            } else {

                alert("로그인 후 이용해주세요");
            }
        }));

    }



})();

