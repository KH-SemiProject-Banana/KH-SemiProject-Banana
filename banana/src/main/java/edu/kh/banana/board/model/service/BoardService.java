package edu.kh.banana.board.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.banana.board.model.vo.Board;

public interface BoardService {

	/** 특정 게시판 목록 조회 + 페이징 처리 계산
	 * @param boardCode
	 * @param cp
	 * @return Map<String, Object> map
	 */
	Map<String, Object> selectBoardList(int boardCode, int cp);

	/** 게시판 타입 조회
	 * @return boardTypeList
	 */
	List<Map<String, Object>> selectBoardType();

	
	
	
	/** 게시글 상세 조회
	 * @param boardNo
	 * @return board
	 */
	Board selectBoardDetail(int boardNo);

	
	
	/** 게시글 작성
	 * @param board
	 * @param imageList
	 * @param webPath
	 * @param folderPath
	 * @return boardNo
	 * @throws IOException 
	 */
	int boardWrite(Board board, List<MultipartFile> imageList, String webPath, String folderPath) throws IOException;

	
	
	/** 나의 문의/안내내역 조회
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectMyQuestion(int memberNo, int cp);

	
	/** 상세페이지 조회수 증가
	 * @param boardNo
	 * @return
	 */
	int updateReadCount(int boardNo);

}
