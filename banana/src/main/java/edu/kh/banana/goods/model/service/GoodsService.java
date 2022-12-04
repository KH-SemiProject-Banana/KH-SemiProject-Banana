package edu.kh.banana.goods.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.banana.goods.model.vo.GoodsSell;
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
	int registerGoods(String webPath, String folderPath, List<MultipartFile> inputImageList, GoodsSell inputGoods) throws Exception;

	
	
	
	/** 내가 등록한 상품 1개 조회
	 * @param goodsNo
	 * @return goods
	 */
	GoodsSell selectGoods(int goodsNo);

	
	
	
	/** 메인페이지 인기상품
	 * @return List<Goods> favoriteGoodsList
	 */
	List<GoodsSell> favoriteGoods(int memberNo);




	/** 메인페이지 최근글
	 * @return List<Goods> newGoodsList
	 */
	List<GoodsSell> newGoods(int memberNo);




	/** 좋아요 수 증가
	 * @param paramMap
	 * @return
	 */
	int goodsLikeUp(Map<String, Object> paramMap);




	/** 좋아요 수 감소
	 * @param paramMap
	 * @return
	 */
	int goodsLikeDown(Map<String, Object> paramMap);




	/** db~서버 이미지 동기화를 위해 renameList 조회
	 * @return dbGoodsList
	 */
	List<String> selectImageList();




	/** 상품 삭제
	 * @param boardNo
	 * @return
	 */
	int goodsDelete(int goodsNo);




	/** 상품 수정
	 * @param webPath
	 * @param folderPath
	 * @param registerGoods
	 * @param imageList
	 * @param deleteList
	 * @return
	 * @throws IOException 
	 */
	int updateGoods(String webPath, String folderPath, GoodsSell registerGoods, List<MultipartFile> imageList,
			String deleteList) throws IOException;




	/** 상품 끌어올리기
	 * @param goodsNo
	 * @return
	 */
	int goodsRefresh(int goodsNo);

	
	
	







}
