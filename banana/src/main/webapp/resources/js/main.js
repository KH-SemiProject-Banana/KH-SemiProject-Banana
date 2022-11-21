
// main-add 실행?? 해야함!
// let slide = document.getElementsByClassName("slide");


// for(let i = 0; i < slide.length; i++){

//     setTimeout(function(){

//         slide[i].addEventListener("change", function(){
//             if(slide.checked){
                
//                 slide.checked = false;
                
//                 slide[i+1].checked = true;
//             }
        
//         });
    
//         if(i == slide.length-1){i = 0}

//     }, 5000);

    

// }


const heartList = document.getElementsByClassName("fa-heart-circle-plus");

for(let heart of heartList){

    const goodsNo = heart.nextElementSibling;

    heart.addEventListener("click", e => {

        // 로그인하지 않은 상태
        if(loginMember != null){
            alert("로그인 후 이용해 주세요");
            return;
        }

        // 로그인 상태 + 좋아요 상태가 아닌 경우
        if(!e.target.classList.contains("choose")){

            
            $.ajax({
                
                url : "/goods/like/up",
                data : {"goodsNo" : goodsNo, "memerNo" : memberNo},
                type : "GET",
                success : (result) => {
                    
                    if(result > 0) {
                        
                        e.target.classList.add("choose");

                    } else {
                        console.log("증가 실패");
                    }
                },
                error : () => {console.log("증가 중에 에러 발생");}

            });

        } else { // 로그인 상태 + 좋아요 상태

            $.ajax({

                url : "/goods/like/up",
                data : {"goodsNo" : goodsNo, "memberNo" : memberNo},
                type : "GET",
                success : (result) => {
                    if(result > 0) {

                        e.target.classList.remove("choose");
                    } else {
                        console.log("감소 실패");
                    }
                },
                error : () => {console.log("감소 중 에러 발생");}
            })


        }
    })
}
