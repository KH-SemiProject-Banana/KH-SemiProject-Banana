package edu.kh.banana.pay.model.dao;


import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PayDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 결제 성공 시 포인트 충전
	 * @param paramMap
	 * @return result
	 */
	public int pointCharge(Map<String, Object> paramMap) {
		return sqlSession.insert("payMapper.pointCharge", paramMap);
	}

	/**
	 * 잔여 포인트 조회
	 * @param paramMap
	 * @return result
	 */
	public int searchRemainPay(Map<String, Object> paramMap) {
		return sqlSession.selectOne("payMapper.searchRemainPay", paramMap);
	}

	public int searchOrderNo() {
		return sqlSession.selectOne("payMapper.searchOrderNo");
	}
}