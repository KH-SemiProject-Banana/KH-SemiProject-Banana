package edu.kh.banana.member.model.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.banana.goods.model.vo.GoodsSell;
import edu.kh.banana.member.model.dao.MyPageDAO;
import edu.kh.banana.member.model.vo.Member;
import edu.kh.banana.review.model.vo.Review;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;

	
	// 마이페이지 자기소개 수정 
	@Override
	public int changeIntroduce(Member member) {
		return dao.changeIntroduce(member);
	}

	
	// 내 회원 정보 수정
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateInfo(Member inputMember) {
		
		int result = -1;
		
		if (inputMember.getMemberPw().equals("")) {
			result = dao.updateInfoNoPw(inputMember);
		}else {
			// 비밀번호 암호화
			String encPw = bcrypt.encode(inputMember.getMemberPw());
			inputMember.setMemberPw(encPw);
			 result =  dao.updateInfoPw(inputMember);
		}
		
		
		
		return result;
	}

	// 판매완료한 내 게시글 목록 조회
	@Override
	public Map<String, Object> selectGoodsSoldList(int memberNo) {
		
		// 1단계 : 특정 게시판의 전체 게시글 수를 조회한다(단, 삭제된 글 제외)
		//int listCount = dao.getListCount(memberNo);
		
		List<GoodsSell> soldList = dao.selectGoodsSoldList(memberNo);
		//System.out.println(soldList);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("soldList", soldList);
		
		return map;

	
	}

	//reviewDB에 인서트하기
	



	//REVIEW_RATING DB에 인서트하기
	@Transactional
	@Override
	public int sendingMannerReview(List<String> goodCheckedArr, List<String> badCheckedArr, String reviewText, 
			Member loginMember, int reviewGoodsNo, int reviewBuyerNo) {
		
		Review review = new Review();
		review.setMemberNo(loginMember.getMemberNo());
		review.setGoodsNo(reviewGoodsNo);
		review.setReceiverNo(reviewBuyerNo);
		review.setMessage(reviewText);
		
		int reviewNo = dao.insertReview(review); //여기서 reviewNo가 가져오는거구나
		System.out.println("첫번째 인서트"+reviewNo);
		
		int result = 0;
		int result2 = 0;
		int result3 = 0;
		int goodResult = -1;
		int badResult = -1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("goodCheckedArr", goodCheckedArr);
		map.put("badCheckedArr", badCheckedArr);
		map.put("reviewNo", reviewNo);
		
		System.out.println(map);
		System.out.println(goodCheckedArr.toString());
		System.out.println(badCheckedArr.toString());
		System.out.println(goodCheckedArr.isEmpty());
		System.out.println(badCheckedArr.isEmpty());
		System.out.println(goodCheckedArr.size());
		System.out.println(badCheckedArr.size());
		if(goodCheckedArr.isEmpty()) {
			System.out.println("좋은 후기가 없다.");
		} else {
			goodResult = dao.insertgoodManner(map);
			
		}
		if(badCheckedArr.isEmpty()){
			System.out.println("나쁜 후기가 없다.");
		} else {
			
			badResult = dao.insertbadManner(map);
		}
		System.out.println("좋은 후기 인서트된 개수" + goodResult);
		System.out.println("나쁜 후기 인서트된 개수" + badResult);
		
		if(goodResult > 0) {
			result2 = dao.updateGood(goodResult,reviewBuyerNo); //구매후기 받은 사람이 들어가야겠지....?
		}
		if (badResult > 0) {
			result3 = dao.updateBad(badResult,reviewBuyerNo);
		}
		
		if (result2 > 0 || result3 > 0 ) {
			result = 1;
		}
		
		return result;
	}

	//내가 쓴 후기 조회
	@Override
	public List<Review> selectSendingReview(int ratingNo) {
		
		return dao.selectSendingReview(ratingNo);
	}
}
