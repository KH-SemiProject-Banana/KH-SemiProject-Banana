package edu.kh.banana.goods.category.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.banana.goods.category.vo.CategoryPagination;
import edu.kh.banana.goods.model.vo.GoodsImage;
import edu.kh.banana.goods.model.vo.GoodsSell;
import edu.kh.banana.member.model.vo.Member;

@Repository
public class CategoryDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 특정 카테고리 이름 조회
	 * @param ct
	 * @return categoryName
	 */
	public String categoryPage(int categoryNo) {
		return sqlSession.selectOne("categoryMapper.categoryPage", categoryNo);
	}

	/**
	 * 특정 카테고리 게시글 수 조회
	 * @param categoryNo
	 * @return listCount
	 */
	public int getListCount(GoodsSell category) {
		return sqlSession.selectOne("categoryMapper.getListCount", category);
	}

	/**
	 * 특정 카테고리 게시글 목록 조회
	 * @param pagination
	 * @param categoryNo
	 * @return goodsList
	 */
	public List<GoodsSell> selectGoodsList(CategoryPagination categoryPagination, GoodsSell category) {
		return sqlSession.selectList("categoryMapper.selectGoodsList", category, rowBounds(categoryPagination));
	}

	/**
	 * 인기매물 게시글 수 조회
	 * @return getAllListCount
	 */
	public int getAllListCount(GoodsSell category) {
		return sqlSession.selectOne("categoryMapper.getAllListCount", category);
	}

	/**
	 * 인기매물 게시글 목록 조회
	 * @param pagination
	 * @return allGoodsList
	 */
	public List<GoodsSell> selectAllGoodsList(CategoryPagination categoryPagination, GoodsSell category) {
		return sqlSession.selectList("categoryMapper.selectAllGoodsList", category, rowBounds(categoryPagination));
	}

	/**
	 * 검색 시 게시글 수 조회
	 * @param query
	 * @return listCount
	 */
	public int getQueryListCount(GoodsSell category) {
		return sqlSession.selectOne("categoryMapper.getQueryListCount", category);
	}

	/**
	 * 검색 시 게시글 목록 조회
	 * @param categoryPagination
	 * @param category
	 * @return goodsList
	 */
	public List<GoodsSell> selectQueryGoodsList(CategoryPagination categoryPagination, GoodsSell category) {
		return sqlSession.selectList("categoryMapper.selectQueryGoodsList", category, rowBounds(categoryPagination));
	}
	
	/**
	 * RowBounds 세팅 + 반환
	 * @param pagination
	 * @return rowBounds
	 */
	public RowBounds rowBounds(CategoryPagination pagination) {
		// RowBounds 객체 (마이바티스)
        // 여러 행 조회 결과 중 특정 위치부터 지정된 행의 개수만 조회하는 객체
        // 특정 위치 : 몇 행을 건너뛸 것인가?
		
		// (현재 페이지 - 1) * (한 페이지에 보이는 최대 게시글 수)
		// EX) 현재 페이지가 2페이지고 한 페이지에 보이는 최대 게시글 수가 20개일 경우,
		//     offset = (2-1) * 20 = 20
		//     2페이지에서는 게시글 20개(1페이지의 게시글 수)를 건너뛰고 조회
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return rowBounds;
	}
	
	/**
	 * 자신의 게시글에 찜 불가능
	 * @param paramMap
	 * @return sellerNo
	 */
	public int goodsLikeSelf(Map<String, Object> paramMap) {
		return sqlSession.selectOne("categoryMapper.goodsLikeSelf", paramMap);
	}

	/**
	 * 찜 추가
	 * @param paramMap
	 * @return result
	 */
	public int goodsLikeUp(Map<String, Object> paramMap) {
		return sqlSession.insert("categoryMapper.goodsLikeUp", paramMap);
	}

	/**
	 * 찜 삭제
	 * @param paramMap
	 * @return result
	 */
	public int goodsLikeDown(Map<String, Object> paramMap) {
		return sqlSession.delete("categoryMapper.goodsLikeDown", paramMap);
	}

	/**
	 * 상세 페이지 상품 정보 조회
	 * @param goodsInfo
	 * @return goodsInfo
	 */
	public GoodsSell selectGoodsInfo(GoodsSell goodsInfo) {
		return sqlSession.selectOne("categoryMapper.selectGoodsInfo", goodsInfo);
	}

	/**
	 * 상세 페이지 이미지 목록 조회
	 * @param goodsNo
	 * @return goodsImg
	 */
	public List<String> selectGoodsImg(int goodsNo) {
		return sqlSession.selectList("categoryMapper.selectGoodsImg", goodsNo);
	}

	/**
	 * 상세 페이지 판매자 정보 조회
	 * @param goodsNo
	 * @return sellerInfo
	 */
	public Member selectSellerInfo(int goodsNo) {
		return sqlSession.selectOne("categoryMapper.selectSellerInfo", goodsNo);
	}

	/**
	 * 상세 페이지 판매자의 다른 상품 목록 조회
	 * @param goodsNo
	 * @return sellerGoods
	 */
	public List<GoodsSell> selectSellerGoods(int goodsNo) {
		return sqlSession.selectList("categoryMapper.selectSellerGoods", goodsNo);
	}
}