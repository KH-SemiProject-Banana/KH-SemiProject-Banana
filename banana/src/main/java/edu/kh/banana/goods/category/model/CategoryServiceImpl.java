package edu.kh.banana.goods.category.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.banana.goods.category.dao.CategoryDAO;
import edu.kh.banana.goods.category.vo.CategoryPagination;
import edu.kh.banana.goods.model.vo.GoodsSell;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDAO dao;
	
	// 특정 카테고리 이름 조회
	@Override
	public String categoryPage(int categoryNo) {
		return dao.categoryPage(categoryNo);
	}

	// 특정 카테고리 게시글 목록 조회
	@Override
	public Map<String, Object> selectGoodsList(GoodsSell category) {	
		int listCount = dao.getListCount(category);
		
		CategoryPagination categoryPagination = new CategoryPagination(listCount, category.getCp());
		
		List<GoodsSell> goodsList = dao.selectGoodsList(categoryPagination, category);
		
		return map(categoryPagination, goodsList);
	}

	// 인기매물 게시글 목록 조회
	@Override
	public Map<String, Object> selectLikeGoodsList(GoodsSell category) {
		int allListCount = dao.getAllListCount(category);
		
		CategoryPagination categoryPagination = new CategoryPagination(allListCount, category.getCp());
		
		List<GoodsSell> allGoodsList = dao.selectAllGoodsList(categoryPagination, category);
		
		return map(categoryPagination, allGoodsList);
	}
	
	// 맵 세팅 + 반환
	public Map<String, Object> map(CategoryPagination pagination, List<GoodsSell> list) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("categoryPagination", pagination);
        map.put("goodsList", list);
        
        return map;
	}

	// 좋아요 O
	@Override
	public int goodsLikeUp(Map<String, Object> paramMap) {
		return dao.goodsLikeUp(paramMap);
	}

	// 좋아요 X
	@Override
	public int goodsLikeDown(Map<String, Object> paramMap) {
		return dao.goodsLikeDown(paramMap);
	}
}