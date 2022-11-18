

const delMember = document.getElementsByClassName("delMember");
const count = document.getElementById("count");



(function(){count.innerText = delMember.length;}());



// 차단해제 버튼
const delAdm = document.getElementsByClassName("delAdm");

for(let member of delAdm) {
    member.addEventListener("click", e=>{
        member.parentElement.remove();

    });
}
