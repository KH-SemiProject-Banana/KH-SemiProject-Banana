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
	public List<Goods> selectFavorite() {
		// TODO Auto-generated method stub
		
		// 여기서 goods 5개 조회해오고, mypage-mapper에서 내가 좋아요한 여부를 조회해와서 합치기
		return sqlSession.selectList("goodsMapper.selectFavorite");
	}

	/**
	 * 특정 카테고리 이름 조회
	 * @param ct
	 * @return categoryName
	 */
	public String categoryPage(int categoryNo) {
		return sqlSession.selectOne("goodsMapper.categoryPage", categoryNo);
	}

	/**
	 * 특정 카테고리 게시글 수 조회
	 * @param categoryNo
	 * @return listCount
	 */
	public int getListCount(int categoryNo) {
		return sqlSession.selectOne("goodsMapper.getListCount", categoryNo);
	}

	/**
	 * 특정 카테고리 게시글 목록 조회
	 * @param pagination
	 * @param categoryNo
	 * @return goodsList
	 */
	public List<GoodsSell> selectGoodsList(Pagination pagination, int categoryNo) {
		return sqlSession.selectList("goodsMapper.selectGoodsList", categoryNo, rowBounds(pagination));
	}

	/**
	 * 인기매물 게시글 수 조회
	 * @return getAllListCount
	 */
	public int getAllListCount() {
		return sqlSession.selectOne("goodsMapper.getAllListCount");
	}

	/**
	 * 인기매물 게시글 목록 조회
	 * @param pagination
	 * @return allGoodsList
	 */
	public List<GoodsSell> selectAllGoodsList(Pagination pagination) {
		return sqlSession.selectList("goodsMapper.selectAllGoodsList", null, rowBounds(pagination));
	}
	
	public RowBounds rowBounds(Pagination pagination) {
		// RowBounds 객체 (마이바티스)
        // 여러 행 조회 결과 중 특정 위치부터 지정된 행의 개수만 조회하는 객체
        // 특정 위치 : 몇 행을 건너뛸 것인가?
		
		// (현재 페이지 - 1) * (한 페이지에 보이는 게시글 수)
		//  EX) 2페이지일 경우, 게시글 20개를 건너뛰고 조회
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return rowBounds;
	}
}