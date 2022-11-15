package edu.kh.banana.goods.model.dao;

import java.util.List;

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

	/** 메인페이지 상품조회
	 * @param memberNo
	 * @return
	 */
	public List<Goods> selectFavorite(int memberNo) {
		// TODO Auto-generated method stub
		
		// 여기서 goods 5개 조회해오고, mypage-mapper에서 내가 좋아요한 여부를 조회해와서 합치기
		return sqlSession.selectList("goodsMapper.selectFavorite", memberNo);
	}



}
