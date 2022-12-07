package edu.kh.banana.pay.model.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.banana.pay.model.vo.BananaPay;

@Repository
public class PayDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 잔여 페이 조회
	 * @param paramMap
	 * @return result
	 */
	public int searchRemainPay(Map<String, Object> paramMap) {
		return sqlSession.selectOne("payMapper.searchRemainPay", paramMap);
	}

	/**
	 * 페이 히스토리
	 * @param paramMap
	 * @return payLogList
	 */
	public List<BananaPay> searchPayLogList(Map<String, Object> paramMap) {
		return sqlSession.selectList("payMapper.searchPayLogList", paramMap);
	}
	
	/**
	 * 주문번호 조회
	 * @return result
	 */
	public int searchOrderNo() {
		return sqlSession.selectOne("payMapper.searchOrderNo");
	}
	
	/**
	 * 결제 히스토리
	 * @param paramMap
	 * @return result
	 */
	public int pointCharge(Map<String, Object> paramMap) {
		return sqlSession.insert("payMapper.pointCharge", paramMap);
	}
}