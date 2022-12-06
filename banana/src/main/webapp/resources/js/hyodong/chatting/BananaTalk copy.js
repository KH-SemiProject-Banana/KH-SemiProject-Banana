// 선택한 채팅방 번호를 저장하기 위한 전역 변수
let selectChattingNo;
let selectTargetNo;
let selectTargetName;
let selectTargetProfile;

// sockjs를 이용한 WebSocket 구현

// 로그인이 되어 있을 경우에만
// /chattingSock 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
let chattingSock;

if(loginMemberNo != ""){
	chattingSock = new SockJS("/chattingSock");
}

// 문서 로딩 완료 후 수행할 기능
document.addEventListener("DOMContentLoaded", ()=>{
	
	// 채팅방 목록에 클릭 이벤트 추가
	roomListAddEvent(); 

	// 메세지 버튼에 이벤트 추가
	send.addEventListener("click", sendMessage);

	if(tempNo != ""){
		//selectChattingNo = tempNo;

		const chattingItemList = document.getElementsByClassName("chatting-item");

		for(let item of chattingItemList){
		
			// 클릭한 채팅방의 번호 얻어오기
			const id = item.getAttribute("id");
			const arr = id.split("-");

			if(arr[0] == tempNo){
				item.click();
				break;
			}
		}
	}
	// 채팅 목록에서 8개 이상일시 borderBottom 1픽셀 오류해결
	// 부모 요소
	const chattinglist =document.getElementById("chatting-list");
	// 마지막 요소 
	const lastchild=chattinglist.lastElementChild;
	
	// 채팅 리스트가 8개 이상 일 경우 css 추가
	if(document.getElementsByClassName("chatting-item").length >7 ){
		//console.log("8개 이상!");
		//console.log(document.getElementsByClassName("chatting-item").length);
		lastchild.style.borderBottom="none";
		
	} else{
		//console.log("7개 이하~~");
		//console.log(document.getElementsByClassName("chatting-item").length);
		lastchild.style.borderBottom="border";
	}

	// 수정 중 테스트
    const date  = new Date();
	const year = date .getFullYear();
	const month = date .getMonth() + 1;
	const day = date .getDate();

	console.log('date: ' + date .toLocaleDateString('ko-kr'));
	console.log('년: ' + year);
	console.log('월: ' + month);
	console.log('일: ' + day);

    var nowDay = "";
    switch(date .getDay()){
        case 0: nowDay =year+"년 "+month+"월 "+day+"일 "+"일요일"; break;
        case 1: nowDay =year+"년 "+month+"월 "+day+"일 "+ "월요일"; break;
        case 2:nowDay = year+"년 "+month+"월 "+day+"일 "+"화요일"; break;
        case 3:nowDay =year+"년 "+month+"월 "+day+"일 "+ "수요일"; break;
        case 4: nowDay =year+"년 "+month+"월 "+day+"일 "+ "목요일"; break;
        case 5:nowDay =year+"년 "+month+"월 "+day+"일 "+ "금요일"; break;
        case 6:nowDay =year+"년 "+month+"월 "+day+"일 "+ "토요일"; break;
        default : nowDay = "알수없는요일"; break;
    }
	console.log(nowDay);


})

// 채팅 메세지 영역
const display = document.getElementsByClassName("display-chatting")[0];


// 채팅방 목록에 이벤트를 추가하는 함수 
const roomListAddEvent = () => {
	const chattingItemList = document.getElementsByClassName("chatting-item");
	
	for(let item of chattingItemList){
		item.addEventListener("click", e => {
	
			// 클릭한 채팅방의 번호 얻어오기
			const id = item.getAttribute("id");
			const arr = id.split("-");
			// 전역변수에 채팅방 번호, 상대 번호, 상태 프로필, 상대 이름 저장
			selectChattingNo = arr[0]
			selectTargetNo = arr[1];
			selectTargetProfile = item.children[0].children[0].getAttribute("src");
			selectTargetName = item.children[1].children[0].children[0].innerText;

			if(item.children[1].children[1].children[1] != undefined){
				item.children[1].children[1].children[1].remove();
			}
	
			// 모든 채팅방에서 select 클래스를 제거
			for(let it of chattingItemList) it.classList.remove("select")
	
			// 현재 클릭한 채팅방에 select 클래스 추가
			item.classList.add("select");
	
			// 비동기로 메세지 목록을 조회하는 함수 호출
			selectChattingFn();
		});
	}
}

