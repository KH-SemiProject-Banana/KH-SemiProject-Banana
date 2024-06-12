# KH-SemiProject-Banana

# :pushpin: Banana Market
> 중고거래 클론 프로젝트

</br>

## ⭐프로젝트 개요
- 공유경제의 중심인 ‘Exchange’, ‘Share’를 한글화로 네이밍함
- ‘바꾸고 나누자 나랑’의 약자인 [바나나]마켓 
- 다양한 게시판 및 채팅 활용으로 이용자간 상호작용에 중점

## 📌프로젝트 주안점
- 기존 중고거래 사이트 "당근마켓"을 벤치마킹하여 사이트 방향성 참고

- 당근마켓의 대부분의 기능을 구현하려고 노력(상품 CRUD, 게시판, 채팅, 차단/신고, 관리자 기능 구현)

- 학원에서 배운 내용을 기반으로 응용

- 중고거래 사이트의 중점이 되는 상품 거래 관련 기능(상품 페이지, 채팅 기능, 신고/차단 기능, 구매 기능) 구현에 

- MVC패턴을 기반으로 데이터 처리 후 DB에 접근하여 CRUD를 경험


<br>

## 1. 제작 기간 & 참여 인원
- 2022년 10월 18일 ~ 12월 10일
- 5인 팀 프로젝트


역할: <br> <br>
<a href="https://github.com/dawonLeeee">이다원(조장) [https://github.com/dawonLeeee]</a> <br>
[상품 페이지]
- 상품 등록<br>
- 상품 수정, 삭제<br><br>

[게시판 페이지]<br>
- 공지사항 조회<br>
- 문의사항 작성<br><br>

[관리자 페이지]<br>
- 회원, 상품, 글 조회<br>
- 차단, 삭제 관리<br><br>

<a href="https://github.com/ChiwooKang">강치우 [https://github.com/ChiwooKang]</a> <br>
[게시글 신고]<br>
- 신고 카테고리 선택<br>
- 신고 내용 전송<br><br>

[유저 신고]<br>
- 신고 카테고리 선택<br>
- 신고 내용 전송<br><br>

<a href="https://github.com/muuung">김현진 [https://github.com/muuung]</a> <br>
[상품 목록 페이지]<br>
- 상품 목록 조회<br>
- 추가 검색 조건에 따른 목록 조회<br><br>

[상품 상세 페이지]<br>
- 상품 세부 정보<br>
- 판매자 정보 조회<br><br>

[바나나 페이]<br>
- 결제 내역 조회<br>
- 포인트 환불<br>
- 포인트 결제 : 카카오페이 결제 API(I'M Port)<br><br>

<a href="https://github.com/Myodong">김효동 [https://github.com/Myodong]</a> <br>
[회원가입 페이지]<br>
- 약관 동의<br><br>

[로그인 페이지]<br>
- 아이디 저장<br>
- 메일 인증<br><br>

[ID/PW 찾기]<br>
- 임시 비밀번호 생성<br>
- 이메일 발송<br><br>

[채팅 페이지]<br>
- 1:1 채팅<br><br>

<a href="https://github.com/booimym">이수연 [https://github.com/booimym]</a> <br>
[마이페이지]<br>
- 회원정보 조회, 변경<br>
- 상품 목록<br>
- 관심목록 조회<br>
- 매너평가<br>
- 거래 후기 작성/조회<br>
- 차단 <br><br>

</br>



## 2. 사용 기술
#### `Back-end`
  - Java 11
  - Spring(3.9.18)
  - Maven
  - Spring Data JPA
  - QueryDSL
  - H2
  - MySQL 5.7
  - Spring Security
  - Jsoup
#### `Front-end`
  - HTML, CSS, JS

</br>

## 3. ERD 설계
[ERD-Cloud 주소](https://www.erdcloud.com/d/Xs6TpKvPYM4ZEFzvk)
![image](https://user-images.githubusercontent.com/102362636/214777562-f6a9c7f7-ac49-43aa-874f-4ba37da128b2.png)
![image](https://user-images.githubusercontent.com/102362636/214777622-c4471c51-8e5f-4f7c-9a89-70709a236283.png)


## 4. 핵심 기능
바나나마켓 프로젝트의 핵심 기능은 상품 등록, 사용자간 채팅, 카카오페이를 이용한 결제(가상), 신고 기능입니다.

<details>
<summery<<b>핵심 기능 설명</b></summery> <br>
<div markdown="1">

![image](https://user-images.githubusercontent.com/102362636/214777701-56529ad0-de97-4dc7-b7e0-ca5a37afa6ba.png)
![image](https://user-images.githubusercontent.com/102362636/214777746-3348972e-ec34-437f-b537-fcbfe737d7a4.png)
![image](https://user-images.githubusercontent.com/102362636/214777777-bd707b3b-e818-42b4-a48e-f6fa52257d8e.png)
![image](https://user-images.githubusercontent.com/102362636/214777812-facbd953-58a1-4d8d-8084-4d526608bec7.png)
![image](https://user-images.githubusercontent.com/102362636/214777861-22e669c4-bbd4-45be-a082-e47aa2d56832.png)
![image](https://user-images.githubusercontent.com/102362636/214777895-8b6687f2-ebf9-4039-8284-29e937138eb8.png)
![image](https://user-images.githubusercontent.com/102362636/214777932-de4ce328-0bea-48e6-a34a-2d3a87634390.png)

</div>
</detail>



