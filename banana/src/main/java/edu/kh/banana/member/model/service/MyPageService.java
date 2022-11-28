package edu.kh.banana.member.model.service;

import java.util.Map;

import edu.kh.banana.member.model.vo.Member;

public interface MyPageService {

	
	
	/** 마이페이지 자기소개 수정 
	 * @param member
	 * @return
	 */
	int changeIntroduce(Member member);

	/** 내 회원 정보 수정
	 * @param inputMember
	 * @return
	 */
	public abstract int updateInfo(Member inputMember);

	Map<String, Object> selectGoodsSoldLsit(int memberNo);

	
}
