package edu.kh.banana.goods.category.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.banana.goods.category.vo.CategoryPagination;
import edu.kh.banana.goods.model.vo.GoodsSell;

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
	 * @param paramMap
	 * @return result
	 */
	public int goodsLikeUp(Map<String, Object> paramMap) {
		return sqlSession.insert("categoryMapper.goodsLikeUp", paramMap);
	}

	/**
	 * @param paramMap
	 * @return result
	 */
	public int goodsLikeDown(Map<String, Object> paramMap) {
		return sqlSession.delete("categoryMapper.goodsLikeDown", paramMap);
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
}