package edu.kh.banana.member.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.banana.member.model.service.MyPageService;
import edu.kh.banana.member.model.vo.Member;
import edu.kh.banana.review.model.vo.Review;

@RequestMapping("/member/myPage")
@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService service;

	// 마이페이지 이동 
	@GetMapping("/main") // 나머지 주소 작성
	public String main(@SessionAttribute("loginMember") Member loginMember, 
						Model model,
						@RequestParam(value="myPageCt", required=false, defaultValue = "1") int myPageCt
						) {
		
		
		System.out.println(loginMember);
		Map<String, Object> map1 = new HashMap<String, Object>(); //새로 추가
//		map1.put("sell",sell); //새로 추가
//		map1.put("buy", buy); //새로 추가
		int memberNo = loginMember.getMemberNo();
		map1.put("memberNo", memberNo); //새로 추가
		map1.put("myPageCt", myPageCt);
		System.out.println(map1);
		model.addAttribute("loginMember",loginMember);
		String address = loginMember.getMemberAddress();
		model.addAttribute("address", address.substring(10,13));
		
		//Map<String, Object> map = service.selectGoodsList(memberNo); //기존 구문
		Map<String, Object> map = service.selectGoodsList(map1); 
		model.addAttribute("map", map);
		System.out.println(map);
		
		return "member/myPage_main";
	}

	// 리뷰 상세 페이지 이동 1
	@GetMapping("/review/good")
	public String reviewGood() {
		return "member/myPage_review_good";
	}
	// 리뷰 상세 페이지 이동 2
	@GetMapping("/review/detail")
	public String reviewDetail() {
		return "member/myPage_review_detail";
	}

	// 마이페이지 자기소개 수정 
	@GetMapping("/changeIntroduce")
	@ResponseBody
	public int changeIntroduce(
//			@RequestParam("introducew123") String introducew,
			String introduce,
			@SessionAttribute("loginMember") Member loginMember
			) {
		
		Member member = new Member(); 
		
		member.setMemberNo(loginMember.getMemberNo());
		member.setIntroduce(introduce);
		loginMember.setIntroduce(introduce); // 세션 동기화
		
		int result = service.changeIntroduce(member);
		return result;
	}

	// 내 회원 정보 수정 페이지 이동
	@GetMapping("/updateInfo")
	public String updateInfo() {
		return "member/myPage_UpdateInfo";
	}
	
	// 내 회원 정보 수정
	@PostMapping("/updateInfo")
	public String updateInfo(Member inputMember,
							@SessionAttribute("loginMember")Member loginMember,
							@RequestParam Map<String, Object> paramMap,
							String[] memberAddress,
							RedirectAttributes ra){
		
		inputMember.setMemberNo(loginMember.getMemberNo());
		
		String address = String.join(",,", memberAddress);
		inputMember.setMemberAddress(address);
		
		int result = service.updateInfo(inputMember);
		
		String message = null;
		
		if(result > 0) {
			message = "회원 정보가 수정 되었습니다.";
			loginMember.setMemberNickname(inputMember.getMemberNickname());
			loginMember.setMemberTel(inputMember.getMemberTel());
			loginMember.setMemberAddress(inputMember.getMemberAddress());
			loginMember.setMemberPw(inputMember.getMemberPw());
			
		}else {
			message = "회원 정보 수정 실패";	
		}		  
		ra.addFlashAttribute("message", message);
		return "redirect:updateInfo";
	}


	@GetMapping("/sendingReview")
	@ResponseBody
	public int sendingReview(
			@RequestParam(value = "goodChecked", required = false) String goodChecked,
			@RequestParam(value = "badChecked", required = false) String badChecked, 
			String reviewText, 
			@SessionAttribute("loginMember") Member loginMember,
			int reviewGoodsNo, int reviewBuyerNo
			) {
		System.out.println("컨트롤러에 입성");
		
		//good값 세팅
		List<String> goodCheckedArr = null;
		if(!goodChecked.equals("")) {
			String[] goodArr = goodChecked.split(",");
			goodCheckedArr = Arrays.asList(goodArr);
			
		} else {
			goodCheckedArr = new ArrayList<String>();
		}
		//bad값 세팅
		List<String> badCheckedArr = null;
		if(!badChecked.equals("")) {
			String[] badArr = badChecked.split(",");
			badCheckedArr= Arrays.asList(badArr);
		}else {
			badCheckedArr = new ArrayList<String>();
		}
		//System.out.println("badCheckedArr : " + badCheckedArr);

		int result = service.sendingMannerReview(goodCheckedArr,badCheckedArr,reviewText,
				loginMember,reviewGoodsNo,reviewBuyerNo);
		//int result = service.sendingReview();
		return result;
	}
	
	/**내가 쓴 후기 조회
	 * @param ratingNo
	 * @return
	 */
	@PostMapping("/selectSendingReview")
	@ResponseBody
	public String selectSendingReview(int ratingNo) {
		
		List<Review> reviewList = service.selectSendingReview(ratingNo);
		
		System.out.println(reviewList);
		return new Gson().toJson(reviewList);
	}
	
}
