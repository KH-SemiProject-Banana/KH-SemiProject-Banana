


switch(mannerCt){
    case 1: document.getElementById("side1").style.fontWeight = "bold";
    const divG0 = document.querySelector(".goodBadBox");
    divG0.innerHTML="";//초기화

    const divG1 = document.createElement("div");
    divG1.classList.add("mainGood");
    divG1.setAttribute("id","mainGood");

    const divG2 = document.createElement("div");
    divG2.classList.add("main_title","myodong");

    const divG2_1div = document.createElement("div");

    const divG2_1div_i = document.createElement("i");
    divG2_1div_i.classList.add("fa-regular","fa-face-smile-beam","imo");

    const divG2_2p = document.createElement("p");
    divG2_2p.innerText="받은 매너 칭찬"

    divG0.append(divG1);
    divG1.append(divG2);
    divG2.append(divG2_1div,divG2_2p);
    divG2_1div.append(divG2_1div_i);
    break;

    case 2: 
    const div0 = document.querySelector(".goodBadBox");
    div0.innerHTML="";//초기화
    
    const div1 = document.createElement("div");
    div1.classList.add("mainBad");
    div1.setAttribute("id","mainBad");

    const div2 = document.createElement("div");
    div2.classList.add("main_title")


    const div2_1 = document.createElement("div");

    const div2_1_i = document.createElement("i");
    div2_1_i.classList.add("fa-regular","fa-face-angry","imo");

    const div2_2p = document.createElement("p");
    div2_2p.innerText="받은 비매너 후기"

    const div2_3div = document.createElement("div");
    div2_3div.classList.add("lightbulb");

    const div2_3div_i = document.createElement("i");
    div2_3div_i.classList.add("fa-regular","fa-lightbulb");
    div2_3div_i.setAttribute("id","lightbulb");

    const div2_3div_div = document.createElement("div");
    div2_3div_div.classList.add("lightbulb_inner");
    div2_3div_div.setAttribute("id","lightbulb_inner");

    const div2_3div_div_div = document.createElement("div");

    const p1 = document.createElement("p");
    p1.innerText="참고사항"
    const p2 = document.createElement("p");
    p2.innerText="- 받은 비매너 내역은 나에게만 보입니다."
    const p3 = document.createElement("p");
    p3.innerText="- 매너 온도가 올라가는 경우 (가산점 높은 순)"
    const p4 = document.createElement("p");
    p4.innerText="1. 거래 상대에게 받은 긍정 거래 후기"
    const p5 = document.createElement("p");
    p5.innerText="2. 거래 상대에게 받은 매너 칭찬"
    const p6 = document.createElement("p");
    p6.innerText="3. 대화 상대에게 받은 매너 칭찬"
    const p7 = document.createElement("p");
    p7.innerText="- 매너 온도가 내려가는 경우 (감산점 높은 순)"
    const p8 = document.createElement("p");
    p8.innerText="1. 이용정지 징계"
    const p9 = document.createElement("p");
    p9.innerText="2. 거래 상대의 비매너 평가"
    const p10 = document.createElement("p");
    p10.innerText="3. 대화 상대의 비매너 평가"


    div0.append(div1);
    div1.append(div2);
    div2.append(div2_1,div2_2p,div2_3div);
    div2_1.append(div2_1_i,);
    div2_3div.append(div2_3div_i,div2_3div_div);
    div2_3div_div.append(div2_3div_div_div);
    div2_3div_div_div.append(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10);


    break;
}

const mainGoodOn=()=>{
    const div0 = document.querySelector(".goodBadBox");
    div0.innerHTML="";//초기화

    const div1 = document.createElement("div");
    div1.classList.add("mainGood");
    div1.setAttribute("id","mainGood");

    const div2 = document.createElement("div");
    div2.classList.add("main_title")

    const div2_1div = document.createElement("div");

    const div2_1div_i = document.createElement("i");
    div2_1div_i.classList.add("fa-regular","fa-face-smile-beam","imo");

    const div2_2p = document.createElement("p");
    div2_2p.innerText="받은 매너 칭찬"

    div0.append(div1);
    div1.append(div2);
    div2.append(div2_1div,div2_2p);
    div2_1div.append(div2_1div_i);



}


const mainBadOn=()=>{

    const div0 = document.querySelector(".goodBadBox");
    div0.innerHTML="";//초기화
    
    const div1 = document.createElement("div");
    div1.classList.add("mainBad");
    div1.setAttribute("id","mainBad");

    const div2 = document.createElement("div");
    div2.classList.add("main_title")


    const div2_1 = document.createElement("div");

    const div2_1_i = document.createElement("i");
    div2_1_i.classList.add("fa-regular","fa-face-angry","imo");

    const div2_2p = document.createElement("p");
    div2_2p.innerText="받은 비매너 후기"

    const div2_3div = document.createElement("div");
    div2_3div.classList.add("lightbulb");

    const div2_3div_i = document.createElement("i");
    div2_3div_i.classList.add("fa-regular","fa-lightbulb");
    div2_3div_i.setAttribute("id","lightbulb");

    const div2_3div_div = document.createElement("div");
    div2_3div_div.classList.add("lightbulb_inner");
    div2_3div_div.setAttribute("id","lightbulb_inner");



    div0.append(div1);
    div1.append(div2);
    div1.append(div2_1,div2_2p,div2_3div);
    div2_1.append(div2_1_i,);
    div2_3div.append(div2_3div_i,div2_3div_div);









}


















// // 좋아요 클릭 시
// document.getElementById("side1").addEventListener("click",function(){
//     mainGood.setAttribute("id","mainGood")
//     mainBad.setAttribute("id","")
//     // 좋아요가 보일 시 
//     if( document.getElementById("mainGood").style.display == 'block') {
        
//         document.getElementById("mainBad").style.display = 'none';
//         document.getElementById("lightbulb_inner").style.display = 'none';
//         document.getElementById("mainGood").style.display = 'block';

//     }else{ // 좋아요가 안보일 시 
//         document.getElementById("mainBad").style.display = 'none';
//         document.getElementById("lightbulb_inner").style.display = 'none';
//         document.getElementById("mainGood").style.display = 'block';
//     }
    
    
// })

// // 나뻐요 클릭 시 
// document.getElementById("side2").addEventListener("click",function(){
//     mainGood.setAttribute("id","")
//     mainBad.setAttribute("id","mainBad")
//     // 나뻐요가 보일 시 
//     if(document.getElementById("mainBad").style.display == 'block'){
//         document.getElementById("mainBad").style.display = 'block';
//         document.getElementById("lightbulb_inner").style.display = 'block';
//         document.getElementById("mainGood").style.display = 'none';

//     } else { // 나뻐요가 안보일 시 
//         document.getElementById("mainBad").style.display = 'block';
//         document.getElementById("lightbulb_inner").style.display = 'block';
//         document.getElementById("mainGood").style.display = 'none';
//     }

// })

const inner = document.getElementById("lightbulb_inner");
inner.style.display = 'none';
document.getElementById("lightbulb").addEventListener("click",function(){
    if(inner.style.display == 'none'){
        inner.style.display = 'block';
    } else {
        inner.style.display = 'none';
    }

})

// 화면 어디를 클릭하든
document.addEventListener("click",function(e){

    
    if(e.target.classList.contains("fa-lightbulb")){
        return;
    }

    document.getElementById("lightbulb_inner").style.display='none';

})


document.getElementById("back").addEventListener("click",function(){
    alert("안녕");
    window.history.back();
})

