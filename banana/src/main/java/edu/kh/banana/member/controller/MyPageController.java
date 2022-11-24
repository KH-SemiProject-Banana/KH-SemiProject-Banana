package edu.kh.banana.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.banana.member.model.service.MyPageService;
import edu.kh.banana.member.model.vo.Member;
import oracle.jdbc.proxy.annotation.Post;

@RequestMapping("/member/myPage")
@Controller
public class MyPageController {
	

	@Autowired
	private MyPageService service;
	
	@GetMapping("/main") // 나머지 주소 작성
	public String main(@SessionAttribute("loginMember") Member loginMember, 
						Model model) {
		
		System.out.println(loginMember);
		model.addAttribute("loginMember",loginMember);
		
		String address = loginMember.getMemberAddress();
		model.addAttribute("address", address.substring(10,13));
		
		return "member/myPage_main";
	}
	
	@GetMapping("/review/good")
	public String reviewGood() {
		return "member/myPage_review_good";
	}
	
	@GetMapping("/review/detail")
	public String reviewDetail() {
		return "member/myPage_review_detail";
	}
//	@GetMapping("/review")
//	public String backToReview(
//			@RequestHeader(value = "referer") String referer
//			) {
//		return "redirect:" + referer;
//	}
	
	@GetMapping("/updateInfo")
	public String updateInfo() {
		return "member/myPage_UpdateInfo";
		
	}
	
	@GetMapping("/changeIntroduce")
	@ResponseBody
	public int changeIntroduce(
//			@RequestParam("introducew") String introducew,
			String introduce,
			@SessionAttribute("loginMember") Member loginMember
			) {
		
		Member member = new Member(); 
		
		member.setMemberNo(loginMember.getMemberNo());
		member.setIntroduce(introduce);
		loginMember.setIntroduce(introduce); // 세션 동기화
		
		int result = service.changeIntroduce(member);
//		System.out.println(result);
		return result;
	}
	
	
	// 내정보 수정
	@PostMapping("/updateInfo")
	public String updateInfo(Member inputMember,
							String[] memberAddress,
							@SessionAttribute("loginMember")Member loginMember,
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
		}else {
			 message = "회원 정보 수정 실패";	
		}		  
		
		ra.addFlashAttribute("message", message);
		return "redirect:updateInfo";
	}
	
	
	
	
	
}
