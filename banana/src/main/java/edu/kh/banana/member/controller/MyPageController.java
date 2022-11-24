package edu.kh.banana.member.controller;

import java.util.List;

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

import edu.kh.banana.member.model.service.MyPageService;
import edu.kh.banana.member.model.vo.Member;

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

	
	@GetMapping("/updateInfo")
	public String updateInfo() {
		return "member/myPage_UpdateInfo";
		
	}
	
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
		System.out.println(result);
		return result;
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
