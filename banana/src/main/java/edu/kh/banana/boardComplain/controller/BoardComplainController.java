package edu.kh.banana.boardcomplain.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.banana.boardcomplain.model.service.BoardComplainService;
import edu.kh.banana.member.model.vo.Member;

@Controller
public class BoardComplainController {

	@Autowired
	private BoardComplainService service;
	
	@GetMapping("/boardcomplain")
	public String report() {
		
		return "board/boardcomplain";
	}
	
	@GetMapping("/duplicateCheck2")
	@ResponseBody
	public int duplicateCheck (int category1, int category2 ) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category1", category1);
		map.put("category2", category2);
		
		int result =  service.boardDuplication(map);  
		return result;
	}
	
	
	@PostMapping("/reportsubmit")
	public String reportSubmit(@RequestParam Map<String, Object> submit,
								@SessionAttribute("loginMember") Member loginMember,
								RedirectAttributes ra ,
								@RequestHeader("referer") String referer) {
		
		
		submit.put("memberNo", loginMember.getMemberNo());
		
		
		System.out.println(submit);
		// int complained 사용하기
		int result = service.reportsubmit(submit);
		
		String message = null;
		
		if (result > 0) {
			message = "신고를 성공하였습니다.";
			
		}else {
			message = "신고를 실패하였습니다.";
		}
		
		ra.addFlashAttribute("message", message);
		return "redirect:/board/boardDetail";
		
		
	}
	
	@GetMapping("/usercomplain")
	public String userReport(/*@PathVariable("otherUserNo") int otherUserNo*/) {
		
		return "usercomplain/usercomplain";
	}
}
