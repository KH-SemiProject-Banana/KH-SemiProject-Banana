const b_click =  document.getElementById("b_click"); // 1페이지
const b_click1 = document.getElementById("b_click1"); // 2페이지
const b_click2 = document.getElementById("b_click2"); // 2페이지
const b_click3 = document.getElementById("b_click3"); // 2페이지
const b_click4 = document.getElementById("b_click4"); // 2페이지
const b_click5 = document.getElementById("b_click5"); // 2페이지
const b_click6 = document.getElementById("b_click6"); // 2페이지
const reportsubmit = document.getElementById("reportsubmit"); // 3페이지
const b_abc1 = document.getElementById("b_abc1");
const b_abc2 = document.getElementById("b_abc2");
const b_abc3 = document.getElementById("b_abc3");
const b_abc4 = document.getElementById("b_abc4");
const b_abc5 = document.getElementById("b_abc5");
const fin = document.getElementById("fin");
// const ctg = document.getElementsByClassName("ctg")
reportsubmit.style.display = "none";
const b_back1 = document.getElementById("b_back1");
const b_back2 = document.getElementById("b_back2");




let category1;
let category2;

const b_abc = document.getElementsByClassName("b_abc");
const b_ctg1 = document.getElementById("b_ctg1");
const b_ctg2 = document.getElementById("b_ctg2");

document.getElementById("poppingThing").style.display = "none";

b_click1.style.display = "none";
b_click2.style.display = "none";
b_click3.style.display = "none";
b_click4.style.display = "none";
b_click5.style.display = "none";

