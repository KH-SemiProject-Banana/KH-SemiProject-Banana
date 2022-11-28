package edu.kh.banana.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.banana.board.model.vo.Board;
import edu.kh.banana.board.model.vo.BoardImage;
import edu.kh.banana.board.model.vo.Pagination;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

//	public Map<String, Object> selectBoardList(int boardCode, int cp) {
//
//
//		
//		return null;
//	}

	/** 특정 게시판의 게시글 수 조회
	 * @param boardCode
	 * @return
	 */
	public int getListCount(int boardCode) {
		
		return sqlSession.selectOne("boardMapper.getListCount", boardCode);
	}

	/** 특정 게시판 목록 조회
	 * @param pagination
	 * @param boardCode
	 * @return
	 */
	public List<Board> selectBoardList(Pagination pagination, int boardCode) {

		// RowBounds 객체(마이바티스) 
		// - 여러 행 조회 결과 중 특정 위치부터 지정된 행의 갯수만 조회하는 객체
		// 특정 위치 : 몇 행을 건너뛸 것인가?(ex- 21-30번부터 조회 --> 20개를 건너뜀)
		
		// limit : 한 페이지 목록에 보여지는 게시글 수
		// offset : 건너뛸 페이지 수
		
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("boardMapper.selectBoardList", boardCode, rowBounds);
	}


	
	/** 게시판 목록 조회
	 * @return boardTypeList
	 */
	public List<Map<String, Object>> selectBoardType() {
		
		return sqlSession.selectList("boardMapper.selectBoardType");
	}

	/** 게시글 상세조회 + 댓글 목록 조회
	 * @param boardNo
	 * @return board
	 */
	public Board selectBoardDetail(int boardNo) {
		
		return sqlSession.selectOne("boardMapper.selectBoardDetail", boardNo);
	}

	/** 게시글만 삽입
	 * @param board
	 * @return
	 */
	public int boardWrite(Board board) {
		
		int result = sqlSession.insert("boardMapper.boardWrite", board);
		
		if(result > 0) {
			result = board.getBoardNo();
		}
		
		return result;
	}

	/** 이미지만 삽입
	 * @param boardImageList
	 * @return result(삽입된 행의 갯수)
	 */
	public int insertBoardImageList(List<BoardImage> boardImageList) {
		
		return sqlSession.insert("boardMapper.insertBoardImageList", boardImageList);
	}

	/** 나의 문의/안내내역 게시판의 게시글 수 조회
	 * @param memberNo
	 * @param cp
	 * @return
	 */
	public int getMyQuestionListCount(int memberNo) {
		
		return sqlSession.selectOne("boardMapper.getMyQuestionListCount", memberNo);
	}
	
	

	/**나의 문의/안내내역 게시판의 게시글 리스트 조회
	 * @param pagination
	 * @param memberNo
	 * @return
	 */
	public List<Board> selectMyQuestionList(Pagination pagination, int memberNo) {
		
		int offset = (pagination.getCurrentPage() -1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("boardMapper.selectMyQuestionList", memberNo, rowBounds);
	}

	/** 게시글 상세페이지 조회수 증가
	 * @param boardNo
	 * @return
	 */
	public int updateReadCount(int boardNo) {
		
		return sqlSession.update("boardMapper.updateReadCount", boardNo);
	}

	/** 게시글 내용만 수정
	 * @param board
	 */
	public int boardUpdate(Board board) {

		return sqlSession.update("boardMapper.boardUpdate", board);
		
	}

	/** 게시글 이미지만 삭제
	 * @param condition
	 * @return
	 */
	public int boardImageDelete(String condition) {
		
		return sqlSession.delete("boardMapper.boardImageDelete", condition);
	}

	/** 게시글 삭제
	 * @param boardNo
	 * @return
	 */
	public int boardDelete(int boardNo) {
		
		return sqlSession.update("boardMapper.boardDelete", boardNo);
	}

	/** 게시글 이미지만 수정
	 * @param img
	 * @return
	 */
	public int boardImageUpdate(BoardImage img) {
		
		return sqlSession.update("boardMapper.boardImageUpdate", img);
	}

	/** 게시글 이미지 수정-새 이미지 삽입
	 * @param img
	 * @return
	 */
	public int boardImageInsert(BoardImage img) {
		
		return sqlSession.insert("boardMapper.boardImageInsert", img);
	}
}
