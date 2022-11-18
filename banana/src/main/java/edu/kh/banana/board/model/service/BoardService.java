package edu.kh.banana.board.model.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	/** 특정 게시판 목록 조회 + 페이징 처리 계산
	 * @param boardCode
	 * @param cp
	 * @return Map<String, Object> map
	 */
	Map<String, Object> selectBoardList(int boardCode, int cp);

	/** 게시판 타입 조회
	 * @return
	 */
	List<Map<String, Object>> selectBoardType();

}
