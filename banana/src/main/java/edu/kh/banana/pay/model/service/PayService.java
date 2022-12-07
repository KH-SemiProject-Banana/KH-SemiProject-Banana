package edu.kh.banana.pay.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.banana.pay.model.vo.BananaPay;

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

	List<BananaPay> searchPayLogList(Map<String, Object> paramMap);
}