package edu.kh.banana.goods.model.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.banana.common.Util;
import edu.kh.banana.goods.model.dao.GoodsDAO;
import edu.kh.banana.goods.model.vo.Goods;
import edu.kh.banana.goods.model.vo.GoodsImage;
import edu.kh.banana.member.model.vo.Member;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDAO dao;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int registerGoods(String webPath, String filePath, List<MultipartFile> imagePath, Goods inputGoods)
			throws Exception {

		// 상품사진 제외한 나머지 등록
		int registerResult = dao.registerGoods(inputGoods);
		
		System.out.println("registerResult :" + registerResult);

		if (registerResult > 0) {

			int goodsNo = dao.selectMyGoods();
			
			System.out.println(goodsNo);

			GoodsImage goodsImage = new GoodsImage();
			goodsImage.setGoodsNo(goodsNo);
			
			
			
			if(imagePath != null) {
				
				for (MultipartFile item : imagePath) {
					
					

					String rename = null;

					if (item.getSize() != 0) {

						rename = Util.fileRename(item.getOriginalFilename());

						goodsImage.setImagePath(webPath + rename);

					} else { // ??? 써줘야하나??

					}

					int result = dao.registerImage(goodsImage);
					if (result > 0) {

						if (rename != null) {
							item.transferTo(new File(filePath + rename));
						} else {

							throw new Exception("상품 등록 중 오류가 발생했습니다");
						}
					}

				}
				
			} else {
				
				throw new Exception("상품 등록 중 오류가 발생했습니다");
			}

			

			return 1;

		}
		
		return 0;
	}

}
