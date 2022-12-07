package edu.kh.banana.boardComplain.model.service;

import java.util.Map;

/** 게시글 신고 제출하기
 * @author gustj
 *
 */
public interface BoardComplainService {

	/** 게시글 신고
	 * @param submit
	 * @return result
	 */
	int reportsubmit(Map<String, Object> submit);

	
	/**게시글 신고 중복검사
	 * @param map
	 * @return
	 */
	int boardDuplication(Map<String, Object> map);


}
