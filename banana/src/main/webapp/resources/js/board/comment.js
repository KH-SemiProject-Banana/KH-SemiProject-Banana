function selectCommentList() {

    $.ajax({

        url : "/comment/list",
        data : {"boardNo" : boardNo},
        type : "GET",
        dataType : "JSON", // JSON형태의 문자열 응답 데이터를 JS 객체로 자동 반환
        success : function(rList){ // rList : 반환 받은 댓글 목록

            const commentList = document.getElementById("comment-list");
            commentList.innerHTML = "";

            for(let comment of rList){

                if(comment.commentDeleteFlag == 'Y'){

                    const commentRow = document.createElement("li");
                    commentRow.classList.add("comment-row");
                    // 답글인 경우 child-comment클래스 추가
                    if(comment.parentNo != 0) {
                        commentRow.classList.add("child-comment");
                    }

                    const commentContent = document.createElement("p");
                    commentContent.classList.add("comment-content");
                    commentContent.innerText = "삭제된 댓글입니다";

                    commentRow.append(commentContent);
                    commentList.append(commentRow);

                } else {

                    // 행
                    const commentRow = document.createElement("li");
                    commentRow.classList.add("comment-row");
                    // 답글인 경우 child-comment클래스 추가
                    if(comment.parentNo != 0) {
                        commentRow.classList.add("child-comment");
                    }
    
                    // 작성자
                    const commentWriter = document.createElement("p");
                    commentWriter.classList.add("comment-writer");
    
                    // 프로필 이미지
                    const profileImage = document.createElement("img");
                    if(comment.profileImage == null){
                        profileImage.setAttribute("src", "/resources/images/banana-logo.png");
                    } else{
                        profileImage.setAttribute("src", comment.profileImage);
                    }
    
    
                    // 닉네임
                    const memberNickname = document.createElement("span");
                    memberNickname.innerText = comment.memberNickname;
    
                    const nicknameLink = document.createElement("a");
                    nicknameLink.classList.add("nicknameLink");
                    nicknameLink.setAttribute("href", "#");
                    nicknameLink.append(memberNickname);
    
    
                    // 작성일
                    const commentCreateDate = document.createElement("span");
                    commentCreateDate.innerText = "(" + comment.commentCreateDate + ")";
    
                    commentWriter.append(profileImage, memberNickname, commentCreateDate);
    
                    // 댓글 내용
                    const commentContent = document.createElement("p");
                    commentContent.classList.add("comment-content");
                    commentContent.innerHTML = comment.commentContent;
    
                    commentRow.append(commentWriter, commentContent);
    
                    if(memberNo != ""){
                        const commentBtnArea = document.createElement("div");
                        commentBtnArea.classList.add("comment-btn-area");
    
                        const childCommentBtn = document.createElement("button");
                        childCommentBtn.setAttribute("onclick", "showInsertComment(" + comment.commentNo + ", this)");
                        childCommentBtn.innerText = "답글";
    
                        commentBtnArea.append(childCommentBtn);
    
                        if(memberNo == comment.memberNo) {
    
                            const updateBtn = document.createElement("button");
                            const deleteBtn = document.createElement("button");
                            updateBtn.innerText = "수정";
                            deleteBtn.innerText = "삭제";
                            updateBtn.setAttribute("onclick", "showUpdateComment(" + comment.commentNo + ", this)");
                            deleteBtn.setAttribute("onclick", "deleteComment(" + comment.commentNo + ")");
    
                            commentBtnArea.append(updateBtn, deleteBtn);
                        }
    
                        // 행에 버튼목록 추가
                        commentRow.append(commentBtnArea);
                    }
    
                    // 댓글목록(ul)에 행 추가
                    commentList.append(commentRow);

                }



            }
        },

        error : (req) => {
            console.log("에러 발생");
            console.log(req.responseText);
        }
    });
}


// -----------------------------------------------------------------------------------

// 댓글 등록
const addComment = document.getElementById("addComment");
const commentContent = document.getElementById("commentContent");

addComment.addEventListener("click", () =>{

    // 로그인이 되어있나?
    if(memberNo == ""){
        alert("로그인 후 이용해주세요");
        return;
    } 
    
    // 댓글 내용이 작성되어있나?
    if(commentContent.value.trim().length == 0) {
        alert("댓글을 작성한 후 버튼을 클릭해 주세요");
        commentContent.value = "";
        commentContent.focus();
        return;
    }

    // AJAX를 이용해서 댓글 내용 DB에 저장
    $.ajax({

        url : "/comment/insert",
        data : {"commentContent" : commentContent.value,
                "memberNo" : memberNo,
                "boardNo" : boardNo},
        type : "post",
        success : (result) => {

            if(result > 0) {
                alert("댓글이 등록되었습니다");

                commentContent.value = "";
                selectCommentList();
            } else {
                alert("댓글 등록에 실패했습니다");
            }
        },
        error : (req) => {
            console.log("댓글 등록 실패");
            console.log(req.responseText);
        }
    })
    
});


