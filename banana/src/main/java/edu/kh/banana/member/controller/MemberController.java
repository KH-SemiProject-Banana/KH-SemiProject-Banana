package edu.kh.banana.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.banana.member.model.service.MemberService;
import edu.kh.banana.member.model.vo.Member;

/**
 * @author gyehd
 *
 */
@Controller
@SessionAttributes({"loginMember", "message"})
public class MemberController {
	
	@Autowired
	public MemberService service;
	
	

	
	
	/** 로그인
	 * @return
	 */
	@GetMapping("/member/login") 
	public String loginPage() {
		return "member/login"; 
	}
	
	/** 로그인
	 * @param inputMember
	 * @param model
	 * @param ra
	 * @param saveId
	 * @param resp
	 * @param referer
	 * @return
	 */
	@PostMapping("/member/login")
	public String login(/*@ModelAttribute*/ Member inputMember,
				Model  model, RedirectAttributes ra, @RequestParam(value="saveId", required=false) String saveId,
				HttpServletResponse resp, @RequestHeader(value="referer") String referer) { 
		
		
		Member loginMember = service.login(inputMember);
		
		String path = null;
		
		if(loginMember != null) {
			
			path = "/";
			
			model.addAttribute("loginMember", loginMember);
			
			Cookie cookie = new Cookie("saveId", loginMember.getMemberEmail());
			
			if(saveId != null) {
				cookie.setMaxAge(60*60*24*365);
			} else {
				cookie.setMaxAge(0);
			}
			
			cookie.setPath("/");
			
			resp.addCookie(cookie);
		} else {
			
			path = referer;
			
			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다");
		}
		
		return "redirect:" + path;
	}
	
	
	/** 로그아웃
	 * @param status
	 * @return
	 */
	@GetMapping("/member/logout")
	public String logout(SessionStatus status){
		status.setComplete();
		return "redirect:/";
	}
	
	/** 회원가입 동의 페이지 이동
	 * @return
	 */
	@GetMapping("/member/signUp/agreement")
	public String signUpAgreement() {
		return "member/SignUpAgreement";
	}
	
	/** 회원가입 정보입력 페이지 이동
	 * @return
	 */
	@GetMapping("/member/signUp/info")
	public String signUpInfo() {
		return "member/SignUpInfo";
	}
	
	/** 회원가입 입력 정보 제출
	 * @return
	 */
	@PostMapping("/member/signUp/info")
	public String signUp(/* @ModelAttribute */ Member inputMember,
						String[] memberAddress,
						RedirectAttributes ra,
						@RequestHeader("referer") String referer) {
		 
		if (inputMember.getMemberAddress().equals(",,")) {
			inputMember.setMemberAddress(null);
			
		}else {
			inputMember.setMemberAddress(String.join(",,", memberAddress));
		}
		
		int result = service.signUp(inputMember);
		
		String path = null;
		String message = null;
		
		if (result > 0) { //회원가입 성공
			path = "/";
			message = "회원가입 성공했습니다.";
			 
		} else { //회원가입 실패
			path = referer;
			message = "회원가입 도중 문제가 발생하여 실패하였습니다.";
			
			inputMember.setMemberPw(null); 
			ra.addFlashAttribute("tempMember", inputMember);
		}
		
		ra.addFlashAttribute("message",message);
		return "redirect:"+ path;
	} 
	
	
	/** 회원 ID/PW 찾기 페이지로 이동
	 * @return
	 */
	@GetMapping("/member/infoFind")
	public String infoFind() {
		return "member/memberFindIdPw";
	}
	
	
	
	
	
}
