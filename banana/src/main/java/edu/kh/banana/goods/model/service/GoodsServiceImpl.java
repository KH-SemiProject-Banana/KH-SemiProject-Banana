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
import edu.kh.banana.goods.model.controller.GoodsUpdateException;
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
	/**
	 *
	 */
	@Override
	public GoodsSell selectGoods(int goodsNo) {
		
		List<GoodsImage> imageList = dao.selectGoodsImgList(goodsNo);
			
		GoodsSell registerGoods =  dao.selectGoods(goodsNo);
		registerGoods.setImageList(imageList);
		
		return registerGoods;
		
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

	/**
	 * 상품 삭제
	 */
	@Override
	public int goodsDelete(int goodsNo) {
		
		return dao.goodsDelete(goodsNo);
	}

	/**
	 * 상품 수정
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateGoods(String webPath, String folderPath, GoodsSell registerGoods, List<MultipartFile> imageList,
			String deleteList) throws IOException {
		
		/*
		 * 1. 글 수정(xss, newLineHandling) 
		 * 2. 이미지 수정을 위한 webPath, folderpath 준비 
		 * 3.service로 보냄 
		 * 4. 이미지 수정 
		 * 		1) 삭제(deleteSet.size > 0) : in(deleteSet)구문 이용해 기존이미지 삭제 
		 * 		2) 변경/추가(preview.size > 0) : preview에 추가된 이미지 새로 추가 
		 * 		3) 검사 : 각각의 result ==  0이라면 throw new Exception 
		 * 5. 커밋 : (글 수정 == 1) && (이미지 삭제 or 이미지 삽입 > 0)이라면 커밋, 아니면 롤백
		 */
		
		
		registerGoods.setTitle(Util.XSSHandling(registerGoods.getTitle()));
		registerGoods.setDescription(Util.XSSHandling(registerGoods.getDescription()));
		registerGoods.setDescription(Util.newLineHandling(registerGoods.getDescription()));
		
		int result = dao.updateGoodsContent(registerGoods);
		
		
		if(result > 0) { // 게시글이 정상적으로 수정된 경우
			
			// 1. 삭제(deleteSet.size > 0) : in(deleteSet)구문 이용해 기존이미지 삭제 
			if(!deleteList.equals("")) {
				
				// WHERE GOODS_NO = 35 AND IMAGE_NO = IN(241, 242, 243)
				String condition = "WHERE GOODS_NO = " + registerGoods.getGoodsNo()
					 + " AND IMG_ORDER IN(" + deleteList + ")";
				
				result = dao.deleteGoodsImage(condition);
				
				if(result == 0) {
					throw new GoodsUpdateException("상품페이지 수정 실패");
				}
			}
			
			// imageList : 실제 파일이 담겨있는 리스트
			// goodsImageList : DB에 삽입할 이미지 정보만 담겨있는 리스트
			// reNameList : 변경된 파일명만 담겨있는 리스트
			
			List<GoodsImage> goodsImageList = new ArrayList<>();
			List<String> renameList = new ArrayList<>();
			
			for(int i = 0; i < imageList.size(); i++) {
				
				if(imageList.get(i).getSize() > 0) {
					
					GoodsImage img = new GoodsImage();
					
					img.setImagePath(webPath);
					
					// 원본 파일명 -> 변경명 저장
					String rename = Util.fileRename(imageList.get(i).getOriginalFilename());
					img.setImagePath(webPath + rename);
					renameList.add(rename);
					
					// 원본 파일명
					img.setImageOrder(i);
					img.setGoodsNo(registerGoods.getGoodsNo());
					
					goodsImageList.add(img);
					
					result = dao.goodsImageUpdate(img);
					
					if(result == 0) {
						result = dao.goodsImageInsert(img);
						
						if(result == 0) {
							throw new GoodsUpdateException("상품페이지 수정 실패");
						}
					}
				}
			}
			
			if(!goodsImageList.isEmpty()) {
				
				for(int i = 0; i < goodsImageList.size(); i++) { // ex-1,3,5 3개 삽입
					
					int index = goodsImageList.get(i).getImageOrder();
					imageList.get(index).transferTo(new File(folderPath + renameList.get(i)));
				}
			}
			
		}
		
		
		return result;
	}





}
