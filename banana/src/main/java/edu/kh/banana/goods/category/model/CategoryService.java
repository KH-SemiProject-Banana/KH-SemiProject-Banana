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
	 * 좋아요 O
	 * @param paramMap
	 * @return result
	 */
	int goodsLikeUp(Map<String, Object> paramMap);

	/**
	 * 좋아요 X
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