package edu.kh.banana.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.kh.banana.member.model.service.AjaxService;

@Controller // 요청 -> 알맞은 서비스 -> 결과 반환 -> 알맞은 view 응답 제어역할 + bean 등록
public class AjaxController {
	
	private AjaxService service;
	
	   //이메일 중복 검사
	   @GetMapping("/emailDupCheck")
	   @ResponseBody 
	   public int emailDupCheck(String memberEmail) {
	      
		      int result = service.emailDupCheck(memberEmail);
		      
		      return result;
		   }
	   
	   
	   
	   
}
      