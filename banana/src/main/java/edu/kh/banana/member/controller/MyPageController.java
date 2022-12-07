package edu.kh.banana.member.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.banana.member.model.service.MyPageService;
import edu.kh.banana.member.model.vo.Member;
import edu.kh.banana.review.model.vo.Review;

@RequestMapping("/member/myPage")
@SessionAttributes("loginMember")
@Controller
public class MyPageController {

	@Autowired
	private MyPageService service;

	// 마이페이지 이동
	@GetMapping("/main") // 나머지 주소 작성
	public String main(@SessionAttribute("loginMember") Member loginMember, 
						Model model,
						@RequestParam(value="myPageCt", required=false, defaultValue = "1") int myPageCt,
						@RequestParam(value="cp", required=false, defaultValue = "1") int cp
						
						) {
		
		
//		System.out.println(loginMember);
		Map<String, Object> map1 = new HashMap<String, Object>(); //새로 추가
//		map1.put("sell",sell); //새로 추가
//		map1.put("buy", buy); //새로 추가
		int memberNo = loginMember.getMemberNo();
		map1.put("memberNo", memberNo); // 새로 추가
		map1.put("myPageCt", myPageCt);
		//map1.put("cp", cp);
//		System.out.println(map1);
		model.addAttribute("loginMember",loginMember);
		String address = loginMember.getMemberAddress();
		model.addAttribute("address", address.substring(10, 13));

		// Map<String, Object> map = service.selectGoodsList(memberNo); //기존 구문
		Map<String, Object> map = service.selectGoodsList(map1, cp);
		model.addAttribute("map", map);
//		System.out.println(map);
		return "member/myPage_main";
	}

	// 마이페이지 자기소개 수정
	@GetMapping("/changeIntroduce")
	@ResponseBody
	public int changeIntroduce(
//			@RequestParam("introducew123") String introducew,
			String introduce, @SessionAttribute("loginMember") Member loginMember) {

		Member member = new Member();

		member.setMemberNo(loginMember.getMemberNo());
		member.setIntroduce(introduce);
		loginMember.setIntroduce(introduce); // 세션 동기화

		int result = service.changeIntroduce(member);
		return result;
	}

	// 내 회원 정보 수정 페이지 이동
	@GetMapping("/updateInfo")
	public String updateInfo() {
		return "member/myPage_UpdateInfo";
	}

	// 내 회원 정보 수정
	@PostMapping("/updateInfo")
	public String updateInfo(Member inputMember, @SessionAttribute("loginMember") Member loginMember,
			@RequestParam Map<String, Object> paramMap, String[] memberAddress, RedirectAttributes ra) {

		inputMember.setMemberNo(loginMember.getMemberNo());

		String address = String.join(",,", memberAddress);
		inputMember.setMemberAddress(address);

		int result = service.updateInfo(inputMember);

		String message = null;

		if (result > 0) {
			message = "회원 정보가 수정 되었습니다.";
			loginMember.setMemberNickname(inputMember.getMemberNickname());
			loginMember.setMemberTel(inputMember.getMemberTel());
			loginMember.setMemberAddress(inputMember.getMemberAddress());
			loginMember.setMemberPw(inputMember.getMemberPw());

		} else {
			message = "회원 정보 수정 실패";
		}
		ra.addFlashAttribute("message", message);
		return "redirect:updateInfo";
	}

	/**거래후기(REVIEW DB에 인서트) 한 다음에 그걸 가지고 매너후기 (REVIEW_RATIGN DB에 인서트)
	 * @param goodChecked
	 * @param badChecked
	 * @param reviewText
	 * @param loginMember
	 * @param reviewGoodsNo
	 * @param reviewBuyerNo
	 * @param reviewSellerNo
	 * @return
	 */
	@GetMapping("/sendingReview")
	@ResponseBody
	public int sendingReview(@RequestParam(value = "goodChecked", required = false) String goodChecked,
			@RequestParam(value = "badChecked", required = false) String badChecked, String reviewText,
			@SessionAttribute("loginMember") Member loginMember, int reviewGoodsNo, int reviewBuyerNo,
			int reviewSellerNo) {
		System.out.println("컨트롤러에 입성");

		// good값 세팅
		List<String> goodCheckedArr = null;
		if (!goodChecked.equals("")) {
			String[] goodArr = goodChecked.split(",");
			goodCheckedArr = Arrays.asList(goodArr);

		} else {
			goodCheckedArr = new ArrayList<String>();
		}
		// bad값 세팅
		List<String> badCheckedArr = null;
		if (!badChecked.equals("")) {
			String[] badArr = badChecked.split(",");
			badCheckedArr = Arrays.asList(badArr);
		} else {
			badCheckedArr = new ArrayList<String>();
		}
		// System.out.println("badCheckedArr : " + badCheckedArr);

		int result = service.sendingMannerReview(goodCheckedArr, badCheckedArr, reviewText, loginMember, reviewGoodsNo,
				reviewBuyerNo, reviewSellerNo);
		// int result = service.sendingReview();
		return result;
	}

