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


	 

	


	
}