// 비동기로 메세지 목록을 조회하는 함수
const selectChattingFn = () => {
	$.ajax({
		url : "/chatting/selectMessage",
		data : {"chattingNo" : selectChattingNo, "memberNo" : loginMemberNo},
		dataType : "JSON",
		success : messageList => {
			console.log(messageList);

			// <ul class="display-chatting">
			const ul = document.querySelector(".display-chatting");

			ul.innerHTML = ""; // 이전 내용 지우기

			// 메세지 만들어서 출력하기
			for(let msg of messageList){
				//<li>,  <li class="my-chat">
				const li = document.createElement("li");
				//<div class="my-chat-col"></div>
				const div = document.createElement("div")
				
				
				//const lid = document.createElement("li");// 메세지 시작 날짜
				//lid.classList.add("date-line");// 메세지 시작 날짜
				
				// 메세지 내용
				const p = document.createElement("p");
				p.classList.add("chat");
				p.innerHTML = msg.messageContent; // br태그 해석을 위해 innerHTML
				
				// 보낸 시간
				const time = document.createElement("time");
				time.classList.add("chatDate");
				time.innerText = msg.sendTime;


				// 내가 작성한 메세지인 경우
				if(loginMemberNo == msg.senderNo){ 
					li.classList.add("my-chat");
					div.classList.add("my-chat-col");
					
			
					li.append(div,time);
					div.append(p);
					
				}else{ // 상대가 작성한 메세지인 경우
					li.classList.add("target-chat");

					// 상대 프로필
					const img = document.createElement("img");
					img.classList.add("profile-name");
					img.setAttribute("src", selectTargetProfile);
					

					const div = document.createElement("div");
					div.classList.add("target-chat-col");

					// 상대 이름
					const name = document.createElement("name");
					name.classList.add("target-name");
					name.innerText = selectTargetName; // 전역변수


					div.append(name, p);
					li.append(img,div, time);
				}
				ul.append(li);
				//lid.append(div) // 메세지 시작 날짜

				display.scrollTop = display.scrollHeight; // 스크롤 제일 밑으로
			}
		},
		error : () => {console.log("에러");}
	})
}

// 비동기로 채팅방 목록 조회
const selectRoomList = () => {
	$.ajax({
		url: "/chatting/roomList",
		data : {"memberNo" : loginMemberNo},
		dataType : "JSON",
		success : roomList => {
			console.log(roomList);
			// 채팅방 리스트
			const chattingList = document.querySelector(".chatting-list");

			// 채팅방 리스트 지우기
			chattingList.innerHTML = "";

			for(let room of roomList){
				const li = document.createElement("li");
				li.classList.add("chatting-item");
				li.setAttribute("id", room.chattingNo + "-" + room.targetNo);

				if(room.chattingNo == selectChattingNo){
					li.classList.add("select");
				}

				// item-header 부분
				const itemHeader = document.createElement("div");
				itemHeader.classList.add("item-header");

				const listProfile = document.createElement("img");
				listProfile.classList.add("list-profile");

				if(room.targetProfile == undefined)	
					listProfile.setAttribute("src", "/resources/images/banana-logo.png");
				else								
					listProfile.setAttribute("src", room.targetProfile);

				itemHeader.append(listProfile);

				// item-body 부분
				const itemBody = document.createElement("div");
				itemBody.classList.add("item-body");

				const p = document.createElement("p");

				const targetName = document.createElement("span");
				targetName.classList.add("target-name");
				targetName.innerText = room.targetNickName;
				
				const recentSendTime = document.createElement("span");
				recentSendTime.classList.add("recent-send-time");
				recentSendTime.innerText = room.sendTime;
				
				
				p.append(targetName, recentSendTime);
				
				
				const div = document.createElement("div");
				
				const recentMessage = document.createElement("p");
				recentMessage.classList.add("recent-message");

				if(room.lastMessage != undefined){
					recentMessage.innerHTML = room.lastMessage;
				}
				
				div.append(recentMessage);

				itemBody.append(p,div);

				// 현재 채팅방을 보고있는게 아니고 읽지 않은 개수가 0개 이상인 경우 -> 읽지 않은 메세지 개수 출력
				if(room.notReadCount > 0 && room.chattingNo != selectChattingNo ){
				// if(room.chattingNo != selectChattingNo ){
					const notReadCount = document.createElement("p");
					notReadCount.classList.add("not-read-count");
					notReadCount.innerText = room.notReadCount;
					div.append(notReadCount);
				}else{
					// 현재 채팅방을 보고있는 경우
					// 비동기로 해당 채팅방 글을 읽음으로 표시
					$.ajax({
						url : "/chatting/updateReadFlag",
						data : {"chattingNo" : selectChattingNo, "memberNo" : loginMemberNo},
						success : result => {
							console.log(result);
						}
					})
				}
				li.append(itemHeader, itemBody);
				chattingList.append(li);
			}
			roomListAddEvent();
		}
	})
}


