package edu.kh.banana.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.banana.manager.model.service.ManagerService;
import edu.kh.banana.member.model.vo.Member;

@Controller
@SessionAttributes({"loginManager", "message"})
@RequestMapping("/manager")
public class ManagerController {
	
	
	@Autowired
	private ManagerService service;
	
	
	@GetMapping("/login")
	public String managerLoginPage() {
		
		return "manager/managerLogin";
	}
	
	@PostMapping("/login")
	public String login(Member inputManager,
			Model model,
			RedirectAttributes ra
			) {
		
		Member loginManager = service.login(inputManager);
		
		
		if(loginManager != null) {
			
			model.addAttribute("loginManager", loginManager);
			return "manager/manager-main";
			
		} else {
			model.addAttribute("message", "관리자 로그인 실패");
			return "redirect:/";
		}
		
	}
	
	/** 관리자 페이지 회원 메뉴 이동
	 * @return
	 */
	@GetMapping("/main")
	public String managerMain() {
		return "manager/manager-main";
	}
	
	/** 관리자 페이지 상품 메뉴 이동
	 * @return
	 */
	@GetMapping("/goods")
	public String managerGoods() {
		return "manager/manager-goods";
	}
	/** 관리자 페이지 게시판 메뉴 이동
	 * @return
	 */
	@GetMapping("/board")
	public String managerBoard() {
		return "manager/manager-board";
	}


}
