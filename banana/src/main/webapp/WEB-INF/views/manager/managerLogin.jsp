<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon"  sizes="16x16 32x32 64x64" href="https://i.ibb.co/4tCGZqD/Banana.png">
    <title>바꾸고 나누자 나랑: 바나나 마켓</title>

    <link rel="stylesheet" href="/resources/css/style.css">
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>


<%-- <script>
    $(document).ready(function(){
        $("#btnLogin").click(function(){
            // 태크.val() : 태그에 입력된 값
            // 태크.val("값") : 태그의 값을 변경 
            var memberEmail = $("#memberEmail").val();
            var memberPw = $("#memberPw").val();
            if(memberEmail == ""){
                alert("아이디를 입력하세요.");
                $("#memberEmail").focus(); // 입력포커스 이동
                return; // 함수 종료
            }
            if(memberPw == ""){
                alert("비밀번호를 입력하세요.");
                $("#memberPw").focus();
                return;
            }

        });
    });
</script> --%>

</head>
<body>
    

    <main>

    
    <jsp:include page="/WEB-INF/views/common/header.jsp" />    

    <h2>관리자 로그인</h2>
    <form name="form1" method="post" action="/manager/login">
        <table border="1" width="400px">
            <tr>
                <td>아이디</td>
                <td><input name="memberEmail" id="memberEmail"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="memberPw" id="memberPw"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button id="btnLogin">로그인</button>
                
               
                </td>
            </tr>
        </table>
    </form>
        


    </main>

    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>