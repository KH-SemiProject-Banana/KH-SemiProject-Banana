package edu.kh.banana.goods.category.model;

import java.util.Map;

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
	Map<String, Object> selectGoodsList(int categoryNo, int cp);

	/**
	 * 인기매물 게시글 목록 조회
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectLikeGoodsList(int cp);
}