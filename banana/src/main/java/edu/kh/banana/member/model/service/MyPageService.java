package edu.kh.banana.member.model.service;


import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

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

	

	/** 판매완료/판매중/구매완료 목록 조회
	 * @param memberNo
	 * @return
	 */
	//Map<String, Object> selectGoodsList(int memberNo); //기존 구문

	Map<String, Object> selectGoodsList(Map<String, Object> map1, int cp); //새로 만든 구문


	/**거래후기(REVIEW DB에 인서트) 한 다음에 그걸 가지고 매너후기 (REVIEW_RATIGN DB에 인서트)
	 * @param goodCheckedArr
	 * @param badCheckedArr
	 * @param reviewText
	 * @param loginMember
	 * @param reviewGoodsNo
	 * @param reviewBuyerNo
	 * @param reviewSellerNo
	 * @return
	 */
	int sendingMannerReview(List<String> goodCheckedArr,List<String> badCheckedArr, String reviewText, Member loginMember, int reviewGoodsNo,
			int reviewBuyerNo,int reviewSellerNo);

	/**내가 쓴 후기 조회
	 * @param ratingNo
	 * @return
	 */
	List<Review> selectSendingReview(int ratingNo);
	
	/** 프로필 이미지 수정
	 * @param webPath
	 * @param filePath
	 * @param profileImage
	 * @param loginMember
	 * @return
	 */
	int updateProfile(String webPath, String filePath, MultipartFile profileImage, Member loginMember)throws Exception;

	/**받은 거래후기 최신순3개를 조회하기
	 * @param loginMember
	 * @return
	 */
	Map<String, Object> selectNewestReviewList(int memberNo);

	/**(거래후기 목록 조회)
	 * @param map1
	 * @param cp
	 * @return
	 */
	Map<String, Object> reviewDetailList(Map<String, Object> map1, int cp);

	/**거래후기 전체 조회하기
	 * @param loginMember
	 * @param mannerCt
	 * @return
	 */
	List<Review> reviewList(Member loginMember, int mannerCt);

	/**받은 후기 조회하기
	 * @param map
	 * @return
	 */
	List<Review> selectReceivedReview(Map<String, Object> map);

	/**관심목록 조회하기
	 * @param memberNo
	 * @param cp
	 * @return
	 */
	Map<String, Object> myGoodsLikeList(int memberNo, int cp);

	/** 회원 탈퇴
	 * @param memberNo
	 * @return result
	 */
	int secessionSelect(int memberNo, Map<String, Object> parMap);

	/** 차단관리
	 * @param memberNo
	 * @return
	 */
	List<Member> selectDeleteMemberList(int memberNo);

	
	/** 회원 차단 해제
	 * @param blockedMemberNo
	 * @param loginMemberNo
	 * @return
	 */
	int memberBlockCancel(Map<String, Object> map);



	/*타인의 마이페이지*/
	
	//1. 타인의 정보를 가져온다.(닉네임/자기소개/프로필이미지/바나나온도)
	Member selectYourInfo(int memberNo);

	//좋은 매너후기만 가져올 거야
	List<Review> yourMannerList(int memberNo);


	


	
}
