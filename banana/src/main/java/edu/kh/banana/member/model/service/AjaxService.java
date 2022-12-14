package edu.kh.banana.member.model.service;



// 서비스 인터페이스 왜 만들었지?
// 설계, 유지보수성 향상, AOP 때문에
public interface AjaxService {
	
	/** 이메일 중복 검사
	 * @param memberEmail
	 * @return result
	 */
	int emailDupCheck(String memberEmail);

	/** 닉네임 중복 검사
	 * @param memberNickname
	 * @return result
	 */
	int nicknameDupCheck(String memberNickname);

	/** 전화번호 중복 검사
	 * @param memberTel
	 * @return result
	 */
	int telDupCheck(String memberTel);



}