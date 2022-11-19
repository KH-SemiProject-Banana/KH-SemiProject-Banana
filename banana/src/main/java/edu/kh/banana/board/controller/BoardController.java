package edu.kh.banana.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.banana.board.model.service.BoardService;
import edu.kh.banana.board.model.vo.Board;

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
		
		return "board/boardList";
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

}