	/**
	 * 내가 쓴 후기 조회
	 * 
	 * @param ratingNo
	 * @return
	 */
	@PostMapping("/selectSendingReview")
	@ResponseBody
	public String selectSendingReview(int ratingNo) {

		List<Review> reviewList = service.selectSendingReview(ratingNo);

		System.out.println(reviewList);
		return new Gson().toJson(reviewList);
	}

	// 프로필 이미지 수정
	@PostMapping("/updateProfile")
	public String updateProfile(
			@RequestParam(value = "profileImage") MultipartFile profileImage, /*업로드된 파일*/
			@SessionAttribute("loginMember") Member loginMember, /*로그인 회원 정보*/
			RedirectAttributes ra, /*메시지 전달용*/
			HttpServletRequest req /*저장할 서버 경로*/
			)throws Exception {

		   // ** 업로드된 이미지를 프로젝트 폴더 내부에 저장하는 방법 **
		   // 1) server -> 지정된 서버 설정 -> Server modules without publishing을 체크하기
		   // 2) 파일을 저장할 폴더 생성하기
		   // 3) HttpServletRequest를 이용해서 저장 폴더 절대 경로를 얻어오기
		   // 4) MultipartFile.transferTo()를 이용해서 지정된 경로에 파일을 저장한다.

		   // 인터넷 주소로 접근할 수 있는 경로
		    String webPath = "/resources/images/memberProfile/"; //이 주소 쓰면 이제 여기로 들어올 수 있는 거야...

		   // 실제 파일이 저장된 (컴퓨터상의) 절대 경로
			String filePath = req.getSession().getServletContext().getRealPath(webPath);

		   int result = service.updateProfile(webPath, filePath, profileImage, loginMember); //4개를 전달할꺼!

			String message = null;
			if (result > 0 ) message = "프로필 이미지가 변경되었습니다.";
			else			 message = "프로필 이미지 변경 실패";

			ra.addFlashAttribute("message", message);

	    return "redirect:/member/myPage/main";
	}
	
	 //받은 거래후기 최신순 3개
	 //받은 매너온도 탑5
	@GetMapping("/selectAllReview")
	public String selectAllReview(
							@SessionAttribute("loginMember") Member loginMember,	
							Model model
			){
		
		//받은 거래후기 최신순 3개 조회하기
		Map<String, Object> map = service.selectNewestReviewList(loginMember);
		model.addAttribute("map", map);
		System.out.println(map);
		
		return "/member/myPage_review";
	}
	
	// 리뷰 상세 페이지 이동 1
		@GetMapping("/review/good")
		public String reviewGood(
				@SessionAttribute("loginMember") Member loginMember,	
				Model model,
				@RequestParam(value="mannerCt", required=false, defaultValue = "1") int mannerCt
				) {
			
			List<Review> reviewList = service.reviewList(loginMember,mannerCt); 
			model.addAttribute("reviewList", reviewList);
			System.out.println(reviewList); //뷰 가기 전에 잘 담겼나 확인용
			
		
			
			return "member/myPage_review_good";
		}
		
		
	// 리뷰 상세 페이지 이동 2 (거래후기 목록 조회)
	@GetMapping("/review/detail")
	public String reviewDetailList(
			@SessionAttribute("loginMember") Member loginMember, 
			Model model,
			@RequestParam(value="detailCt", required=false, defaultValue = "1") int detailCt,
			@RequestParam(value="cp", required=false, defaultValue = "1") int cp
			) {
		Map<String, Object> map1 = new HashMap<String, Object>(); 
		int memberNo = loginMember.getMemberNo();
		map1.put("memberNo", memberNo); 
		map1.put("detailCt", detailCt);
		System.out.println(map1); //service가기 전에 잘 담겼나 확인용
		Map<String, Object> map = service.reviewDetailList(map1,cp); 
		model.addAttribute("map", map);
		System.out.println(map); //뷰 가기 전에 잘 담겼나 확인용
		
		return "member/myPage_review_detail";
	}
	
