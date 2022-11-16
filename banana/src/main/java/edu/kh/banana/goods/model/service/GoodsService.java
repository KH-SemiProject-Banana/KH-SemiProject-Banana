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

//	/** 메인페이지 상품조회
//	 * @param memberNo
//	 * @return
//	 */
//	List<Goods> selectFavorite();





}
