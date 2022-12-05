const order = document.getElementById("orderBy");
const order1 = document.getElementById("order1");

const orderBy = () => {

    switch(order.value){
        case "order1" : order1.setAttribute("value", 1); break;
        case "order2" : order1.setAttribute("value", 2); break;
        case "order3" : order1.setAttribute("value", 3); break;
        case "order4" : order1.setAttribute("value", 4); break;
    }

    document.getElementById("frmSearchBase").submit();
};


// 회원정보 수정
const btnModify = document.getElementsByClassName("btnModify");

for(let btn of btnModify){

    btn.addEventListener("click", e => {

        

        const memberInfo = e.target.getAttribute("id");

        let editMemberNo = memberInfo.split("||")[0];
        let editMemberNickname = memberInfo.split("||")[1];
        let editMemberName= memberInfo.split("||")[2];
        let editMemberBirth = memberInfo.split("||")[3];
        let editMemberTel = memberInfo.split("||")[4];

        const memberNickname = document.getElementById("memberNickname");
        const memberName = document.getElementById("memberName");
        const memberBirth = document.getElementById("memberBirth");
        const memberTel = document.getElementById("memberTel");

        memberNickname.value = editMemberNickname;
        memberName.value = editMemberName;
        memberBirth.value = editMemberBirth;
        memberTel.value = editMemberTel;

        openPop();

        document.getElementsByClassName("SignUp")[0].addEventListener("click", () => {

            editMemberNickname = document.getElementById("memberNickname").value;
            editMemberName = document.getElementById("memberName").value;
            editMemberBirth = document.getElementById("memberBirth").value;
            editMemberTel = document.getElementById("memberTel").value;


            $.ajax({

                url : "/manager/managerEdit",
                data : {"memberNo" : editMemberNo, "memberNickname" : editMemberNickname,
                    "memberName" : editMemberName, "memberBirth" : editMemberBirth, "memberTel" : editMemberTel},
                type : "get",
                success : result => {
                    if(result > 0) {
                        alert("회원 정보가 수정되었습니다");
                        closePop();
                        document.getElementById("frmSearchBase").submit();

                    } else {
                        alert("회원 정보 수정 실패");
                        closePop();
                    }
                },
                error  : () => {alert("회원 정보 수정 중 오류 발생")}
            })
        });

        

    });
}


// 회원정보 삭제
const btnDel = document.getElementsByClassName("btnDel");
for(let btn of btnDel) {

    btn.addEventListener("click", e => {

        const memberNo = e.target.getAttribute("id");
        
        if(confirm("정말 회원 정보를 삭제하시겠습니까?")){

            $.ajax({

                url : "/manager/memberDelete",
                data : {"memberNo": memberNo},
                type : "get",
                success : (result) => {
                    if(result > 0) {
                        alert("회원 정보가 삭제되었습니다");
                        document.getElementById("frmSearchBase").submit();
                    } else {
                        alert("회원 정보 삭제 실패");
                    }
                }, 
                error : () => {console.log("회원 정보 삭제 중 에러 발생");}

            })
        }
    });
}

// 회원정보 삭제
const btnBlock = document.getElementsByClassName("btnBlock");
for(let btn of btnBlock) {

    btn.addEventListener("click", e => {

        const memberNo = e.target.getAttribute("id");
        
        if(confirm("정말 회원을 차단하시겠습니까?")){

            $.ajax({

                url : "/manager/memberBlock",
                data : {"memberNo": memberNo},
                type : "get",
                success : (result) => {
                    if(result > 0) {
                        alert("회원이 차단되었습니다");
                        document.getElementById("frmSearchBase").submit();
                    } else {
                        alert("회원 차단 실패");
                    }
                }, 
                error : () => {console.log("회원 차단 중 에러 발생");}

            })
        }
    });
}


//팝업 띄우기
function openPop() {
    document.getElementById("popup_layer").style.display = "block";

}

// 팝업 닫기
function closePop() {
    document.getElementById("popup_layer").style.display = "none";
}