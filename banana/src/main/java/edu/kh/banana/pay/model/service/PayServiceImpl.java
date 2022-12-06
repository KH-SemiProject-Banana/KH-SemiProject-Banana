package edu.kh.banana.pay.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.banana.pay.model.dao.PayDAO;

@Service
public class PayServiceImpl implements PayService{
	@Autowired
	private PayDAO dao;

	// 잔여 페이 조회
	@Override
	public int searchRemainPay(Map<String, Object> paramMap) {
		return dao.searchRemainPay(paramMap);
	}
	
	// 주문번호 조회
	@Override
	public int searchOrderNo() {
		return dao.searchOrderNo();
	}
	
	// 결제 히스토리
	@Override
	public int pointCharge(Map<String, Object> paramMap) {
		int remainPoint = searchRemainPay(paramMap);
		paramMap.put("remainPoint", remainPoint);
		return dao.pointCharge(paramMap);
	}
}