function openPop(){
    //document.getElementById("popup_layer").style.display = "block";
    document.getElementById("popup_layer").style.display = "block";
    // document.getElementById("popup_box").style.display = "block";


    document.getElementById("popup_layer").style.display = "block";
    document.getElementById("poppingThing").style.display = "block";




    b_abc1.addEventListener("click",function(){
        // if(b_click1.style.display == "none"){
            b_click.style.display = "none";
            b_click1.style.display = "block";
            fin.style.display="none";
            b_back1.style.display = "block";
        // }
    })

    b_abc2.addEventListener("click", () => {
    
        // if(b_click2.style.display == "none") {
            b_click.style.display = "none";
            b_click2.style.display = "block"
            fin.style.display="none";
            b_back1.style.display = "block";
        // }

    })

    b_abc3.addEventListener("click",function(){
    
        // if(b_click3.style.display == "none"){
            b_click.style.display = "none";
            b_click3.style.display = "block";
            fin.style.display="none";
            b_back1.style.display = "block";
        

        // }
        
    })


    b_abc4.addEventListener("click",function(){
    
        // if(b_click4.style.display == "none"){
            b_click.style.display = "none";
            b_click4.style.display = "block";
            fin.style.display="none";
            b_back1.style.display = "block";
        

        // }
        
    })


    b_abc5.addEventListener("click",function(){
    
        // if(b_click5.style.display == "none"){
            b_click.style.display = "none";
            b_click5.style.display = "block";
            fin.style.display="none";
            b_back1.style.display = "block";
        

        // }
        
    })


    b_click1.addEventListener("click", () => {
        // if(reportsubmit.style.display == "none") {
            b_click1.style.display = "none";
            reportsubmit.style.display = "block";
            b_back2.style.display = "block";
        // }
    })

    b_click2.addEventListener("click", () => {
        // if(reportsubmit.style.display == "none") {
            b_click2.style.display = "none";
            reportsubmit.style.display = "block";
            b_back2.style.display = "block";

        // }

    })

    b_click3.addEventListener("click", () => {
        // if(reportsubmit.style.display == "none") {
            b_click3.style.display = "none";
            reportsubmit.style.display = "block";
            b_back2.style.display = "block";

        // }

    })

    b_click4.addEventListener("click", () => {
        // if(reportsubmit.style.display == "none") {
            b_click4.style.display = "none";
            reportsubmit.style.display = "block";
            b_back2.style.display = "block";

        // }

    })

    b_click5.addEventListener("click", () => {
        // if(reportsubmit.style.display == "none") {
            b_click5.style.display = "none";
            reportsubmit.style.display = "block";
            b_back2.style.display = "block";
        // }
    })

    // b_abc 클래스 친구들 다 데려오기
 

    for(let i = 0; i < b_abc.length; i++) {
        // b_abc의 i번째 친구가 눌렸을 때 
        b_abc[i].addEventListener("click", () => {
            // 0번부터 눌리니깐 +1
            b_ctg1.value = i + 1;
            console.log(b_ctg1);
            
            // b_ctg2 설명을 담을 껍데기 변수 선언
            let b_ctg2dsc;
            
            // ctg 1벨류가 특정값일때 
            switch (b_ctg1.value) {
                case 1:
                    b_ctg2dsc = document.getElementById("b_click1").children;
                    // 클릭1 자식요소 가져오기
                    break;
        
                case 2:
                    b_ctg2dsc = document.getElementById("b_click2").children;
                    // 클릭 2 자식요소(세부카테고리) 가져오기
                    break;
        
                case 3:
                    b_ctg2dsc = document.getElementById("b_click3").children;
                    break;
        
                case 4:
                    b_ctg2dsc = document.getElementById("b_click4").children;
                    break;
        
                case 5:
                    b_ctg2dsc = document.getElementById("b_click5").children;
                    break;
            }

            // b_ctg2dsc = document.getElementById("click" + b_ctg1.value).children;

            // 위에서 가져온 세부카테고리 배열 반복문으로 검사
            for(let i = 0; i < b_ctg2dsc.length; i++){
                // 몇번째 인덱스가 클릭되었을때 이벤트 발생
                b_ctg2dsc[i].addEventListener("click", () => {
                    // 0번째 인덱스는 디비에 없으니 +1
                    b_ctg2.value = i + 1;
                    console.log(b_ctg2);
                })
            }
        })
    }
    
    
    document.getElementById("reportsubmit").addEventListener("submit",function(e){
  /*       memberNo2 = b_ctg1;
        goodsNo2 = b_ctg2; */
        console.log(memberNo2);
        console.log(goodsNo2);

        $.ajax({
            url : "/duplicateCheck2",
            data:{"memberNo2":memberNo2,"goodsNo2":goodsNo2},
            success:(result) => {
                if(result>0){ //중복된 값이 있다.
                    alert("중복된 신고 입니다.");
                    // document.getElementById("reportsubmit").setAttribute("onsubmit","return false");
                    e.preventDefault(); // 제출 못하게
                    return;
                } else { //중복된 값이 없다.
                    alert("신고 완료!")
                }
            },
            error:() => {
                console.log("동작 에러남")

            },
            complete:() =>{
                console.log("완료시 로그가 찍혀라잇!")
            }

        })

        

    }) 

    b_back2.addEventListener("click", () => {
        reportsubmit.style.display = "none";
        console.log(b_ctg1.value);

        switch (b_ctg1.value) {
            case 1:
                b_click1.style.display = "block";
            break;
                
            case 2:
                b_click2.style.display = "block";
            break;

            case 3:
                b_click3.style.display = "block";
            break;
            case 4:
                b_click4.style.display = "block";
            break;
            case 5:
                b_click5.style.display = "block";   
            break;          
        }

            b_back2.style.display = "none";
    });


    b_back1.addEventListener("click",() => {

        switch (b_ctg1.value) {
            case 1:
                b_click1.style.display = "none";
            break;
                
            case 2:
                b_click2.style.display = "none";
            break;
                    
            case 3:
                b_click3.style.display = "none";
            break;
                        
            case 4:
                b_click4.style.display = "none";   
            break;
            
            case 5:
                b_click5.style.display = "none";   
            break; 
        }

        b_click.style.display = "block";
        fin.style.display= "block";
        b_back1.style.display = "none";
    });

    


            
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

	const div1_2_i1 = document.createElement("i");
	div1_2_i1.classList.add("fa-soli","fa-arrow-left-long");
	div1_2_i1.setAttribute("id","back1");

	const div1_2_i2 = document.createElement("i");
	div1_2_i2.classList.add("fa-soli","fa-arrow-left-long");
	div1_2_i2.setAttribute("id","back2");

	const div1_2_i3 = document.createElement("i");
	div1_2_i3.classList.add("fa-soli","fa-arrow-left-long");
	div1_2_i3.setAttribute("id","back3");

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


	const div1_3_1_2p = document.createElement("p");
	div1_3_1_2p.innerText = " ${memberNickname} 사용자를 신고하는 이유를 선택해주세요";

	const div1_3_2 = document.createElement("div");
	div1_3_2.setAttribute("id","click");




	const div1_3_2_1 = document.createElement("div");
	div1_3_2_1.classList.add("report-reason");
    div1_3_2_1.classList.add("abc");
	div1_3_2_1.setAttribute("id", "abc1");

	const div1_3_2_1_1 = document.createElement("div");
	div1_3_2_1_1.innerText = "전문 판매업자 같아요";

	const div1_3_2_2 = document.createElement("div");
	div1_3_2_2.classList.add("report-reason");
    div1_3_2_1.classList.add("abc");
	div1_3_2_2.setAttribute("id", "abc2");

	const div1_3_2_2_1 = document.createElement("div");
	div1_3_2_2_1.innerText = "비매너 사용자에요";

	const div1_3_2_3 = document.createElement("div");
	div1_3_2_3.classList.add("report-reason");
    div1_3_2_1.classList.add("abc");
	div1_3_2_3.setAttribute("id", "abc3");

	const div1_3_2_3_1 = document.createElement("div");
	div1_3_2_3_1.innerText = "욕설을 해요";

	const div1_3_2_4 = document.createElement("div");
	div1_3_2_4.classList.add("report-reason");
    div1_3_2_1.classList.add("abc");
	div1_3_2_4.setAttribute("id", "abc4");

	const div1_3_2_4_1 = document.createElement("div");
	div1_3_2_4_1.innerText = "성희롱을 해요";

	const div1_3_2_5 = document.createElement("div");
	div1_3_2_5.classList.add("report-reason");
    div1_3_2_1.classList.add("abc");
	div1_3_2_5.setAttribute("id", "abc5");

	const div1_3_2_5_1 = document.createElement("div");
	div1_3_2_5_1.innerText = "거래/환불 분쟁신고";

	const div1_3_2_6 = document.createElement("div");
	div1_3_2_6.classList.add("report-reason");
    div1_3_2_1.classList.add("abc");
	div1_3_2_6.setAttribute("id", "abc6");

	const div1_3_2_6_1 = document.createElement("div");
	div1_3_2_6_1.innerText = "사기당했어요";

	const div1_3_2_7 = document.createElement("div");
	div1_3_2_7.classList.add("report-reason");
    div1_3_2_1.classList.add("abc");
	div1_3_2_7.setAttribute("id", "abc7");

	const div1_3_2_7_1 = document.createElement("div");
	div1_3_2_7_1.innerText = "다른 문제가 있어요";

	const div1_3_2_8 = document.createElement("div");
	div1_3_2_8.classList.add("report-reason");
    div1_3_2_1.classList.add("abc");
	div1_3_2_8.setAttribute("id", "abc8");

	const div1_3_2_8_1 = document.createElement("div");
	div1_3_2_8_1.innerText = "연애 목적의 대화를 시도해요";

	const div1_3_3 = document.createElement("div");
	div1_3_3.setAttribute("id","click1");
	
	const div1_3_3_1 = document.createElement("div");
	div1_3_3_1.classList.add("report-reason");

	const div1_3_3_1_1 = document.createElement("div");
	div1_3_3_1_1.innerText = "전문 판매업자";

    const div1_3_3_2 = document.createElement("div");
	div1_3_3_2.classList.add("report-reason");

	const div1_3_3_2_1 = document.createElement("div");
	div1_3_3_2_1.innerText = " 중고차 매매업자 ";

	const div1_3_4 = document.createElement("div");
	div1_3_4.setAttribute("id","click2");

    const div1_3_4_1 = document.createElement("div");
	div1_3_4_1.classList.add("report-reason");

	const div1_3_4_1_1 = document.createElement("div");
	div1_3_4_1_1.innerText = " 반말을 사용해요 ";

    const div1_3_4_2 = document.createElement("div");
	div1_3_4_2.classList.add("report-reason");
	
	const div1_3_4_2_1 = document.createElement("div");
	div1_3_4_2_1.innerText = "불친절해요";

	const div1_3_5 = document.createElement("div");
	div1_3_5.setAttribute("id","click6");

    const div1_3_5_1 = document.createElement("div");
	div1_3_5_1.classList.add("report-reason");

	const div1_3_5_1_1 = document.createElement("div");
	div1_3_5_1_1.innerText = "카톡/문자 등 당근채팅 밖에서 대화를 유도해요";

    const div1_3_5_2 = document.createElement("div");
	div1_3_5_2.classList.add("report-reason");

	const div1_3_5_2_1 = document.createElement("div");
	div1_3_5_2_1.innerText = "가짜 안전결제/ 안전거래 사이트 링크를 보내요";

    const div1_3_5_3 = document.createElement("div");
	div1_3_5_3.classList.add("report-reason");

	const div1_3_5_3_1 = document.createElement("div");
	div1_3_5_3_1.innerText = "특수문자/ 사진 등 계좌/ 전화번호를 이상하게 보내요";

    const div1_3_5_4 = document.createElement("div");
	div1_3_5_4.classList.add("report-reason");

	const div1_3_5_4_1 = document.createElement("div");
	div1_3_5_4_1.innerText = "입금했는데 판매자가 물건을 주지 않고 잠적했어요";

    const div1_3_5_5 = document.createElement("div");
	div1_3_5_5.classList.add("report-reason");

	const div1_3_5_5_1 = document.createElement("div");
	div1_3_5_5_1.innerText = "물건을 보냈는데 구매자가 입금하지 않고 잠적했어요";

	const div1_3_6 = document.createElement("div");
	div1_3_6.setAttribute("id","click7");

    const div1_3_6_1 = document.createElement("div");
	div1_3_6_1.classList.add("report-reason");

	const div1_3_6_1_1 = document.createElement("div");
	div1_3_6_1_1.innerText = "불법 이용자 신고";

    const div1_3_6_2 = document.createElement("div");
	div1_3_6_2.classList.add("report-reason");

	const div1_3_6_2_1 = document.createElement("div");
	div1_3_6_2_1.innerText = "중복 게시글";

    const div1_3_6_3 = document.createElement("div");
	div1_3_6_3.classList.add("report-reason");

	const div1_3_6_3_1 = document.createElement("div");
	div1_3_6_3_1.innerText = "프로필 사진 신고";

    const div1_3_6_4 = document.createElement("div");
	div1_3_6_4.classList.add("report-reason");

	const div1_3_6_4_1 = document.createElement("div");
	div1_3_6_4_1.innerText = "불건전 닉네임 신고";

    const div1_3_6_5 = document.createElement("div");
	div1_3_6_5.classList.add("report-reason");

	const div1_3_6_5_1 = document.createElement("div");
	div1_3_6_5_1.innerText = "채팅으로 정치/종교 대화를 시도해요";

	const div1_3_7form = document.createElement("form");
	div1_3_7form.setAttribute("id", "userreportsubmit");
	div1_3_7form.setAttribute("action", "/userreportsubmit");
	div1_3_7form.setAttribute("method", "POST");

	const div1_3_7_1 = document.createElement("div");
	div1_3_7_1.setAttribute("id","frame");

	const div1_3_7_1_1 = document.createElement("div");
	div1_3_7_1_1.classList.add("report-confirm");

	const div1_3_7_1_1p = document.createElement("p");
	div1_3_7_1_1p.innerText ="#{U_COM2_CTG_NO}";

	const div1_3_7_1_2 = document.createElement("div");
	div1_3_7_1_2.classList.add("user-block");

	const div1_3_7_1_2_input = document.createElement("input");
	div1_3_7_1_2_input.setAttribute("type", "checkbox");
	div1_3_7_1_2_input.setAttribute("name", "userblock");
	div1_3_7_1_2_input.setAttribute("value", "${memberNo}");
	div1_3_7_1_2_input.innerText = "이 사람을 더이상 보고싶지 않아요";

	const div1_3_7_1_3 = document.createElement("div");
	div1_3_7_1_3.classList.add("notice");
	
	const div1_3_7_1_3_p = document.createElement("p")
	div1_3_7_1_3_p.innerText = "신고 내용은 상대에게 노출되지 않아요. 내용이 사실과 다를 경우 이용 제제를 받을 수 있으니 주의해 주세요."
	
	const div1_3_7_1_4 = document.createElement("div");
	div1_3_7_1_4.classList.add("textbox");

	const div1_3_7_1_4_text = document.createElement("textarea");
	div1_3_7_1_4_text.setAttribute("name", "reportbox");
	div1_3_7_1_4_text.setAttribute("id", "reportbox");
	div1_3_7_1_4_text.setAttribute("cols", "90");
	div1_3_7_1_4_text.setAttribute("rows", "5");
	div1_3_7_1_4_text.setAttribute("placeholder", "혹시 불쾌한 일을 겪으셨나요? 사유를 남겨주세요");
	
	const div1_3_7_1_button = document.createElement("button");
	div1_3_7_1_button.setAttribute("type", "submit");
	div1_3_7_1_button.setAttribute("id", "reportsubmit");
	div1_3_7_1_button.innerText ="바나나 팀에게 보내기";
	
	const div1_3_7_2_input1 = document.createElement("input");
	div1_3_7_2_input1.setAttribute("type", "hidden");
	div1_3_7_2_input1.setAttribute("name", "ctg1");
	div1_3_7_2_input1.setAttribute("value", "");
	div1_3_7_2_input1.setAttribute("id", "ctg1");

	const div1_3_7_3_input2 = document.createElement("input");
	div1_3_7_3_input2.setAttribute("type", "hidden");
	div1_3_7_3_input2.setAttribute("name", "ctg2");
	div1_3_7_3_input2.setAttribute("value", "");
	div1_3_7_3_input2.setAttribute("id", "ctg2")


    b_click6.addEventListener("click" ,()=>{
        //초기화
        div0.innerHTML = "";

        //생성
        div0.append(div1);
            div1.append(div1_1,div1_2,div1_3);
                div1_1.append(div1_1a);
                    div1_1a.append(i);
                div1_2.append(div1_2_i1, div1_2_i2, div1_2_i3,div1_2_span);
                // div1_3.append(div1_3_1, div1_3_2, div1_3_3, div1_3_4,div1_3_5,div1_3_6,div1_3_7form);
                div1_3.append(div1_3_1, div1_3_2);
                    div1_3_1.append(div1_3_1_1,div1_3_1_2p);

                    div1_3_2.append(div1_3_2_1,div1_3_2_2,div1_3_2_3,div1_3_2_4,div1_3_2_5,div1_3_2_6,div1_3_2_7,div1_3_2_8);
                        div1_3_2_1.append(div1_3_2_1_1);
                        div1_3_2_2.append(div1_3_2_2_1);
                        div1_3_2_3.append(div1_3_2_3_1);
                        div1_3_2_4.append(div1_3_2_4_1);
                        div1_3_2_5.append(div1_3_2_5_1);
                        div1_3_2_6.append(div1_3_2_6_1);
                        div1_3_2_7.append(div1_3_2_7_1);
                        div1_3_2_8.append(div1_3_2_8_1);

                        const abc1 = document.getElementById("abc1");
                        abc1.addEventListener("click",()=>{
                    
                            //초기화
                            div1_3_2.innerHTML = "";
                    
                            //생성
                            div1_3_3.append(div1_3_3_1, div1_3_3_2);
                                div1_3_3_1.append(div1_3_3_1_1);
                                div1_3_3_2.append(div1_3_3_2_1);
        
                        
                            
                        });
                    });





				// div1_3_4.append(div1_3_4_1,div1_3_4_2);
                //     div1_3_4_1.append(div1_3_4_1_1);
				// 	div1_3_4_2.append(div1_3_4_2_1);

				// div1_3_5.append(div1_3_5_1,div1_3_5_2,div1_3_5_3,div1_3_5_4,div1_3_5_5);
                //     div1_3_5_1.append(div1_3_5_1_1);
				// 	div1_3_5_2.append(div1_3_5_2_1);
				// 	div1_3_5_3.append(div1_3_5_3_1);
				// 	div1_3_5_4.append(div1_3_5_4_1);
				// 	div1_3_5_5.append(div1_3_5_5_1);

				// div1_3_6.append(div1_3_6_1,div1_3_6_2,div1_3_6_3,div1_3_6_4,div1_3_6_5);
                //     div1_3_6_1.append(div1_3_6_1_1);
				// 	div1_3_6_2.append(div1_3_6_2_1);
				// 	div1_3_6_3.append(div1_3_6_3_1);
				// 	div1_3_6_4.append(div1_3_6_4_1);
				// 	div1_3_6_5.append(div1_3_6_5_1);

				div1_3_7form.append(div1_3_7_1,div1_3_7_2_input1,div1_3_7_3_input2);
					div1_3_7_1.append(div1_3_7_1_1,div1_3_7_1_2,div1_3_7_1_3,div1_3_7_1_4,div1_3_7_1_button);
						div1_3_7_1_1.append(div1_3_7_1_1p);
						div1_3_7_1_2.append(div1_3_7_1_2_input);
						div1_3_7_1_3.append(div1_3_7_1_3_p);
						div1_3_7_1_4.append(div1_3_7_1_4_text);


   


        
}

        

function closePop(){
    document.getElementById("popup_layer").style.display = "none";
}





