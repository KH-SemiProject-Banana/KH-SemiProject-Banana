package edu.kh.banana.manager.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.banana.member.model.vo.Member;

public interface ManagerService {

	Member login(Member inputManager);

	/** 회원 목록 조회
	 * @param paramMap
	 * @return memberList
	 */
	List<Member> memberSearch(Map<String, Object> paramMap);

	/** 전체 회원 수 조회
	 * @return
	 */
	int memberCount();

}
