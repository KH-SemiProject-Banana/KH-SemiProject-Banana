package edu.kh.banana.pay.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class BananaPay {

	private int orderNo;
	private int goodsNo;
	private int traderNo;
	private String orderDate;
	private int usePoint;
	private int buyStatus;
	private int remainPoint;
	
	// 추가할거 있으면 추가하세요
}
