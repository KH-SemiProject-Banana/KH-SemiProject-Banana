package edu.kh.banana.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.banana.board.model.service.BoardService;
import edu.kh.banana.board.model.vo.Board;
import edu.kh.banana.member.model.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	/** 특정 게시판 목록 조회
	 * @param model
	 * @param boardCode
	 * @param cp
	 * @return
	 */
	@GetMapping("/board/{boardCode}")
	public String selectBoardList(Model model,
			@PathVariable("boardCode") int boardCode,
			@RequestParam(value="cp", required=false, defaultValue="1") int cp
			) {
		Map<String, Object> map = service.selectBoardList(boardCode, cp);
		
		model.addAttribute("map", map);
		
		String path = null;
		if(boardCode == 1) {
			path = "board1";
		} else {
			path="boardList";
		}
		
		return "board/" + path;
	}
	
	
	
	
	// 게시글 상세 조회
	@GetMapping("/board/{boardCode}/{boardNo}")
	public String selectBoardDetail(@PathVariable("boardNo") int boardNo,
			@PathVariable("boardCode") int boardCode,
			Model model) {
		
		// 게시글 상세조회 서비스 호출
		Board board = service.selectBoardDetail(boardNo);
		model.addAttribute("board", board);
		// + 조회수 증가(쿠키 이용해서 해당 IP당 하루 1번)
		
		return "board/boardDetail";
	}

	
	
	// 게시글 작성 페이지로 이동
	@GetMapping("/write/{boardCode}")
	public String boardWrite(@PathVariable("boardCode") int boardCode) {
		
		
		return "board/boardWrite";
	}
	
	
	// 게시글 작성
	@PostMapping("/write/{boardCode}")
	public String boardWrite(@PathVariable("boardCode") int boardCode,
			@RequestHeader("referer") String referer,
			Board board,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam(value="images", required=false) List<MultipartFile> imageList,
			RedirectAttributes ra,
			HttpSession session
			
			) throws IOException {
		
		// 1. boardCode를 board객체에 셋팅
		board.setBoardCode(boardCode);
		
		// 2. 로그인한 회원의 번호를 board객체에 셋팅
		board.setMemberNo(loginMember.getMemberNo());
		
		// 3. 업로드된 파일의 웹 접근 경로 / 서버 내부 경로 준비
		String webPath = "/resources/images/board/";
		String folderPath = session.getServletContext().getRealPath(webPath);
		
		// 4. 게시글 삽입 서비스 호출
		int boardNo = service.boardWrite(board, imageList, webPath, folderPath);
		
		String message = null;
		String path = null;
		
		if(boardNo > 0) {
			
			message = "게시글이 등록되었습니다.";
			path = "/board/" + boardCode + "/" + boardNo; //   /board/1/2003
			
		} else {
			
			message = "게시글 등록 실패";
			path = referer;
		}
		
		ra.addFlashAttribute("message", message);
		
		
		return "redirect:" + path;
	}
}
