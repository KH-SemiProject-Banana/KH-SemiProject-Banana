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
	

	/**판매완료한 내 게시글의 목록 조회
	 * @param map1
	 * @return
	 */
	public List<GoodsSell> selectGoodsSoldList(Map<String, Object> map1, MypagePagination pagination) {
		
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset,pagination.getLimit());
		
		return sqlSession.selectList("myPageMapper.selectGoodsSoldList",map1,rowBounds);
	}
	
	
	
//필요없어이제	
//	/**판매중인 내 게시글의 목록 조회
//	 * @param memberNo
//	 * @return
//	 */
//	public List<GoodsSell> selectGoodsSellList(int memberNo) {
//		
//		return sqlSession.selectList("myPageMapper.selectGoodsSellList",memberNo);
//	}
//
//	/**구매완료한 내 게시글의 목록 조회
//	 * @param memberNo
//	 * @return
//	 */
//	public List<GoodsSell> selectGoodsBuyList(int memberNo) {
//		
//		return sqlSession.selectList("myPageMapper.selectGoodsBuyList",memberNo);
//	}

	/** 
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

	public int insertgoodManner(Map<String, Object> map) {
		
		return sqlSession.insert("myPageMapper.insertgoodManner",map);
	}

	public int insertbadManner(Map<String, Object> map) {
		
		return sqlSession.insert("myPageMapper.insertbadManner",map);
	}

	public int updateGood(int goodResult, int reviewBuyerNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("goodResult", goodResult);
		map.put("reviewBuyerNo", reviewBuyerNo);
		return sqlSession.update("myPageMapper.updateGood", map);
	}

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

	/** 프로필 이미지를 수정하겠다!!
	 * @param loginMember
	 * @return
	 */
	public int updateProfile(Member loginMember) {
		
		
		//마이바티스를 이용해서 update를 진행할겨
		return sqlSession.update("myPageMapper.updateProfile", loginMember);
		
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

	

	
	



	


	

}
