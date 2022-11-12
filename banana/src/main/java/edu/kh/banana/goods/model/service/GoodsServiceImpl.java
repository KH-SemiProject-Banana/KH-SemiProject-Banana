package edu.kh.banana.goods.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.banana.goods.model.dao.GoodsDAO;
import edu.kh.banana.goods.model.vo.Goods;

@Service
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsDAO dao;
	
	/**
	 * 상품 등록 서비스
	 */
	@Override
	public int registerGoods(Goods inputGoods) {

		return dao.registerGoods(inputGoods);
	}
	
	

}
