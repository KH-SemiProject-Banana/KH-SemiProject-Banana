package edu.kh.banana.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.banana.board.model.dao.BoardDAO;
import edu.kh.banana.board.model.vo.Board;
import edu.kh.banana.board.model.vo.Pagination;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO dao;

	/**
	 * 특정 게시판 목록 조회 + 페이징 처리 계산
	 */
	@Override
	public Map<String, Object> selectBoardList(int boardCode, int cp) {
		
		// 1. 특정 게시판의 전체 게시글 수 조회
		// 2. 전체 게시글 수 + cp(current page)를 이용해 페이징처리 객체 생성
		// 3. 페이징 처리 객체를 이용해서 게시글 목록 조회
		
		int listCount = dao.getListCount(boardCode);
		Pagination pagination = new Pagination(listCount, cp);
		List<Board> boardList = dao.selectBoardList(pagination, boardCode);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		
		
		return map;
	}

	/**
	 * 게시판 타입 조회
	 */
	@Override
	public List<Map<String, Object>> selectBoardType() {

		return dao.selectBoardType();
	}
}
