package edu.kh.banana.goods.model.dao;

import java.util.List;
import java.util.Map;

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

	public Goods selectGoods(int goodsNo) {
		
		return sqlSession.selectOne("goodsMapper.selectGoods", goodsNo);
	}

	/** 메인페이지 인기상품
	 * @return List<Goods> favoriteGoodsList
	 */
	public List<Goods> favoriteGoods() {
		
		return sqlSession.selectList("goodsMapper.favoriteGoods");
	}

	
	/** 메인화면 상품의 썸네일 구하기
	 * @param goodsNo
	 * @return
	 */
	public String selectGoodsThumbnail(int goodsNo) {
		
		return sqlSession.selectOne("goodsMapper.selectGoodsThumbnail", goodsNo);
	}

	
	/** 메인페이지 최근상품
	 * @return List<Goods> newGoodsList
	 */
	public List<Goods> newGoods() {
		
		return sqlSession.selectList("goodsMapper.newGoods");
	}







}
