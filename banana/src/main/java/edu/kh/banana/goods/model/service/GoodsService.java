package edu.kh.banana.goods.model.service;

import edu.kh.banana.goods.model.vo.Goods;

public interface GoodsService {

	/** 상품 등록
	 * @param inputGoods
	 * @return result
	 */
	public int registerGoods(Goods inputGoods);

}
