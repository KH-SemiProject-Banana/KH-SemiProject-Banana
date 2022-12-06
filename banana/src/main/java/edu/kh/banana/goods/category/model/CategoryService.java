package edu.kh.banana.goods.category.model;

import java.util.Map;

import edu.kh.banana.goods.model.vo.GoodsSell;

public interface CategoryService {
	/**
	 * 특정 카테고리 이름 조회
	 * @param ct
	 * @return categoryName
	 */
	String categoryPage(int categoryNo);

	/**
	 * 특정 카테고리 게시글 목록 조회
	 * @param categoryNo
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectGoodsList(GoodsSell category);

	/**
	 * 인기매물 게시글 목록 조회
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectLikeGoodsList(GoodsSell category);

	/**
	 * 카테고리 없이 검색 시 게시글 목록 조회
	 * @param query
	 * @return map
	 */
	Map<String, Object> selectQueryGoodsList(GoodsSell category);

	/**
	 * 자신의 게시글에 찜 불가능
	 * @param paramMap
	 * @return sellerNo
	 */
	int goodsLikeSelf(Map<String, Object> paramMap);
	
	/**
	 * 찜 추가
	 * @param paramMap
	 * @return result
	 */
	int goodsLikeUp(Map<String, Object> paramMap);

	/**
	 * 찜 삭제
	 * @param paramMap
	 * @return result
	 */
	int goodsLikeDown(Map<String, Object> paramMap);

	/**
	 * 상품 상세 페이지 이동
	 * @param goodsInfo
	 * @param goodsNo
	 * @return map
	 */
	Map<String, Object> detailedPage(GoodsSell goodsInfo, int goodsNo);
}