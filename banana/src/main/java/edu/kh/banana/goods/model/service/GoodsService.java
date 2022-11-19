package edu.kh.banana.goods.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.banana.goods.model.vo.Goods;
import edu.kh.banana.member.model.vo.Member;

public interface GoodsService {

	/** 상품 등록 
	 * @param webPath
	 * @param filePath
	 * @param imagePath
	 * @param inputGoods
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	int registerGoods(String webPath, String filePath, List<MultipartFile> imagePath, Goods inputGoods) throws Exception;

	/** 내가 등록한 상품 1개 조회
	 * @param goodsNo
	 * @return goods
	 */
	Goods selectGoods(int goodsNo);

	
	
	
	/** 내 상품 수정
	 * @param webPath
	 * @param filePath
	 * @param imagePath
	 * @param inputGoods
	 * @return
	 */
//	int updateGoods(String webPath, String filePath, List<MultipartFile> imagePath, Goods inputGoods);







}
