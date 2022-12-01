package edu.kh.banana.goods.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import edu.kh.banana.goods.model.vo.GoodsImage;
import edu.kh.banana.goods.model.vo.GoodsSell;

@Repository
public class GoodsDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 상품 글만 등록 dao
	 * @param inputGoods
	 * @return result
	 */
	public int registerGoods(GoodsSell inputGoods) {
		
		int result =  sqlSession.insert("goodsMapper.registerGoods", inputGoods);
	
		if(result > 0) {
			result = inputGoods.getGoodsNo();
		}
		
		return result;
	}
	
	/** 상품 이미지 등록
	 * @param goodsImageList
	 * @return
	 */
	public int insertGoodsImageList(List<GoodsImage> goodsImageList) {
		
		return sqlSession.insert("goodsMapper.insertGoodsImageList", goodsImageList);
	}
	
	
	
	/** 방금 등록된 상품번호 조회 DAO
	 * @return goodsNo
	 */
	public int selectMyGoods() {
		
		return sqlSession.selectOne("goodsMapper.selectMyGoods");
	}



	public GoodsSell selectGoods(int goodsNo) {
		
		return sqlSession.selectOne("goodsMapper.selectGoods", goodsNo);
	}

	/** 메인페이지 인기상품
	 * @return List<Goods> favoriteGoodsList
	 */
	public List<GoodsSell> favoriteGoods(int memberNo) {
		
		return sqlSession.selectList("goodsMapper.favoriteGoods", memberNo);
	}

	
//	/** 메인화면 상품의 썸네일 구하기
////	 * @param goodsNo
////	 * @return
////	 */
//	public String selectGoodsThumbnail(int goodsNo) {
//		
//		return sqlSession.selectOne("goodsMapper.selectGoodsThumbnail", goodsNo);
//	}

	
	/** 메인페이지 최근상품
	 * @return List<Goods> newGoodsList
	 */
	public List<GoodsSell> newGoods(int memberNo) {
		
		return sqlSession.selectList("goodsMapper.newGoods", memberNo);
	}

	/** 좋아요 수 증가
	 * @param paramMap
	 * @return result
	 */
	public int goodsLikeUp(Map<String, Object> paramMap) {
		
		return sqlSession.insert("goodsMapper.goodsLikeUp", paramMap);
	}

	/** 좋아요 수 감소
	 * @param paramMap
	 * @return result
	 */
	public int goodsLikeDown(Map<String, Object> paramMap) {
		
		return sqlSession.delete("goodsMapper.goodsLikeDown", paramMap);
	}

	/** db~서버 이미지 동기화를 위해 renameList 조회
	 * @return dbGoodsList
	 */
	public List<String> selectImageList() {
		
		return sqlSession.selectList("goodsMapper.selectImageList");
	}









}
