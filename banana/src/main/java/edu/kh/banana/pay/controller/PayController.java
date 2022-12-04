package edu.kh.banana.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import edu.kh.banana.member.model.vo.Member;
import edu.kh.banana.pay.model.service.PayService;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private PayService service;
	
	@GetMapping("/main")
	public String payMain(@SessionAttribute("loginMember") Member loginMember) {
		
		return "pay/bananaPay";
	}

}
