package edu.kh.banana.goods.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;




	@ToString
	@Setter
	@Getter
	@NoArgsConstructor
	public class Goods {

		private int goodsNo;
		private int sellerNo;
		private int buyerNo;
		private int categoryNo;
		private String title;
		private int sellPrice;
		private int viewCount;
		private String description;
		private String refreshedAt;
		private String createdAt;
		private String goodsDelFlag;
		private String sellStatus;
		
		// 메인페이지에 상품을 넣기 위한 VO
		private int[] imageNo;
		
		
		//페이이용내역(REQUEST_PAY)
		private int orderNo; // 페이 주문번호
		
	
}
