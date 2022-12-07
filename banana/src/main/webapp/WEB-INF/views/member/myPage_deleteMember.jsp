<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>

    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/lsy/myPage_deleteMember.css ">

    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
</head>

<body>

    <main>


        <jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/nav.jsp" />


        <section class="deleteMember">
            <div class="delTitle">
                <div class="delTitleName">
                    <p>차단 관리</p>
                </div>
                <div class="delCount">
                    <div>전체 <span id="count">${fn:length(deleteMember)}</span>명</div>
                </div>
            </div>
            <div class="delContent">


                <c:if test="${deleteMember == null}">
                    <h2>차단한 회원이 없습니다</h2>
                </c:if>

                <c:if test="${deleteMember != null}">

                    <c:forEach var="member" items="${deleteMember}">
                    <div class="delMember">
                        <div class="memberImgArea">
                            <a href="#">
                                <c:if test="${member.profileImage != null}">
                                    <img src="${member.profileImage}" class="memberImg">
                                </c:if>
                                <c:if test="${member.profileImage == null}">
                                    <img src="/resources/images/banana-logo.png" class="memberImg">
                                </c:if>
                            </a>
                        </div>
                        <div class="memberNickname">${member.memberNickname}</div>
                        <c:if test="${member.introduce == null}">
                            <div class="memberIntroduce">회원의 자기소개가 없습니다</div>
                        </c:if>
                        <c:if test="${member.introduce != null}">
                            <div class="memberIntroduce">${member.introduce}</div>
                        </c:if>
                        <button class="blockCancel" id="${member.memberNo}">차단해제</button>
                    </div>
                    </c:forEach>
                </c:if>

                

            </div>
            
            
        </section>
    </main>

    <script>
        const loginMemberNo = "${loginMember.memberNo}";
    </script>


   	<%-- footer.jsp.include --%>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="/resources/js/lsy/myPage_deleteMember.js"></script>
</body>

</html>