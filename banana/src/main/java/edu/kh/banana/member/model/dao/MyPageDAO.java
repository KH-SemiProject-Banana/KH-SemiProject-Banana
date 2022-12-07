package edu.kh.banana.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.banana.goods.model.vo.GoodsSell;
import edu.kh.banana.member.model.vo.Member;
import edu.kh.banana.member.model.vo.MypageDetailPagination;
import edu.kh.banana.member.model.vo.MypagePagination;
import edu.kh.banana.review.model.vo.Review;

@Repository
public class MyPageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	/** 마이페이지 자기소개 수정 
	 * @param member
	 * @return
	 */
	public int changeIntroduce(Member member) {
		return sqlSession.update("myPageMapper.changeIntroduce",member);
	}

	/** 내 회원 정보 수정 (비밀번호 포함)
	 * @param inputMember
	 * @return
	 */
	public int updateInfoPw(Member inputMember) {
		return sqlSession.update("myPageMapper.updateInfoPw",inputMember);
	}

	/** 내 회원 정보 수정 (비밀번호 제외)
	 * @param inputMember
	 * @return
	 */
	public int updateInfoNoPw(Member inputMember) {
		return sqlSession.update("myPageMapper.updateInfoNoPw",inputMember);
	}

	
	/** 판매완료/판매중/구매완료한 내 게시글의 수 조회
	 * @param memberNo
	 * @return
	 */
	public int getListCount(Map<String, Object> map1) {
		
		return sqlSession.selectOne("myPageMapper.getListCount", map1);
	}
	

	/**판매완료/판매중/구매완료한 내 게시글의 목록 조회
	 * @param map1
	 * @return
	 */
	public List<GoodsSell> selectGoodsSoldList(Map<String, Object> map1, MypagePagination pagination) {
		
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset,pagination.getLimit());
		
		return sqlSession.selectList("myPageMapper.selectGoodsSoldList",map1,rowBounds);
	}
		
	


	/** 1. 거래후기를 REVIEW에 인서트하고 그 후기번호 가져오기
	 * @param review
	 * @return
	 */
	public int insertReview(Review review) {
		
		int result = sqlSession.insert("myPageMapper.insertReview",review);
		
		if(result>0) {
			result = review.getRatingNo();
		}
		
		return result; //0또는 삽입된 ratingNo;
	}

	/**2-1. 최고예요 체크한 경우 (좋은 후기), REVIEW_RATING에 거래후기 인서트
	 * @param map
	 * @return
	 */
	public int insertgoodManner(Map<String, Object> map) {
		
		return sqlSession.insert("myPageMapper.insertgoodManner",map);
	}

	/**2-2. 별로예요 체크한 경우 (나쁜 후기), REVIEW_RATING에 거래후기 인서트
	 * @param map
	 * @return
	 */
	public int insertbadManner(Map<String, Object> map) {
		
		return sqlSession.insert("myPageMapper.insertbadManner",map);
	}

	/**3-1. 최고예요 체크한 경우 (좋은 후기), 각 체크된 개수만큼 매너온도 올리기(UPDATE)
	 * @param goodResult
	 * @param reviewBuyerNo
	 * @return
	 */
	public int updateGood(int goodResult, int reviewBuyerNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("goodResult", goodResult);
		map.put("reviewBuyerNo", reviewBuyerNo);
		return sqlSession.update("myPageMapper.updateGood", map);
	}

	/**3-2. 별로예요 체크한 경우 (나쁜 후기), 각 체크된 개수만큼 매너온도 올리기(UPDATE)
	 * @param badResult
	 * @param reviewBuyerNo
	 * @return
	 */
	public int updateBad(int badResult, int reviewBuyerNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("badResult", badResult);
		map.put("reviewBuyerNo", reviewBuyerNo);
		return sqlSession.update("myPageMapper.updateBad", map);
	}

	/**내가 쓴 후기 조회
	 * @param ratingNo
	 * @return
	 */
	public List<Review> selectSendingReview(int ratingNo) {
		
		return sqlSession.selectList("myPageMapper.selectSendingReview",ratingNo);
	}

	/** 프로필 이미지를 수정
	 * @param loginMember
	 * @return
	 */
	public int updateProfile(Member loginMember) {
		
		return sqlSession.update("myPageMapper.updateProfile", loginMember);
		
	}

	/**받은 거래후기 최신순3개를 조회하기
	 * @param loginMember
	 * @return
	 */
	public List<Review> selectNewestReviewList(Member loginMember) {
		
		return sqlSession.selectList("myPageMapper.selectNewestReviewList",loginMember);
	}
	/** 회원 탈퇴
	 * @param memberNo
	 * @return result
	 */
	public int secession(int memberNo) {
		return sqlSession.update("myPageMapper.secession",memberNo);
	}

	/** 회원탈퇴 회원 조회
	 * @param memberNo
	 * @return 
	 */
	public Member secessionSelect(int memberNo) {
		return sqlSession.selectOne("memberMapper.secessionSelect", memberNo);
	}

	/** 회원 탈퇴
	 * @param memberNo
	 * @return
	 */
	public int secessionDelete(int memberNo) {
		return sqlSession.update("memberMapper.secessionDelete",memberNo);
	}


	/** (거래후기 목록 조회)
	 * @param map1
	 * @param pagination
	 * @return
	 */
	public List<Review> reviewDetailList(Map<String, Object> map1, MypageDetailPagination pagination) {
		
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset,pagination.getLimit());
		
		return sqlSession.selectList("myPageMapper.reviewDetailList",map1,rowBounds);
	}

	/**(거래후기 목록의 게시글 수 조회)
	 * @param map1
	 * @return
	 */
	public int getDetailListCount(Map<String, Object> map1) {
		
		return sqlSession.selectOne("myPageMapper.getDetailListCount", map1);
	}

	/**받은 매너온도 탑5
	 * @param loginMember
	 * @return
	 */
	public List<Review> selectMannerTopList(Member loginMember) {
		
		return sqlSession.selectList("myPageMapper.mannerTopList",loginMember);
	}

	/**매너온도 목록 조회하기
	 * @param map1
	 * @return
	 */
	public List<Review> reviewList(Map<String, Object> map1) {
		
		return sqlSession.selectList("myPageMapper.selectMannerList",map1);
	}

	/**받은 후기 조회하기
	 * @param map
	 * @return
	 */
	public List<Review> selectReceivedReview(Map<String, Object> map) {
		
		return sqlSession.selectList("myPageMapper.selectReceivedReview",map);
	}

	/**관심목록 게시글의 수
	 * @param memberNo
	 * @return
	 */
	public int myGoodsLikeListCount(int memberNo) {
		
		return sqlSession.selectOne("myPageMapper.myGoodsLikeListCount", memberNo);
	}

	/**관심목록 조회하기
	 * @param memberNo
	 * @param pagination
	 * @return
	 */
	public List<GoodsSell> myGoodsLikeList(int memberNo, MypagePagination pagination) {
		
int offset = (pagination.getCurrentPage()-1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset,pagination.getLimit());
		
		return sqlSession.selectList("myPageMapper.selectmyGoodsLikeList",memberNo,rowBounds);
	}}
