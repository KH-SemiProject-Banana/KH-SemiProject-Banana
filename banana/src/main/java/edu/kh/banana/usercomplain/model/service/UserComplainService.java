package edu.kh.banana.usercomplain.model.service;

import java.util.Map;

public interface UserComplainService {
	
	int userReportSubmit(Map<String, Object> submit);

	int userDuplication(Map<String, Object> map);

	/** 유저 블락
	 * @param memberNo
	 * @param userBlocked
	 * @return result
	 */
	int userBlock(int memberNo, int userBlocked);

}
