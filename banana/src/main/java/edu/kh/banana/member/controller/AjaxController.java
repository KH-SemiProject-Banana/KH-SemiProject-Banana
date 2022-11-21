package edu.kh.banana.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.kh.banana.member.model.service.AjaxService;

@Controller 
public class AjaxController {
	
	@Autowired
	private AjaxService service;
	
	   //  회원가입 이메일 중복 검사
	   @GetMapping("/emailDupCheck")
	   @ResponseBody 
	   public int emailDupCheck(String memberEmail) {
	      
		      int result = service.emailDupCheck(memberEmail);
		      
		      return result;
		   }
	   
	   // 회원가입 닉네임 중복검사 
	   @GetMapping("/nicknameDupCheck")
	   @ResponseBody
	   public int nicknameDupCheck(String memberNickname) {
		   
		   int result = service.nicknameDupCheck(memberNickname);
		   
		   return result;
	   }
	   
	   
}
      