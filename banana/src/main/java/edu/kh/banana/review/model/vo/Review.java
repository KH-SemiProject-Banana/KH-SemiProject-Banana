package edu.kh.banana.review.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@NoArgsConstructor
public class Review {
	
	int ratingNo;
	int memberNo;
	int goodsNo;
	int receiverNo;
	String message;
	String createdAt;

	//추가
	String title;
	String memberNickname;
	String mannerDescription;
	
	//거래후기목록 조회하기에서 필요해서 추가한 필드
	String profileImage;
	String address;
	
	
}
