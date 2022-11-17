package edu.kh.banana.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.banana.board.model.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/board/{boardCode}")
	public String selectBoardList(Model model,
			@PathVariable("boardCode") int boardCode,
			@RequestParam(value="cp", required=false, defaultValue="1") int cp
			) {
		Map<String, Object> map = service.selectBoardList(boardCode, cp);
		
		model.addAttribute("map", map);
		
		return "board/boardList";
	}

}
