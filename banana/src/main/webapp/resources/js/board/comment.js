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
                if(comment.profileImage != null){
                    profileImage.setAttribute("src", "/resources/images/banana-logo.png");
                } else{
                    profileImage.setAttribute("src", comment.profileImage);
                }


                // 닉네임
                const memberNickname = document.createElement("span");
                memberNickname.innerText = comment.nickname;

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

                commentRow.append(commentWriter. commentContent);

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
        },

        error : (req) => {
            console.log("에러 발생");
            console.log(req.responseText);
        }
    });
}


// -----------------------------------------------------------------------------------

// 댓글 등록
const 