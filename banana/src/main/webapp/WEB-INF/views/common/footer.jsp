<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


    <footer>
        <p>
            Copyright &copy; KH Information Educational Institute A-Class 중고거래 프로젝트 팀
        </p>
        <article>
            <a href="#">프로젝트 소개</a>
            <span> | </span>
            <a href="#">이용약관</a>
            <span> | </span>
            <a href="#">개인정보취급방침</a>
            <span> | </span>
            <a href="/board/1">고객센터</a>
        </article>
    </footer>


    <c:if test="${!empty message}">
        <script>
            alert("${message}")
        </script>

        <c:remove var="message"></c:remove>
    </c:if>