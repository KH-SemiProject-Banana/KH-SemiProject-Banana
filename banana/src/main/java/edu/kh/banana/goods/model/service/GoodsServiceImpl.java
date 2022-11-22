package edu.kh.banana.goods.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.banana.goods.model.dao.GoodsDAO;
import edu.kh.banana.goods.model.vo.GoodsSell;
import edu.kh.banana.goods.model.vo.Pagination;

@Service
public class GoodsServiceImpl implements GoodsService{
	
	@Autowired
	private GoodsDAO dao;

	// 특정 카테고리 이름 조회
	@Override
	public String categoryPage(int categoryNo) {
		return dao.categoryPage(categoryNo);
	}

	// 특정 카테고리 게시글 목록 조회
	@Override
	public Map<String, Object> selectGoodsList(int categoryNo, int cp) {
		
		int listCount = dao.getListCount(categoryNo);
		
		Pagination pagination = new Pagination(listCount, cp);
		
		List<GoodsSell> goodsList = dao.selectGoodsList(pagination, categoryNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pagination", pagination);
        map.put("goodsList", goodsList);
		
		return map;
	}

	// 인기매물 게시글 목록 조회
	@Override
	public Map<String, Object> selectLikeGoodsList(int cp) {
		
		int allListCount = dao.getAllListCount();
		
		Pagination pagination = new Pagination(allListCount, cp);
		
		List<GoodsSell> allGoodsList = dao.selectAllGoodsList(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pagination", pagination);
        map.put("goodsList", allGoodsList);
		
		return map;
	}
}