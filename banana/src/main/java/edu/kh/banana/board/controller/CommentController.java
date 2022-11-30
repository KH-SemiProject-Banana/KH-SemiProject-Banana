package edu.kh.banana.board.controller;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import edu.kh.banana.board.model.service.CommentService;
import edu.kh.banana.board.model.vo.Comment;

@RestController
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	private CommentService service;
	
	
	// 댓글 목록 조회
	@GetMapping("/list")
	public String selectCommentList(int boardNo) {
		
		List<Comment> rList = service.selectCommentList(boardNo);
		
		
		return new Gson().toJson(rList);
	}
	
	
	// 댓글 등록
	@PostMapping("/insert")
	public int insertComment(Comment comment) { // commentContent, memberNo, boardNo
		
		int result = service.insertComment(comment);
		
		
		
		return result;
	}
	
	// 댓글 삭제
	@GetMapping("/delete")
	public int deleteComment(int commentNo) {
		
		int result = service.deleteComment(commentNo);
		return result;
	}
	
	// 댓글 수정
	@PostMapping("/update")
	public int updateComment(Comment comment) {
		
		int result = service.updateComment(comment);
		
		return result;
	}
}
