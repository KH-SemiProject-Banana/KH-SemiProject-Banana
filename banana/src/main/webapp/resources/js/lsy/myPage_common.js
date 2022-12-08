
//네번째 팝업 띄우기(프로필 팝업)
document.getElementById("profilePop").addEventListener("click",function(){
    
    document.getElementById("popup_layer4").style.display = "block";

})

//네번째 팝업 닫기
function closePop4() {

    document.getElementById("popup_layer4").style.display = "none";

}


//자기소개 수정하기 
const introUpdateBtn2 = document.getElementById("introUpdateBtn2");
const pIntro = document.getElementById("p_intro");

introUpdateBtn2.addEventListener("click", e => {
    // e.preventDefault();
    // console.log(e.target);
    const input = document.createElement("input");
    input.setAttribute("maxlength","40");
    input.setAttribute("placeholder","자기소개를 작성해주세요.");
    input.style.display = "block";
    input.value = pIntro.innerText;

    const changedBtn = document.createElement("p");
    changedBtn.setAttribute("id", "changedBtn");
    changedBtn.classList.add("changedBtn");
    changedBtn.innerText = "수정하기";


    pIntro.after(input); //after():선택한요소뒤에 컨텐츠삽입 - pIntro뒤에 input삽입
    introUpdateBtn2.after(changedBtn);
    pIntro.style.display = "none";
    

    
    input.classList.add("changed");
    introUpdateBtn2.style.display = "none";
    if(changedBtn.style.display == "none"){
        changedBtn.style.display = "block";
    }

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//자기소개 db에 수정된 거 넘기는 기능
    changedBtn.addEventListener("click",function(e){
        console.log(input.value);
        $.ajax({
            url : "/member/myPage/changeIntroduce",
            data : {"introduce":input.value},
            success:(result) => {
    
                if(result > 0){ //성공
                    // changedBtn.style.display = "none";
                    // if( introUpdateBtn2.style.display == "none"){
                    //     introUpdateBtn2.style.display= "block";
                    // }
                    changedBtn.remove();
                    input.remove();

                    pIntro.innerText = input.value;
                    pIntro.style.display = "block";
                    introUpdateBtn2.style.display = "block";
                    
                    
    
                } else { //실패
                    console.log("서버에 저장 실패");
                }
    
            },
            error : () => {console.log("동작에러남");},
            complete : () => { //success, error 수행여부 관계없이 무조건 수행
                console.log("아무때나 나타나는 친구");
            }
        });
    })
})

/* ****************************************************************** */
//------------------------------------------------------------------------------------------------------
// 프로필 수정

const profileImage =  document.getElementById("profile-image");
const deleteImage =  document.getElementById("delete-image");
const imageInput = document.getElementById("image-input");

// 초기 프로필 이미지 상태를 저장하는 변수
// (true : 업로드된 이미지가 있음, false : 기본 이미지 상태)
let initCheck; 

// 이미지가 업로드 되었거나 삭제되었음을 나타내는 변수
// (-1 : 초기값, 0 :프로필 삭제(X버튼 클릭), 1 : 새 이미지 업로드)
let deleteCheck = -1;



// 프로필 수정 페이지에 처음 들어왔을 때의 이미지 경로
const originalImage = profileImage.getAttribute("src"); 

// 프로필 수정 화면일 경우

if(imageInput != null){

    // 해당 화면 진입 시 프로필 이미지 상태를 저장(initCheck)
    if(profileImage.getAttribute("src") == "/resources/images/user.png"){

        // 기본 이미지인 경우
        initCheck = false;

    } else {
        
        initCheck = true;
    }

    //이미지가 선택되었을 때 미리보기

    // * input type = "file" 요소는 값이 없을 때는 ''(빈칸)이다.
    // * input type = "file" 요소는 이전에 선택한 파일이 있어도 취소하면 다시 ''(빈칸)이 된다.
    // * input type = "file" 요소로 파일을 선택하면 change 이벤트가 발생한다.

    imageInput.addEventListener("change", e => {

        //e.target : 이벤트가 발생한 요소 (==imageInput)
        // *화살표 함수에서는 this를 못쓰기 때문에...(this는 window 객체를 의미하기 때문....)
        //e.target을 쓴다.

        console.log(e.target.files); 
        
        // e.target.files -> 선택된 파일의 목록이 나온다. 
        // 근데 우리는 늘 1개만 선택하잖아. 그니까...목록 중에서 [0]이지...
        console.log(e.target.files[0]); 

        //-----------------------------------------------------------------------------------------
        
        //선택된 파일이 있을 경우(없으면 undefined 나옴...)
        if(e.target.files[0] != undefined){

            const reader = new FileReader(); 
            // 자바스크립트가 제공하는 객체 중에 FileReader라는 객체가 있음.
            // FileReader (file을 읽는 객체)
            // - 웹 애플리케이션이
            // 비동기적으로 데이터를 읽기 위하여
            // 읽을 파일을 가리키는 File 객체이다.
            // 쉽게 말해서 file을 읽는 객체임!
            
            // + 읽어들인 파일을 사용자 컴퓨터에 저장할 수 있다!

            reader.readAsDataURL(e.target.files[0]); //이걸 적는 순간 이제 실제로 파일을 읽어들인다....
            // FileReader.readAsDataURL("파일정보")
            // -> 지정된 파일을 읽기 시작함

            // FileReader.onload : 파일 읽기가 완료되었을 때...라는 고전이벤트 형식이래..그에 대한 응답 지정하는 형식
            reader.onload = event => {

                console.log(event.target);

                //  event.target.result : 읽어진 파일의 결과(실제 이미지 파일)의 경로
                event.target.result

                // img 태그의 src 속성으로 읽은 이미지 파일 경로를 추가
                // == 이미지 미리보기
                profileImage.setAttribute("src", event.target.result);

                deleteCheck = 1;
            } 

        } else { // 취소가 눌러진 경우 , 이전 이미지로 돌아가게 해볼게!

            //1) 처음 이미지 경로를 변수 지정해준다음에....
            //const originalImage = profileImage.getAttribute("src"); 라고 위에 씀.
            profileImage.setAttribute("src", originalImage);

        }
        

    })

    //x버튼이 클릭되었을 경우 -> 기본 이미지(화면 들어올 때의 이미지가 아니고 걍 아예 쌩처음이미지)로 변경하겠다!!!!!
    deleteImage.addEventListener("click", () =>{
        profileImage.setAttribute("src", "/resources/images/user.png");
        imageInput.value = "";
        deleteCheck = 0;
    })

}

function profileValidate(){


    //이미지가 없다가 -> 있음
    if(!initCheck && deleteCheck == 1){
        return true;
    }


    //이미지가 있었다가 -> x를 눌러서 없어짐.
    if(initCheck && deleteCheck == 0){
        return true;
    }
        
    //있음 -> 있음(새로운 이미지 업로드)
    if(initCheck && deleteCheck == 1){
        return true;
    }

    alert("이미지 변경 후 클릭하세요");
    return false;
}

// 차단관리
document.getElementById("editBlockMember").addEventListener("click", () => {
    location.href = "/member/myPage/editBlockMember";
});



























