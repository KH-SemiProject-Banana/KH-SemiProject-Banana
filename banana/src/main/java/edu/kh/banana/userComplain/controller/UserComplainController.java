package edu.kh.banana.userComplain.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.banana.member.model.vo.Member;
import edu.kh.banana.userComplain.model.service.UserComplainService;

@Controller
public class UserComplainController {

	@Autowired
	private UserComplainService service;
	
	/*
	 * @GetMapping("/usercomplain") public String userReport() {
	 * 
	 * return "usercomplain/usercomplain"; }
	 */
	
	
	// 신고 중복 안되게
	// 어케하누?
	// 디비에서 로그인 한사람의 회원 번호로 신고 한 사람을 다 꺼내와서 신고 당한사람 회원번호랑 일치할때 인서트 중복안되게 막음
	
	@GetMapping("/duplicateCheck")
	@ResponseBody
	public int duplicateCheck (int category1, int category2 ) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category1", category1);
		map.put("category2", category2);
		
		int result =  service.userDuplication(map);  
		return result;
	}
	
	
	
	@PostMapping("/userreportsubmit")
	public String userReportSubmit(@RequestParam Map<String, Object> submit, 
									@SessionAttribute("loginmember") Member loginmember,
									RedirectAttributes ra,
									@RequestHeader("referer") String referer
									/*@PathVariable("complained) int complained*/
									) {
		
		
		
		int complained = 15; // 나중에 수정(@PathVariable)
		
		submit.put("complained", complained);
		
		int result = service.userReportSubmit(submit);
		String message = null;
		
		if (result > 0) {
			message = "신고를 성공하였습니다.";
			
		}else {
			message = "신고를 실패하였습니다.";
		}
		
		ra.addFlashAttribute("message", message);
		return "redirect:/member/bananaTalk";
	}
	
	
}
