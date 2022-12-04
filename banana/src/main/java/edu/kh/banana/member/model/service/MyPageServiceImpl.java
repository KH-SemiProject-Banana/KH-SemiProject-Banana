package edu.kh.banana.member.model.service;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.banana.common.Util;
import edu.kh.banana.goods.model.vo.GoodsSell;
import edu.kh.banana.member.model.dao.MyPageDAO;
import edu.kh.banana.member.model.vo.Member;
import edu.kh.banana.member.model.vo.MypagePagination;
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

	
	@Override
	public Map<String, Object> selectGoodsList(Map<String, Object> map1, int cp) {
		
		//1. 전체 게시글 수 조회하기(판매중일때/판매완료일때/구매완료일때)
		int listCount = dao.getListCount(map1);
		//2. 전체 게시글 수 + cp(현재페이지)를 이용해서 페이징 처리 객체를 생성한다.
		MypagePagination pagination = new MypagePagination(listCount,cp);
		
		//
		List<GoodsSell> soldList = dao.selectGoodsSoldList(map1,pagination);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("soldList", soldList);
		return map;
	}

	//reviewDB에 인서트하기
	



	//REVIEW_RATING DB에 인서트하기
	@Transactional
	@Override
	public int sendingMannerReview(List<String> goodCheckedArr, List<String> badCheckedArr, String reviewText, 
			Member loginMember, int reviewGoodsNo, int reviewBuyerNo, int reviewSellerNo) {
		
		Review review = new Review();
		
		review.setMemberNo(loginMember.getMemberNo());
		review.setGoodsNo(reviewGoodsNo);
		//만약 로그인한 애가 구매자라면
		if(loginMember.getMemberNo() == reviewBuyerNo) {
			review.setReceiverNo(reviewSellerNo);
		}
		//만약 로그인한 애가 판매자라면
		if(loginMember.getMemberNo() == reviewSellerNo) {
			review.setReceiverNo(reviewBuyerNo);
		}
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
	
	// 프로필 이미지 수정
		@Transactional(rollbackFor = Exception.class) //예외가 발생하면 롤백
		@Override
		public int updateProfile(String webPath, String filePath, MultipartFile profileImage, Member loginMember) 
				throws Exception {
			
			// (1) 이미지 바꿀 때, 실패를 대비해서 보험 들어놓기
			// 이전 이미지 경로를 저장할 거임...
			String temp = loginMember.getProfileImage();
			
			// (2) 중복 파일명 업로드를 대비하기 위해서 파일명 변경하자.
			String rename = null;
			
			if(profileImage.getSize() == 0) { //의미: 업로드된 파일이 없는 경우
											//getSize() 보면 : the size of the file, or 0 if empty : 비어있는 경우 0이라고 나온다고 써있음 ㅋㅋ
				
				loginMember.setProfileImage(null);
				
			} else { // 업로드된 파일이 있을 경우
				
				//원본파일명을 이용해서 새로운 파일명을 생성한다!!!
				rename = Util.fileRename(profileImage.getOriginalFilename());
				
				loginMember.setProfileImage(webPath + rename);
				// /resources/images/memberProfile/변경된 파일명
			}
			
			int result = dao.updateProfile(loginMember); // 0 또는 1이 담겨 있겠죠
			
//			result = 0; 
			
			if (result > 0) { //DB 수정 성공 시 -> 실제로 서버에 파일을 저장할 것임...
				
				if (rename != null) {
					
					// 변경된 이미지명이 있다 == 새로운 파일이 업로드 되었다.
					
					profileImage.transferTo(new File(filePath + rename));
					//메모리에 임시 저장된 파일을, 지정된 경로에 파일형태로 변환시키라는 뜻...!
					// == '서버 파일 업로드'라고 함...
				} 
				
				
			} else {
				
				//실패시 다시 이전 이미지를 세팅
				loginMember.setProfileImage(temp);
				throw new Exception("파일 업로드 실패"); //예외를 강제 발생시킨다.
			}
			
			return result;
		}


	
}