//-----------------------------------------------------------------
// 댓글 삭제
function deleteComment(commentNo) {

    if(confirm("정말로 삭제하시겠습니까?")){

        $.ajax({

            url : "/comment/delete",
            data : {"commentNo" : commentNo},
            type : "GET",
            success : (result) =>{

                if(result > 0) {
                    alert("삭제되었습니다");
                    selectCommentList();
                } else {
                    alert("삭제 실패");
                }
            },

            error : (req) => {
                console.log("댓글 삭제 실패");
                console.log(req.responseText);
            }
        })
    }
}

// comment_del_fl확인해서 y면 '삭제된 댓글입니다' 표시하기

//-----------------------------------------------------------------------
// 댓글 수정 화면 전환

let beforeCommentRow; // 수정 전 원래 행의 상태를 저장할 변수

function showUpdateComment(commentNo, btn){ // 댓글번호, 이벤트발생요소(수정버튼)

    // 댓글 수정이 한 개만 열릴 수 있도록 만들기
    const temp = document.getElementsByClassName("update-textarea");

    if(temp.length > 0) { // 수정이 한 개 이상 열려 있는 경우

        if(confirm("다른 댓글이 수정 중입니다. 현재 댓글을 수정하시겠습니까?")){

            temp[0].parentElement.innerHTML = beforeCommentRow;
            // 백업 내용으로 덮어씌워지면서 textarea 사라짐
        } else {
            return;
        }
    }


    // 1. 댓글 수정이 클릭된 행을 선택
    const commentRow = btn.parentElement.parentElement; // <div class="comment-btn-area">

    // 2. 행 내용 삭제 전 현재 상태를 저장(백업)
    // 전역변수 사용
    beforeCommentRow = commentRow.innerHTML;

    // 3. 댓글에 작성되어있던 내용만 얻어오기 -> 새롭게 생성된 textarea 추가될 예정
    let beforeContent = commentRow.children[1].innerHTML;

    // 4. 댓글 행 내부 내용을 모두 삭제
    commentRow.innerHTML = "";

    // 5. textArea 요소 생성 + 클래스 추가 + 내용 추가
    const textarea = document.createElement("textarea");
    textarea.classList.add("update-textarea");

    // XSS 방지 처리 해제
    beforeContent = beforeContent.replaceAll("&amp;", "&");
    beforeContent = beforeContent.replaceAll("&lt;", "<");
    beforeContent = beforeContent.replaceAll("gt;", ">");
    beforeContent = beforeContent.replaceAll("&quot;", "\"");

    // 개행문자 처리 해제
    beforeContent = beforeContent.replaceAll("<br>", "\n");

    // 내용 추가
    textarea.value = beforeContent;


    // 6. commentRow에 생성된 textarea 추가
    commentRow.append(textarea);

    // 7. 버튼 영역 + 수정/취소 버튼 생성
    const commentBtnArea = document.createElement("div");
    commentBtnArea.classList.add("comment-btn-area");

    const updateBtn = document.createElement("button");
    updateBtn.innerText = "수정";
    updateBtn.setAttribute("onclick", "updateComment(" + commentNo + ", this)");

    const cancelBtn = document.createElement("button");
    cancelBtn.innerText("취소");
    cancelBtn.setAttribute("onclick", "updateCancel(this)")

    // 8. 버튼영역에 버튼 추가 후 commentRow에 버튼영역 추가
    commentBtnArea.append(updateBtn, cancelBtn);
    commentRow.append(commentBtnArea);
}



/// 댓글 수정 취소
function updateCancel(btn){

    if(confirm("댓글 수정을 취소하겠습니까?")){
        btn.parentElement.parentElement.innerHTML = beforeCommentRow;
    }
}


// 댓글 수정(ajax)
function updateComment(commentNo, btn){

    // 새로 작성된 댓글 내용 얻어오기
    const commentContent = btn.parentElement.previousElementSibling.value;

    $.ajax({

        url : "/comment/update",
        data : {"commentNo" : commentNo, "commentContent" : commentContent},
        type : "POST",
        success : (result) => {
            if(result > 0) {
                alert("댓글이 수정되었습니다");
                selectCommentList();
            } else {
                console.log("댓글 수정 실패");
            }
        },
        error : (req) => {
            console.log("댓글 수정 중 에러 발생");
            console.log(req.responseText);
        }
    });
}


//