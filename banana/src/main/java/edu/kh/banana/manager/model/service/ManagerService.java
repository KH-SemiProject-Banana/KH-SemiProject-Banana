package edu.kh.banana.manager.model.service;

import edu.kh.banana.board.model.vo.Board;
import java.util.List;
import java.util.Map;

import edu.kh.banana.member.model.vo.Member;

public interface ManagerService {

	Member login(Member inputManager);

	
	
	/** 고객센터-자주묻는 질문 추가
	 * @param board
	 * @return result
	 */
	int editBoard1(Board board);
	
	/** 회원 목록 조회
	 * @param paramMap
	 * @return memberList
	 */
	Map<String, Object> memberSearch(Map<String, Object> paramMap, int cp);

	
	/** 회원 정보 수정
	 * @param member
	 * @return
	 */
	int memberEdit(Member member);

	
	/** 회원 정보 삭제
	 * @param memberNo
	 * @return
	 */
	int memberDelete(int memberNo);
	
	/** 회원 정보 삭제 복구
	 * @param memberNo
	 * @return
	 */
	int memberDeleteBack(int memberNo);
	
	
	/** 회원 차단
	 * @param memberNo
	 * @return
	 */
	int memberBlock(int memberNo);
	
	/** 회원 차단 해제
	 * @param memberNo
	 * @return
	 */
	int memberBlockBack(int memberNo);

	/** 상품 목록 조회
	 * @param paramMap
	 * @param cp
	 * @return
	 */
	Map<String, Object> goodsSearch(Map<String, Object> paramMap, int cp);

	/** 상품 삭제
	 * @param goodsNo
	 * @return
	 */
	int goodsDelete(int goodsNo);

	
	/** 상품 삭제 복구
	 * @param goodsNo
	 * @return
	 */
	int goodsDeleteBack(int goodsNo);





}
