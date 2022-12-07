package edu.kh.banana.manager.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.banana.board.model.vo.Board;
import edu.kh.banana.board.model.vo.Pagination;
import edu.kh.banana.goods.model.vo.GoodsSell;
import edu.kh.banana.member.model.vo.Member;

@Repository
public class ManagerDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member login(String memberEmail) {
		
		return sqlSession.selectOne("memberMapper.managerLogin", memberEmail);
	}

	/** 고객센터-자주묻는 질문 추가
	 * @param board
	 * @return result
	 */
	public int editBoard1(Board board) {
		
		return sqlSession.insert("boardMapper.boardWrite", board);
	}

	/** 회원 목록 조회
	 * @param paramMap
	 * @return memberList
	 */
	public List<Member> memberSearch(Pagination pagination, Map<String , Object> paramMap) {
		
		int offset = (pagination.getCurrentPage() -1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("memberMapper.admin-memberSearch", paramMap, rowBounds);
	}

	/** 전체 회원 수 조회
	 * @return
	 */
	public int memberCount() {
		
		return sqlSession.selectOne("memberMapper.memberCount");
	}

	/** 특정 조건 회원 수 조회
	 * @param paramMap
	 * @return
	 */
	public int getMemberListCount(Map<String, Object> paramMap) {
		
		return sqlSession.selectOne("memberMapper.getMemberListCount", paramMap);
	}
	
	

	/** 회원 정보 수정
	 * @param member
	 * @return
	 */
	public int memberEdit(Member member) {
		
		return sqlSession.update("memberMapper.memberEdit", member);
	}

	/** 회원 정보 삭제
	 * @param memberNo
	 * @return result
	 */
	public int memberDelete(int memberNo) {
		
		return sqlSession.update("memberMapper.memberDelete", memberNo);
	}
	
	/** 회원 정보 삭제 복구
	 * @param memberNo
	 * @return result
	 */
	public int memberDeleteBack(int memberNo) {
		
		return sqlSession.update("memberMapper.memberDeleteBack", memberNo);
	}
	
	
	/** 회원 차단
	 * @param memberNo
	 * @return result
	 */
	public int memberBlock(int memberNo) {
		
		return sqlSession.update("memberMapper.memberBlock", memberNo);
	}
	
	/** 회원 차단 해제
	 * @param memberNo
	 * @return result
	 */
	public int memberBlockBack(int memberNo) {
		
		return sqlSession.update("memberMapper.memberBlockBack", memberNo);
	}

	/** 조건에 맞는 상품 갯수 조회
	 * @param paramMap
	 * @return listCount
	 */
	public int getGoodsListCount(Map<String, Object> paramMap) {
		
		return sqlSession.selectOne("goodsMapper.getGoodsCount", paramMap);
	}

	/** 전체 상품 갯수 조회
	 * @return allMemberCount
	 */
	public int allGoodsCount() {
		
		return sqlSession.selectOne("goodsMapper.allGoodsCount");
	}

	/** 조건에 맞는 상품 목록 조회
	 * @param pagination
	 * @param paramMap
	 * @return
	 */
	public List<GoodsSell> goodsSearch(Pagination pagination, Map<String, Object> paramMap) {
		
		int offset = (pagination.getCurrentPage() -1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("goodsMapper.admin-goodsSearch", paramMap, rowBounds);
	}

	/** 상품 삭제
	 * @param goodsNo
	 * @return
	 */
	public int goodsDelete(int goodsNo) {
		
		return sqlSession.update("goodsMapper.goodsDelete", goodsNo);
	}
	
	/** 상품 삭제 복구
	 * @param goodsNo
	 * @return
	 */
	public int goodsDeleteBack(int goodsNo) {
		
		return sqlSession.update("goodsMapper.goodsDeleteBack", goodsNo);
	}

	/** 조건에 맞는 게시글 목록
	 * @param paramMap
	 * @return
	 */
	public int getBoardListCount(Map<String, Object> paramMap) {
		
		return sqlSession.selectOne("boardMapper.getBoardListCount", paramMap);
	}

	/** 전체 게시글 수 조회
	 * @return
	 */
	public int allBoardCount() {
		
		return sqlSession.selectOne("boardMapper.allBoardCount");
	}

	/** 조건에 맞는 게시글 목록 조회
	 * @param pagination
	 * @param paramMap
	 * @return
	 */
	public List<Board> boardSearch(Pagination pagination, Map<String, Object> paramMap) {
		
		int offset = (pagination.getCurrentPage() -1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("boardMapper.admin-boardSearch", paramMap, rowBounds);
	}
	
	/** 게시글 삭제
	 * @param goodsNo
	 * @return
	 */
	public int boardDelete(int boardNo) {
		
		return sqlSession.update("boardMapper.boardDelete", boardNo);
	}
	
	/** 게시글 삭제 복구
	 * @param goodsNo
	 * @return
	 */
	public int boardDeleteBack(int boardNo) {
		
		return sqlSession.update("boardMapper.boardDeleteBack", boardNo);
	}

	

}
