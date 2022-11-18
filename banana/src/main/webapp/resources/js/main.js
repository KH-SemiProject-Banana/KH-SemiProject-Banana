let slide = document.getElementsByClassName("slide");


for(let i = 0; i < slide.length; i++){

    setTimeout(function(){

        slide[i].addEventListener("change", function(){
            if(slide.checked){
                
                slide.checked = false;
                
                slide[i+1].checked = true;
            }
        
        });
    
        if(i == slide.length-1){i = 0}

    }, 5000);

    

}


const favoriteImg = document.getElementsByClassName("favorite__img");
const favoritePrice = document.getElementsByClassName("favorite__price");
const favoriteHeart = document.getElementsByClassName("favorite__heart");
const favoriteTitle = document.getElementsByClassName("favorite__title");


// 페이지 로드되자마자 실행 + 60초마다 실행
selectFavorite();

function selectFavorite(){

    $.ajax({
        url: "/goods/selectFavorite",
        type: "POST",
        dataType: "JSON",
        success: (favoriteGoods) => {
            if(favoriteGoods != null){
                for(let i = 0; i < 5; i++){
                    favoriteImg[i].setAttribute("src", favoriteGoods[0].imagePath)
                    favoritePrice[i].innerText = favoriteGoods[0].sellPrice + "원";
                    favoriteHeart[i].setAttribute("checked",favoriteGoods[0].isLike);
                    favoriteTitle[i].innerText = favoriteGoods[0].title;
                }
            }
        },
        error: () => {
            console.log("데이터 가져오기 실패");
        }
    });
}


















// ajax로  인기상품 조회
// const favorite = document.getElementsByClassName("favorite");

// const heart = document.createElement("i");
// heart.classList.add("fa-solid, fa-heart-circle-plus");

// const label = document.createElement("label");
// label.setAttribute("for", "heart1");
// label.append(heart);

// const input = document.createElement("input");
// input.setAttribute("type", "checkbox");
// input.setAttribute("name", "heart");
// input.setAttribute("id", "heart1");

// const favoriteHeartDiv = document.createElement("div");
// favoriteHeartDiv.classList.add("favorite__heart");

// favoriteHeartDiv.append(input);
// favoriteHeartDiv.append(label);

// const favoritePriceDiv = document.createElement("div");


