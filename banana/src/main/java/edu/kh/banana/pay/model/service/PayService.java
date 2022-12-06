package edu.kh.banana.pay.model.service;

import java.util.Map;

public interface PayService {
	/**
	 * 결제 성공 시 포인트 충전
	 * @param paramMap
	 * @return result
	 */
	int pointCharge(Map<String, Object> paramMap);

	int searchOrderNo();

	int searchRemainPay(Map<String, Object> paramMap);
}
