package edu.kh.banana.goods.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.banana.goods.model.dao.GoodsDAO;

@Service
public class GoodsServiceImpl implements GoodsService{
	
	@Autowired
	private GoodsDAO dao;

	// 카테고리 페이지 이동
	@Override
	public String categoryPage(int ct) {
		return dao.categoryPage(ct);
	}
}