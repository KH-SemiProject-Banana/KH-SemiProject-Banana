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

}
