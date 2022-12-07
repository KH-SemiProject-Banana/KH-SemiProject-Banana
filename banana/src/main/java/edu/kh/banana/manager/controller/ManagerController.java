package edu.kh.banana.manager.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.banana.board.model.vo.Board;
import edu.kh.banana.manager.model.service.ManagerService;
import edu.kh.banana.member.model.service.MemberService;
import edu.kh.banana.member.model.vo.Member;

/**
 * @author User
 *
 */
/**
 * @author User
 *
 */
@Controller
@SessionAttributes({"loginManager", "message"})
@RequestMapping("/manager")
public class ManagerController {
	
	
	@Autowired
	private ManagerService service;
	
	@Autowired
	private MemberService memberService;
	
	
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
	
	
	/** 고객센터-자주묻는질문 편집
	 * @param board
	 * @return result
	 */
	@GetMapping("/editBoard1")
	@ResponseBody
	public int editBoard1(Board board) {
		
		
		return service.editBoard1(board);
	}

	
	/** 회원 목록 조회
	 * @param paramMap
	 * @param model
	 * @return
	 */
	@GetMapping("/memberSearch")
	public String memberSearch(@RequestParam Map<String, Object> paramMap,
			@RequestParam(value="cp", required=false, defaultValue="1" ) int cp,
//			@RequestParam(value="sort", required=false, defaultValue="1") String sort,
			Model model
			) {
		
		// 조건이 있는 회원 목록 조회
		Map<String, Object> map = service.memberSearch(paramMap, cp);
		
		

		
		model.addAttribute("map", map);

		
		
		
		return "manager/manager-main";
	}
	
	/** 회원 정보 수정
	 * @param member
	 * @return result
	 */
	@GetMapping("/managerEdit")
	@ResponseBody
	public int memberEdit(Member member) {
		
		return service.memberEdit(member);
	}
	
	
	/** 회원 정보 삭제
	 * @param memberNo
	 * @return result
	 */
	@GetMapping("/memberDelete")
	@ResponseBody
	public int memberDelete(int memberNo) {
		return service.memberDelete(memberNo);
	}
	
	/** 회원 정보 삭제 복구
	 * @param memberNo
	 * @return result
	 */
	@GetMapping("/memberDeleteBack")
	@ResponseBody
	public int memberDeleteBack(int memberNo) {
		return service.memberDeleteBack(memberNo);
	}
	
	/** 회원 정보 차단
	 * @param memberNo
	 * @return result
	 */
	@GetMapping("/memberBlock")
	@ResponseBody
	public int memberBlock(int memberNo) {
		return service.memberBlock(memberNo);
	}
	
	/** 회원 정보 차단해제
	 * @param memberNo
	 * @return result
	 */
	@GetMapping("/memberBlockBack")
	@ResponseBody
	public int memberBlockBack(int memberNo) {
		return service.memberBlockBack(memberNo);
	}
	
	/** 회원 등록
	 * @param member
	 * @return result
	 */
	@PostMapping("/memberSignUp")
	@ResponseBody
	public int memberSignUp(Member member) {
		int result = memberService.signUp(member);
		return result;
	}
	
	/** 상품 목록 조회
	 * @param paramMap
	 * @param model
	 * @return
	 */
	@GetMapping("/goodsSearch")
	public String goodsSearch(@RequestParam Map<String, Object> paramMap,
			@RequestParam(value="cp", required=false, defaultValue="1" ) int cp,
			Model model
			) {
		
		// 조건이 있는 회원 목록 조회
		Map<String, Object> map = service.goodsSearch(paramMap, cp);
		
		

		
		model.addAttribute("map", map);

		
		
		
		return "manager/manager-goods";
	}
	
	/** 상품 삭제
	 * @param goodsNo
	 * @return
	 */
	@GetMapping("/goodsDelete")
	@ResponseBody
	public int goodsDelete(int goodsNo) {
		
		return service.goodsDelete(goodsNo);
	}
	
	/** 상품 삭제 취소
	 * @param goodsNo
	 * @return
	 */
	@GetMapping("/goodsDeleteBack")
	@ResponseBody
	public int goodsDeleteBack(int goodsNo) {
		
		return service.goodsDeleteBack(goodsNo);
	}
	
	
	@GetMapping("/manager/goodsUpdate/{goodsNo}")
	public String goodsUpdate(@PathVariable("goodsNo") int goodsNo,
			RedirectAttributes ra) {
		
		ra.addFlashAttribute("goodsNo", goodsNo);
		
		return null;
	}
	
	
	/** 게시글 목록 조회
	 * @param paramMap
	 * @param model
	 * @return
	 */
	@GetMapping("/boardSearch")
	public String boardSearch(@RequestParam Map<String, Object> paramMap,
			@RequestParam(value="cp", required=false, defaultValue="1" ) int cp,
			Model model
			) {
		
		// 조건이 있는 게시글 목록 조회
		Map<String, Object> map = service.boardSearch(paramMap, cp);
		
		

		
		model.addAttribute("map", map);

		
		
		
		return "manager/manager-board";
	}
	
	

	
	
	/** 게시글 삭제
	 * @param goodsNo
	 * @return
	 */
	@GetMapping("/boardDelete")
	@ResponseBody
	public int boardDelete(int boardNo) {
		
		return service.boardDelete(boardNo);
	}
	
	/** 게시글 삭제 취소
	 * @param goodsNo
	 * @return
	 */
	@GetMapping("/boardDeleteBack")
	@ResponseBody
	public int boardDeleteBack(int boardNo) {
		
		return service.boardDeleteBack(boardNo);
	}
	

}
