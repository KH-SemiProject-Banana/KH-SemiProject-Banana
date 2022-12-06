package edu.kh.banana.pay.model.service;

import java.util.Map;

public interface PayService {
	/**
	 * 잔여 페이 조회
	 * @param paramMap
	 * @return result
	 */
	int searchRemainPay(Map<String, Object> paramMap);

	/**
	 * 주문번호 조회
	 * @return result
	 */
	int searchOrderNo();
	
	/**
	 * 결제 히스토리
	 * @param paramMap
	 * @return result
	 */
	int pointCharge(Map<String, Object> paramMap);
}