package edu.kh.banana.member.model.service;

import edu.kh.banana.member.model.vo.Member;

public interface MemberService {

	/** 로그인 서비스
	 * @param inputMember
	 * @return result
	 */
	Member login(Member inputMember);

	/** 회원가입 입력 정보 제출서비스
	 * @param inputMember
	 * @return
	 */
	int signUp(Member inputMember);

}
