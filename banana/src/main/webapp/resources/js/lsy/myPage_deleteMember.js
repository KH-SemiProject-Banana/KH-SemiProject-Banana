

const delMember = document.getElementsByClassName("delMember");
const count = document.getElementById("count");



(function(){count.innerText = delMember.length;}());



// 차단해제 버튼
const blockCancel = document.getElementsByClassName("blockCancel");

for(let btn of blockCancel) {
    btn.addEventListener("click", e=>{

        if(confirm("정말 이 회원을 차단해제 하겠습니까?")){

            const blockedMemberNo = e.target.getAttribute("id");
            
            console.log(blockedMemberNo);
            console.log(loginMemberNo);

            

            $.ajax({

                url : "/member/myPage/memberBlockCancel",
                data : {"blockedMemberNo" : blockedMemberNo, "loginMemberNo" : loginMemberNo},
                type : "GET",
                success : (result) => {
                    if(result > 0) {
                        alert("회원 차단해제가 완료되었습니다");
                        e.target.parentElement.remove(); // 수정 필요
                    } else {
                        alert("회원 차단해제가 실패했습니다")
                    }
                },
                error : () => {console.log("회원 차단해제 중 오류 발생...");}
            })
        }



    });
}
