package edu.kh.banana.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import edu.kh.banana.member.model.service.MyPageService;
import edu.kh.banana.member.model.vo.Member;

//@RequestMapping("/member/myPage")
@Controller
public class MyPageController {
	

	@Autowired
	private MyPageService service;
	
	@GetMapping("/member/myPage/main") // 나머지 주소 작성
	public String main(@SessionAttribute("loginMember") Member loginMember, 
						Model model) {
		
		System.out.println(loginMember);
		model.addAttribute("loginMember",loginMember);
		
		String address = loginMember.getMemberAddress();
		model.addAttribute("address", address.substring(10,13));
		
		return "member/myPage_main";
	}
	
}
