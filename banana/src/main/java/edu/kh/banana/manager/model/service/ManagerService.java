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
	Map<String, Object> memberSearch(Map<String, Object> paramMap, int cp);

	/** 회원 정보 수정
	 * @param member
	 * @return
	 */
	int memberEdit(Member member);



}
