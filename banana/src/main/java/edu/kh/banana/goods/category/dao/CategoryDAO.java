package edu.kh.banana.goods.category.dao;

import java.util.List;

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
	public int getListCount(int categoryNo) {
		return sqlSession.selectOne("categoryMapper.getListCount", categoryNo);
	}

	/**
	 * 특정 카테고리 게시글 목록 조회
	 * @param pagination
	 * @param categoryNo
	 * @return goodsList
	 */
	public List<GoodsSell> selectGoodsList(CategoryPagination categoryPagination, int categoryNo) {
		return sqlSession.selectList("categoryMapper.selectGoodsList", categoryNo, rowBounds(categoryPagination));
	}

	/**
	 * 인기매물 게시글 수 조회
	 * @return getAllListCount
	 */
	public int getAllListCount() {
		return sqlSession.selectOne("categoryMapper.getAllListCount");
	}

	/**
	 * 인기매물 게시글 목록 조회
	 * @param pagination
	 * @return allGoodsList
	 */
	public List<GoodsSell> selectAllGoodsList(CategoryPagination categoryPagination) {
		return sqlSession.selectList("categoryMapper.selectAllGoodsList", null, rowBounds(categoryPagination));
	}
	
	public RowBounds rowBounds(CategoryPagination pagination) {
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