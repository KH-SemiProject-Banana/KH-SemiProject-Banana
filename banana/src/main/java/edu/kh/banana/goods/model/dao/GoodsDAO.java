package edu.kh.banana.goods.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.banana.goods.model.vo.Goods;
import edu.kh.banana.goods.model.vo.GoodsImage;

@Repository
public class GoodsDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 상품등록 dao
	 * @param inputGoods
	 * @return result
	 */
	public int registerGoods(Goods inputGoods) {
		
		int result =  sqlSession.insert("goodsMapper.registerGoods", inputGoods);
	
		if(result > 0) {
			return sqlSession.selectOne("goodsMapper.selectMyGoods");
		}
		
		return result;
	}
	
	/** 방금 등록된 상품번호 조회 DAO
	 * @return goodsNo
	 */
	public int selectMyGoods() {
		
		return sqlSession.selectOne("goodsMapper.selectMyGoods");
	}

	/** 상품 이미지 등록 dao
	 * @param goodsImage
	 * @return
	 */
	public int registerImage(GoodsImage goodsImage) {

		return sqlSession.update("goodsMapper.registerImage", goodsImage);
	}



}
