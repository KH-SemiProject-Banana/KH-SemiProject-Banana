package edu.kh.banana.goods.model.vo;

import java.util.List;

import edu.kh.banana.pay.model.vo.BananaPay;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

	@ToString
	@Setter
	@Getter
	@NoArgsConstructor
	public class GoodsSell {

		private int goodsNo;
		private int sellerNo;
		private int buyerNo; //LSY : 없어서 추가
		private int categoryNo;
		private String categoryName;
		private String title;
		private int sellPrice;
		private int viewCount;
		private String description;
		private String refreshedAt;
		private String createdAt;
		private String goodsDelFlag;
		private String sellStatus; // 채팅창 상품정보조회 필요
		private int imageNo;
		private String imagePath;
		
		// 검색 쿼리
		private String query;
		
		// 검색 + 페이징
		private int cp = 1;
		private int order = 1;
		private String[] location;
		
		// 찜
		private int loginMemberNo = 0;
		private int memberNo;
		private int likeCount;
		
		// 상세 페이지 주소
		private String address;

		// 메인페이지에 보여질 이미지중 썸네일(img_order == 0)
		private String thumbnail;
		
		
		
		// 이 상품에 좋아요 누른 회원의 번호 정보
		// private List<Integer> likeMemberNoList;
		// 특정 로그인 회원의 상품 좋아요 여부
		private int isLike;
		
		
		
		// 메인페이지에 상품을 넣기 위한 VO
		private List<GoodsImage> imageList;
		

		
		//페이이용내역(REQUEST_PAY)
		private int orderNo; // 페이 주문번호	
		
		//LSY : 거래 후기 관련 추가
		private int ratingNo;
		private String sellerNickname;
		private String buyerNickname;
		private List<BananaPay> payList;
		
		// hoydong : 채팅창 신고 관련 
		private String memberNickname;
		
		
}