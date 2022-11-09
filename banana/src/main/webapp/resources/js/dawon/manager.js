
    




var btnDel =document.querySelector('.btnDel').addEventListener('click', isDelete);
function isDelete() {
    if(confirm("정말로 삭제하시겠습니까?")) {
        // 회원 삭제 코드
    } else {
        // 이전으로 돌아가기
    }
}