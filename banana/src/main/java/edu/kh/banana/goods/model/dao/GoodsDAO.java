package edu.kh.banana.goods.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import edu.kh.banana.goods.model.vo.Goods;

@Repository
public class GoodsDAO {

	private SqlSessionTemplate sqlSession;
	
	/** 상품등록 dao
	 * @param inputGoods
	 * @return result
	 */
	public int registerGoods(Goods inputGoods) {
		
		return sqlSession.insert("goodsMapper.registerGoods", inputGoods);
	}

}
