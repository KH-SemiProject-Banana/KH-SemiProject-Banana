<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<div id="comment-area">
    <!-- 댓글 목록 -->
    <div class="comment-list-area">
        
        <ul id="comment-list">

            <c:forEach var="comment" items="${board.commentList}">
                <%-- comment.parentNo => int형변수는 nul == 0이 됨 --%>
                <li class="comment-row <c:if test="${comment.parentNo != 0}"> child-comment </c:if>">
                    <p class="comment-writer">
                        <%-- 프로필 이미지가 없는 경우 --%>
                        <c:if test="${empty comment.profileImage}">
                            <img src="/resources/images/user.png">
                        </c:if>
                        <c:if test="${not empty comment.profileImage}">
                            <img src="${comment.profileImage}"/>
                            <%-- <img src="/resources/images/user.png"> --%>
                        </c:if>

                        <%-- 닉네임 --%>
                        <span>${comment.memberNickname}</span>
                        <%-- 작성일 --%>
                        <span>(${comment.commentCreateDate})</span>
                    </p>

                    <p class="comment-content">${comment.commentContent}</p>
                    
                    <c:if test="${not empty loginMember}">
                        <div class="comment-btn-area">
                            <button>답글</button>   

                        <%-- 로그인 회원과 댓글 작성자가 같을 경우 --%>
                        <c:if test="${loginMember.memberNo == comment.memberNo}">
                            <button>수정</button>     
                            <button>삭제</button>
                        </c:if>
                        </div>

                    </c:if>
                </li>
            </c:forEach>

        </ul>
    </div>
    

    <!-- 댓글 작성 부분 -->
    <div class="comment-write-area">
        <textarea id="commentContent"></textarea>
        <button id="addComment">
            댓글<br>
            등록
        </button>
 
    </div>

</div>