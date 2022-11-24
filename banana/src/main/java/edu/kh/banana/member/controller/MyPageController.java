package edu.kh.banana.member.controller;

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
import edu.kh.banana.member.model.service.MyPageService;
import edu.kh.banana.member.model.vo.Member;

@RequestMapping("/member/myPage")
@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	


	// 마이페이지 이동 
	@GetMapping("/main") // 나머지 주소 작성
	public String main(@SessionAttribute("loginMember") Member loginMember, 
						Model model) {
		
		System.out.println(loginMember);
		model.addAttribute("loginMember",loginMember);
		
		String address = loginMember.getMemberAddress();
		model.addAttribute("address", address.substring(10,13));
		
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
	

//	@PostMapping("/sendingReview")
//	public int sendingReview(
//			List<String> checkedArr
//			
//			) {
//		
//		int result = 0;
//		return result;
//	}
	
}
