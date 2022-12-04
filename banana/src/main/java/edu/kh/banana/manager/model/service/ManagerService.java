package edu.kh.banana.manager.model.service;

import edu.kh.banana.board.model.vo.Board;
import edu.kh.banana.member.model.vo.Member;

public interface ManagerService {

	Member login(Member inputManager);

	
	
	/** 고객센터-자주묻는 질문 추가
	 * @param board
	 * @return result
	 */
	int editBoard1(Board board);

}
