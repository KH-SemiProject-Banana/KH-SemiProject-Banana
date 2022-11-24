package edu.kh.banana.member.model.service;

import edu.kh.banana.member.model.vo.Member;

public interface MyPageService {

	int changeIntroduce(Member member);

	/** 내정보 수정
	 * @param inputMember
	 * @return
	 */
	public abstract int updateInfo(Member inputMember);

	
}
