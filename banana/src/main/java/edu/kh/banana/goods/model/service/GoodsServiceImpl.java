package edu.kh.banana.goods.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.banana.common.Util;
import edu.kh.banana.goods.GoodsWriteException;
import edu.kh.banana.goods.model.dao.GoodsDAO;
import edu.kh.banana.goods.model.vo.GoodsImage;
import edu.kh.banana.goods.model.vo.GoodsSell;
import edu.kh.banana.member.model.vo.Member;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDAO dao;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int registerGoods(String webPath, String folderPath, List<MultipartFile> inputImageList, GoodsSell inputGoods)
			throws Exception {

		// 상품사진 제외한 나머지 등록
		inputGoods.setTitle(Util.XSSHandling(inputGoods.getTitle()));
		inputGoods.setDescription(Util.XSSHandling(inputGoods.getDescription()));
		inputGoods.setDescription(Util.newLineHandling(inputGoods.getDescription()));
		
		int goodsNo = dao.registerGoods(inputGoods);
		
		

		if (goodsNo > 0) {

			// inputImageList : 실제 파일이 담겨있는 리스트(가공 필요)
			// goodsImageList : DB에 삽입할 이미지 정보만 담겨있는 리스트 => DB에 삽입하기 위함
			// renameList : 변경된 파일명만 담겨있는 리스트==> 실제 파일로 변환해 저장하기 위함
			
			List<GoodsImage> goodsImageList = new ArrayList<>();
			List<String> renameList = new ArrayList<>();
			
			
			
			if(inputImageList != null) {
				
				for (int i = 0; i < inputImageList.size(); i++) {
					
					GoodsImage img = new GoodsImage();
					img.setGoodsNo(goodsNo);
					
					String rename = Util.fileRename(inputImageList.get(i).getOriginalFilename());
					renameList.add(rename);
					img.setImagePath(webPath + rename);
					img.setImageOrder(i);
					
					goodsImageList.add(img);
						
				}
			} else {
				
				throw new Exception("상품 등록 중 오류가 발생했습니다");
			}
			
			int result = dao.insertGoodsImageList(goodsImageList);
			if(result == goodsImageList.size()) {
				
				for(int i = 0; i < inputImageList.size(); i++) {
					
					inputImageList.get(i).transferTo(new File(folderPath + renameList.get(i)));
				}
			}
		}
		return goodsNo;
	}

	/**
	 * 내가 등록한 상품 1개 조회
	 */
	@Override
	public GoodsSell selectGoods(int goodsNo) {
		
		GoodsSell goods = dao.selectGoods(goodsNo);
		

		return goods;
	}

	/**
	 * 메인페이지 인기상품
	 */
	@Override
	@Transactional(rollbackFor= Exception.class)
	public List<GoodsSell> favoriteGoods(int memberNo) {
		
		List<GoodsSell> favoriteGoodsList = dao.favoriteGoods(memberNo);
		
		
		return favoriteGoodsList;
	}

	/**
	 * 메인페이지 최근글
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<GoodsSell> newGoods(int memberNo) {
		
		List<GoodsSell> newGoodsList = dao.newGoods(memberNo);
		
		
		
		
		return newGoodsList;
	}

	/**
	 * 좋아요 수 증가
	 */
	@Override
	public int goodsLikeUp(Map<String, Object> paramMap) {
		
		return dao.goodsLikeUp(paramMap);
	}

	/**
	 * 좋아요 수 감소
	 */
	@Override
	public int goodsLikeDown(Map<String, Object> paramMap) {
		
		return dao.goodsLikeDown(paramMap);
	}

	/**
	 * db~서버 이미지 동기화를 위해 renameList 조회
	 */
	@Override
	public List<String> selectImageList() {
		
		return dao.selectImageList();
	}





}
