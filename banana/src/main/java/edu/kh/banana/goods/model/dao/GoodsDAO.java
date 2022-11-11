package edu.kh.banana.goods.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GoodsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 * 카테고리 페이지 이동
	 * @param ct
	 * @return category
	 */
	public String categoryPage(int ct) {
		return sqlSession.selectOne("goodsMapper.categoryPage", ct);
	}
}