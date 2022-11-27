package edu.kh.banana.goods.model.vo;

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
		private int buyverNo; //LSY : 없어서 추가
		private int categoryNo;
		private String categoryName;
		private String title;
		private int sellPrice;
		private int viewCount;
		private String description;
		private String refreshedAt;
		private String createdAt;
		private String goodsDelFlag;
		private String sellStatus; // LSY : 필요있나?
		private int imageNo;
		private String imagePath;
		private int likeCount;
		
		
		//페이이용내역(REQUEST_PAY)
		private int orderNo; // 페이 주문번호	
		
		//LSY : 거래 후기 관련 추가
		private int ratingNo;
		private String sellerNickname;
		private String buyerNickname;

}