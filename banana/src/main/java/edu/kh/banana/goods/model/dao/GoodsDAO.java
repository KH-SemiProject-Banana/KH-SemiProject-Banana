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

	/** 상품 삭제
	 * @param goodsNo
	 * @return
	 */
	public int goodsDelete(int goodsNo) {
		
		return sqlSession.update("goodsMapper.goodsDelete", goodsNo);
	}

	/** 상품 내용만 수정
	 * @param registerGoods
	 * @return
	 */
	public int updateGoodsContent(GoodsSell registerGoods) {
		
		return sqlSession.update("goodsMapper.updateGoodsContent", registerGoods);
	}

	/** 상품 이미지 삭제
	 * @param condition
	 * @return
	 */
	public int deleteGoodsImage(String condition) {
		
		return sqlSession.delete("goodsMapper.deleteGoodsImage", condition);
	}

	/** 상품 이미지만 수정
	 * @param img
	 * @return
	 */
	public int goodsImageUpdate(GoodsImage img) {
		
		return sqlSession.update("goodsMapper.goodsImageUpdate", img);
	}

	/** 상품이미지 삽입
	 * @param img
	 * @return
	 */
	public int goodsImageInsert(GoodsImage img) {
		
		return sqlSession.insert("goodsMapper.goodsImageInsert", img);
	}

	/** 한 상품의 이미지리스트 얻어오기
	 * @param goodsNo
	 * @return
	 */
	public List<GoodsImage> selectGoodsImgList(int goodsNo) {
		
		return sqlSession.selectList("goodsMapper.selectGoodsImgList", goodsNo);
	}

	/** 상품 끌어올리기
	 * @param goodsNo
	 * @return
	 */
	public int goodsRefresh(int goodsNo) {
		
		return sqlSession.update("goodsMapper.goodsRefresh", goodsNo);
	}









}
