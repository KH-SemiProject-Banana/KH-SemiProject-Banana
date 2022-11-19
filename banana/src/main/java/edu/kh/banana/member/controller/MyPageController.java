package edu.kh.banana.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.banana.member.model.service.MyPageService;

@RequestMapping("/member/myPage")
@Controller
public class MyPageController {
	

	@Autowired
	private MyPageService service;
	
	@GetMapping("/main") // 나머지 주소 작성
	public String main() {
		return "member/myPage-info";
	}
	
}
