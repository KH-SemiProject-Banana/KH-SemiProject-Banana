package edu.kh.banana.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.banana.member.model.service.MemberService;

@Controller
//@SessionAttributes({loginMember, "message"})
public class MemberController {
	
	@Autowired
	public MemberService service;
	
	
	
	// 상품 등록페이지
	@GetMapping("/member/goods-register")
	public String registerGoods() {
		return "member/goods-register";
	}
	
	
//	@PostMapping("/member/goods-register")
//	public String registerGoods() {
//		return null;
//	}

}
