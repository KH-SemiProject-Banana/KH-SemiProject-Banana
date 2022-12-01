package edu.kh.banana.member.model.service;


import java.util.List;
import java.util.Map;

import edu.kh.banana.member.model.vo.Member;
import edu.kh.banana.review.model.vo.Review;

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

	

	/**
	 * @param memberNo
	 * @return
	 */
	Map<String, Object> selectGoodsSoldList(int memberNo);



	int sendingMannerReview(List<String> goodCheckedArr,List<String> badCheckedArr, String reviewText, Member loginMember, int reviewGoodsNo,
			int reviewBuyerNo);

	/**내가 쓴 후기 조회
	 * @param ratingNo
	 * @return
	 */
	List<Review> selectSendingReview(int ratingNo);

	
}
