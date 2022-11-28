package edu.kh.banana.member.model.service;

import java.util.Map;

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

	/** 회원 ID/PW 찾기 회원조회
	 * @param paramMap
	 * @return
	 */
	String infoFindSelect(Map<String, Object> paramMap);

	/** 임시 비밀번호 생성 및 저장
	 * @param authKey
	 * @param inputEmail 
	 * @return
	 */
	int findEmailPw(String authKey, String result);



}