	/** 받은 후기 조회하기
	 * @param map
	 * @return
	 */
	@PostMapping("/selectReceivedReview")
	@ResponseBody
	public String selectReceivedReview(
			@RequestParam Map<String, Object> map
			) {
		System.out.println(map);
		List<Review> reviewList = service.selectReceivedReview(map);
		System.out.println(reviewList);
		
		return new Gson().toJson(reviewList);
	}
	
	/**관심목록
	 * @return
	 */
	@GetMapping("/myGoodsLike")
	public String myGoodsLikeList(
			@SessionAttribute("loginMember") Member loginMember, 
			Model model,
			@RequestParam(value="cp", required=false, defaultValue = "1") int cp
			) {
		
		int memberNo = loginMember.getMemberNo();
		Map<String, Object> map = service.myGoodsLikeList(memberNo,cp);
		model.addAttribute("map", map);
		System.out.println("관심목록" + map); //뷰 가기 전에 잘 담겼나 확인용
		
		return "member/myPage_goodsLike";
	}
	
	/**
	 * 회원탈퇴 페이지 이동
	 * 
	 * @return
	 */
	@GetMapping("/secessionPage")
	public String secessionPage() {
		return "member/myPage_secession";
	}

	/** 회원 탈퇴
	 * @param parMap
	 * @param referer
	 * @param loginMember
	 * @param status
	 * @param ra
	 * @return
	 */
	@PostMapping("/secession")
	public String secession(@RequestParam Map<String, Object> parMap, @RequestHeader("referer") String referer,
			@SessionAttribute("loginMember") Member loginMember, SessionStatus status, RedirectAttributes ra) {

		String path = null;
		String message = null;

		// 입력받은 값 로그인한 정보 비교 확인 및 탈퇴
		int result = service.secessionSelect(loginMember.getMemberNo(), parMap);

		if (result > 0) { // 탈퇴 성공
			
			path = "/";
			message = "회원 탈퇴되었습니다.";
			status.setComplete(); 


		} else { // 탈퇴 실패
			
			path = referer;
			message = "회원정보를 다시 확인해 주세요.";
		}

		ra.addFlashAttribute("message", message);
		return "redirect:" + path;
	}
	
	

	/** 차단관리
	 * @param loginMember
	 * @param model
	 * @return
	 */
	@GetMapping("/editBlockMember")
	public String editBlockMember(@SessionAttribute("loginMember") Member loginMember,
			Model model) {
		
		List<Member> deleteMember = service.selectDeleteMemberList(loginMember.getMemberNo());
		
		model.addAttribute("deleteMember", deleteMember);
		
		return "member/myPage_deleteMember";
	}
	
	/** 회원 차단해제
	 * @param blockedMemberNo
	 * @param loginMemberNo
	 * @return
	 */
	@GetMapping("/memberBlockCancel")
	@ResponseBody
	public int memberBlockCancel(int blockedMemberNo, int loginMemberNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("blockedMemberNo", blockedMemberNo);
		map.put("loginMemberNo", loginMemberNo);
		
		return service.memberBlockCancel(map);
	}
	
	/*타인의 마이페이지*/
	@PostMapping("/yourPageMain")
	public String yourPageMain( @RequestParam(value = "sellerNo") int memberNo,
			Model model,
			@RequestParam(value="myPageCt", required=false, defaultValue = "1") int myPageCt,
			@RequestParam(value="cp", required=false, defaultValue = "1") int cp
			) {
		
		//1. 타인의 정보를 가져온다.(닉네임/자기소개/프로필이미지/바나나온도)
		//잘 받아졌는지 확인
		System.out.println(memberNo);
		Member member = service.selectYourInfo(memberNo);
		//잘 가는지 확인
		System.out.println("상대방의 회원정보" + member);
		model.addAttribute("member",member);
		

		
		//2. 판매중/판매완료에 따라, 페이지네이션해서 가져온다.
		Map<String, Object> map1 = new HashMap<String, Object>(); 
		map1.put("memberNo", memberNo); 
		map1.put("myPageCt", myPageCt);
		
		Map<String, Object> map = service.selectGoodsList(map1, cp);
		model.addAttribute("map", map);

		
		
		return "member/yourPage_main";
	}

}