// 채팅 입력
const send = document.getElementById("send");

const sendMessage = () => {
	const inputChatting = document.getElementById("inputChatting");

	if (inputChatting.value.trim().length == 0) { // 입력창에 글이 없을 시
		alert("채팅을 입력해주세요.");
		inputChatting.value = "";
	} else {
		var obj = {
			"senderNo": loginMemberNo,
			"targetNo": selectTargetNo,
			"chattingNo": selectChattingNo,
			"messageContent": inputChatting.value,
		};
		console.log(obj)

		// JSON.stringify() : 자바스크립트 객체를 JSON 문자열로 변환
		chattingSock.send(JSON.stringify(obj));

		inputChatting.value = "";
	}
}

// 엔터 == 제출
// 쉬프트 + 엔터 == 줄바꿈
inputChatting.addEventListener("keyup", e => {
	if(e.key == "Enter"){ 
		if (!e.shiftKey) {
			sendMessage();
		}
	}
})




// WebSocket 객체 chattingSock이 서버로 부터 메세지를 통지 받으면 자동으로 실행될 콜백 함수
chattingSock.onmessage = function(e) {
	// 메소드를 통해 전달받은 객체값을 JSON객체로 변환해서 msg 변수에 저장.
	const msg = JSON.parse(e.data);
	console.log(msg);


	// 유저 신고로 바로가기
	if(selectChattingNo == msg.chattingNo){
		const div0 = document.querySelector(".popup_layer");
	
		const div1 = document.createElement("div");
		div1.classList.add("popup_box");


	const div1_1 = document.createElement("div");
	div1_1.setAttribute("style","height: 10px; width: 375px; float: top;");

	const div1_1a = document.createElement("a");
	div1_1a.setAttribute("href", "javascript:closePop();");

	const i = document.createElement("i");
	i.classList.add("fa-solid", "fa-x");
	
	const div1_2 = document.createElement("div");
	div1_2.classList.add("report-top");

	const div1_2_i = document.createElement("i");
	div1_2_i.classList.add("fa-soli","fa-arrow-left-long");

	const div1_2_span = document.createElement("span");
	div1_2_span.setAttribute("id","user-com");

	const div1_3 = document.createElement("div");

	const div1_3_1 = document.createElement("div");
	div1_3_1.classList.add("report-why");

	const div1_3_1_1 = document.createElement("div");

	const div1_3_1_1input = document.createElement("input");
	div1_3_1_1input.setAttribute("type","hidden");
	div1_3_1_1input.setAttribute("name","complained");
	div1_3_1_1input.setAttribute("value","${memberNickname}");


	const div1_3_1p = document.createElement("p");
	div1_3_1p.innerText = " ${memberNickname} 사용자를 신고하는 이유를 선택해주세요";

	const div1_3_2 = document.createElement("div");
	div1_3_2.setAttribute("id","click");





	const div1_3_2_1 = document.createElement("div");
	div1_3_2_1.classList.add("report-reason");
	div1_3_2_1.setAttribute("id", "abc1");

	const div1_3_2_1_1 = document.createElement("div");
	div1_3_2_1_1.innerText = "전문 판매업자 같아요";

	const div1_3_2_2 = document.createElement("div");
	div1_3_2_2.classList.add("report-reason");
	div1_3_2_2.setAttribute("id", "abc2");

	const div1_3_2_2_1 = document.createElement("div");
	div1_3_2_2_1.innerText = "비매너 사용자에요";

	const div1_3_2_3 = document.createElement("div");
	div1_3_2_3.classList.add("report-reason");
	div1_3_2_3.setAttribute("id", "abc3");

	const div1_3_2_3_1 = document.createElement("div");
	div1_3_2_3_1.innerText = "욕설을 해요";

	const div1_3_2_4 = document.createElement("div");
	div1_3_2_4.classList.add("report-reason");
	div1_3_2_4.setAttribute("id", "abc4");

	const div1_3_2_4_1 = document.createElement("div");
	div1_3_2_4_1.innerText = "성희롱을 해요";

	const div1_3_2_5 = document.createElement("div");
	div1_3_2_5.classList.add("report-reason");
	div1_3_2_5.setAttribute("id", "abc5");

	const div1_3_2_5_1 = document.createElement("div");
	div1_3_2_5_1.innerText = "거래/환불 분쟁신고";

	const div1_3_2_6 = document.createElement("div");
	div1_3_2_6.classList.add("report-reason");
	div1_3_2_6.setAttribute("id", "abc6");

	const div1_3_2_6_1 = document.createElement("div");
	div1_3_2_6_1.innerText = "사기당했어요";

	const div1_3_2_7 = document.createElement("div");
	div1_3_2_7.classList.add("report-reason");
	div1_3_2_7.setAttribute("id", "abc7");

	const div1_3_2_7_1 = document.createElement("div");
	div1_3_2_7_1.innerText = "다른 문제가 있어요";

	const div1_3_2_8 = document.createElement("div");
	div1_3_2_8.classList.add("report-reason");
	div1_3_2_8.setAttribute("id", "abc8");

	const div1_3_2_8_1 = document.createElement("div");
	div1_3_2_8_1.innerText = "연애 목적의 대화를 시도해요";

	const div1_3_3 = document.createElement("div");
	div1_3_3.setAttribute("id","click1");
	
	const div1_3_3_1 = document.createElement("div");
	div1_3_3_1.classList.add("report-reason");

	const div1_3_3_1_1 = document.createElement("div");
	div1_3_3_1_1.innerText = "전문 판매업자";

	const div1_3_3_2_1 = document.createElement("div");
	div1_3_3_2_1.innerText = " 중고차 매매업자 ";

	const div1_3_4 = document.createElement("div");
	div1_3_4.setAttribute("id","click2");

	const div1_3_4_1_1 = document.createElement("div");
	div1_3_4_1_1.innerText = " 반말을 사용해요 ";
	
	const div1_3_4_2_1 = document.createElement("div");
	div1_3_4_2_1.innerText = "불친절해요";

	const div1_3_5 = document.createElement("div");
	div1_3_5.setAttribute("id","click6");

	const div1_3_5_1_1 = document.createElement("div");
	div1_3_5_1_1.innerText = "카톡/문자 등 당근채팅 밖에서 대화를 유도해요";

	const div1_3_5_2_1 = document.createElement("div");
	div1_3_5_2_1.innerText = "가짜 안전결제/ 안전거래 사이트 링크를 보내요";

	const div1_3_5_3_1 = document.createElement("div");
	div1_3_5_3_1.innerText = "특수문자/ 사진 등 계좌/ 전화번호를 이상하게 보내요";

	const div1_3_5_4_1 = document.createElement("div");
	div1_3_5_4_1.innerText = "입금했는데 판매자가 물건을 주지 않고 잠적했어요";

	const div1_3_5_5_1 = document.createElement("div");
	div1_3_5_5_1.innerText = "물건을 보냈는데 구매자가 입금하지 않고 잠적했어요";

	const div1_3_6 = document.createElement("div");
	div1_3_6.setAttribute("id","click7");

	const div1_3_6_1_1 = document.createElement("div");
	div1_3_6_1_1.innerText = "불법 이용자 신고";

	const div1_3_6_2_1 = document.createElement("div");
	div1_3_6_2_1.innerText = "중복 게시글";

	const div1_3_6_3_1 = document.createElement("div");
	div1_3_6_3_1.innerText = "중복 게시글";

	const div1_3_6_4_1 = document.createElement("div");
	div1_3_6_4_1.innerText = "불건전 닉네임 신고";

	const div1_3_6_5_1 = document.createElement("div");
	div1_3_6_5_1.innerText = "채팅으로 정치/종교 대화를 시도해요";

	const form = document.createElement("form");
	form.setAttribute("id", "userreportsubmit");
	form.setAttribute("action", "/userreportsubmit");
	form.setAttribute("method", "POST");

	const div1_3_7 = document.createElement("div");
	div1_3_7.setAttribute("id","frame");

	const div1_3_7_1 = document.createElement("div");
	div1_3_7_1.classList.add("report-confirm");

	const div1_3_7_1_p = document.createElement("p");
	div1_3_7_1_p.innerText ="#{U_COM2_CTG_NO}";

	const div1_3_7_2 = document.createElement("div");
	div1_3_7_2.classList.add("user-block");

	const div1_3_7_2_input = document.createElement("input");
	div1_3_7_2_input.setAttribute("type", "checkbox");
	div1_3_7_2_input.setAttribute("name", "userblock");
	div1_3_7_2_input.setAttribute("value", "${memberNo}");
	div1_3_7_2_input.innerText = "이 사람을 더이상 보고싶지 않아요";

	const div1_3_8 = document.createElement("div");
	div1_3_8.classList.add("notice");
	
	const div1_3_8_p = document.createElement("p")
	div1_3_8_p.innerText = "신고 내용은 상대에게 노출되지 않아요. 내용이 사실과 다를 경우 이용 제제를 받을 수 있으니 주의해 주세요."
	
	const div1_3_9 = document.createElement("div");
	div1_3_9.classList.add("textbox");

	const div1_3_9_text = document.createElement("textarea");
	div1_3_9_text.setAttribute("name", "reportbox");
	div1_3_9_text.setAttribute("id", "reportbox");
	div1_3_9_text.setAttribute("cols", "90");
	div1_3_9_text.setAttribute("rows", "5");
	div1_3_9_text.setAttribute("placeholder", "혹시 불쾌한 일을 겪으셨나요? 사유를 남겨주세요");
	
	const button = document.createElement("button");
	button.setAttribute("type", "submit");
	button.setAttribute("id", "reportsubmit");
	button.innerText ="바나나 팀에게 보내기";
	
	const forminput1 = document.createElement("input");
	forminput1.setAttribute("type", "hidden");
	forminput1.setAttribute("name", "ctg1");
	forminput1.setAttribute("value", "");
	forminput1.setAttribute("id", "ctg1");

	const forminput2 = document.createElement("input");
	forminput1.setAttribute("type", "hidden");
	forminput1.setAttribute("name", "ctg2");
	forminput1.setAttribute("value", "");
	forminput1.setAttribute("id", "ctg2");











	



















	
	



	div0.append(div1);
	div1.append(div1_1,div1_2,div1_3);
	div1_1.append(div1_1a);
	div1_1a.append(i);

	

		
		//const lid = document.createElement("li");// 메세지 시작 날짜
		//lid.classList.add("date-line");// 메세지 시작 날짜
		
		// 메세지 내용
		const p = document.createElement("p");
		p.classList.add("chat");
		p.innerHTML = msg.messageContent; // br태그 해석을 위해 innerHTML

		// 보낸 시간
		const time = document.createElement("time");
		time.classList.add("chatDate");
		time.innerText = msg.sendTime;
		

		// 내가 작성한 메세지인 경우
		if(loginMemberNo == msg.senderNo){ 
			li.classList.add("my-chat");
			div.classList.add("my-chat-col");

			li.append(div,time);
			div.append(p);


		}else{ // 상대가 작성한 메세지인 경우
			li.classList.add("target-chat");
	
			// 상대 프로필
			const img = document.createElement("img");
			img.classList.add("profile-name"); 
			img.setAttribute("src", selectTargetProfile);

			
			const div = document.createElement("div");
			div.classList.add("target-chat-col");

			// 상대 이름
			const name = document.createElement("name");
			name.classList.add("target-name");
			name.innerText = selectTargetName; // 전역변수
	
	
			div.append(name, p);
			li.append(img,div, time);
			//lid.append(div) // 메세지 시작 날짜
	
		}
	
		ul.append(li)
		display.scrollTop = display.scrollHeight; // 스크롤 제일 밑으로
	}



	selectRoomList();
}

