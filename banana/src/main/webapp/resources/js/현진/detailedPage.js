// 슬라이드
let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");

  if (n > slides.length) {slideIndex = 1}

  if (n < 1) {slideIndex = slides.length}

  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }

  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }

  slides[slideIndex-1].style.display = "block"; 
  dots[slideIndex-1].className += " active";
}

// 찜
const like = document.getElementById("like");

like.addEventListener("change", () => {
  if(memberNo == "") {
    alert("로그인 후 이용해주세요.");
    like.checked = false;
    location.href = "/member/login";
    return;
  }

  if(memberNo == sellerNo) {
    alert("자신의 게시글에는 찜할 수 없습니다.");
    like.checked = false;
    return;
  }

  const iconChange = document.getElementsByClassName("icon-change")[0];
  const likeCount = document.getElementById("likeCount");

  if(like.checked) {
    $.ajax({
      url : "/goodsLikeUp",
      data : {"goodsNo" : goodsNo, "memberNo" : memberNo},
      type : "GET",
      success : (result) => {
        if (result > 0) {
          iconChange.classList.add("fa-heart-circle-check");
          iconChange.classList.remove("fa-heart-circle-plus");
          likeCount.innerText = Number(likeCount.innerText) + 1;
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
            iconChange.classList.add("fa-heart-circle-plus");
            iconChange.classList.remove("fa-heart-circle-check");
            likeCount.innerText = Number(likeCount.innerText) - 1;
            alert("찜 목록에서 삭제되었습니다.");
          } else {
            console.log("취소 실패");
          }
        },
        error : () => {console.log("취소 에러");}
    });
  }
})

// 본인과 바나나톡 X
document.getElementsByClassName("like_talk")[0].addEventListener("submit", event => {
  if(memberNo == sellerNo) {
    alert("본인과 바나나톡을 할 수 없습니다.");
    event.preventDefault();
    return;
  }
});

// 검색어 남기기
if(query != null) {
  document.getElementById("query").value = query;
}

// 게시글 삭제 + 게시글 수정
if(memberNo == sellerNo){
  document.getElementById("goodsDelete").addEventListener("click", () => {
    if(confirm("정말 삭제하시겠습니까?")) {
      $.ajax({
        url : "/goods/delete",
        data : {"goodsNo" : goodsNo},
        type : "GET",
        success : (result) => {
          alert("삭제되었습니다.");
          location.href = "/category?categoryNo=" + categoryNo;
        }
      });
    } else {
      alert("삭제가 취소되었습니다.");
    }
  })
}

// 판매자 마이 페이지 이동
const sellerPage = document.getElementsByClassName("sellerPage");

for(let item of sellerPage) {
  item.addEventListener("click", () => {
    const seller = document.getElementsByClassName("seller")[0];
    seller.action = "/member/myPage/yourPageMain?myPageCt=1";
    seller.submit();
  })
}