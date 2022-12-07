package edu.kh.banana.goods.category.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.banana.goods.category.dao.CategoryDAO;
import edu.kh.banana.goods.category.vo.CategoryPagination;
import edu.kh.banana.goods.model.vo.GoodsImage;
import edu.kh.banana.goods.model.vo.GoodsSell;
import edu.kh.banana.member.model.vo.Member;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDAO dao;
	
	// 특정 카테고리 이름 조회
	@Override
	public String categoryPage(int categoryNo) {
		return dao.categoryPage(categoryNo);
	}

	// 특정 카테고리 게시글 목록 조회
	@Override
	public Map<String, Object> selectGoodsList(GoodsSell category) {	
		int listCount = dao.getListCount(category);
		
		CategoryPagination categoryPagination = new CategoryPagination(listCount, category.getCp());
		
		List<GoodsSell> goodsList = dao.selectGoodsList(categoryPagination, category);
		
		sellStatus(goodsList);
		
		return map(categoryPagination, goodsList);
	}

	// 인기매물 게시글 목록 조회
	@Override
	public Map<String, Object> selectLikeGoodsList(GoodsSell category) {
		int allListCount = dao.getAllListCount(category);
		
		CategoryPagination categoryPagination = new CategoryPagination(allListCount, category.getCp());
		
		List<GoodsSell> allGoodsList = dao.selectAllGoodsList(categoryPagination, category);
		
		sellStatus(allGoodsList);
		
		return map(categoryPagination, allGoodsList);
	}

	// 카테고리 없이 검색 시 게시글 목록 조회
	@Override
	public Map<String, Object> selectQueryGoodsList(GoodsSell category) {
		int listCount = dao.getQueryListCount(category);
		
		CategoryPagination categoryPagination = new CategoryPagination(listCount, category.getCp());
		
		List<GoodsSell> goodsList = dao.selectQueryGoodsList(categoryPagination, category);
		
		sellStatus(goodsList);
	
		return map(categoryPagination, goodsList);
	}
	
	// 맵 세팅 + 반환
	public Map<String, Object> map(CategoryPagination pagination, List<GoodsSell> list) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("categoryPagination", pagination);
        map.put("goodsList", list);
        
        return map;
	}
	
	// 구매 & 판매 상태 세팅
	public void sellStatus(List<GoodsSell> goodsList) {
		for(GoodsSell gs : goodsList) {
			if(gs.getBuyerNo() == 0) {
				if(gs.getCategoryNo() == 11) {
					gs.setSellStatus("구매중");
				} else {
					gs.setSellStatus("판매중");					
				}
				
			} else {
				if(gs.getCategoryNo() == 11) {
					gs.setSellStatus("구매완료");
				} else {
					gs.setSellStatus("판매완료");					
				}
			}
		}
	}
	
	// 자신의 게시글에 찜 불가능
	@Override
	public int goodsLikeSelf(Map<String, Object> paramMap) {
		return dao.goodsLikeSelf(paramMap);
	}

	// 찜 추가
	@Override
	public int goodsLikeUp(Map<String, Object> paramMap) {
		return dao.goodsLikeUp(paramMap);
	}

	// 찜 삭제
	@Override
	public int goodsLikeDown(Map<String, Object> paramMap) {
		return dao.goodsLikeDown(paramMap);
	}

	// 상품 상세 페이지 이동
	@Override
	public Map<String, Object> detailedPage(GoodsSell goodsInfo, int goodsNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		goodsInfo = dao.selectGoodsInfo(goodsInfo);
		
		List<String> goodsImg = dao.selectGoodsImg(goodsNo);
		
		Member sellerInfo = dao.selectSellerInfo(goodsNo);
		
		List<GoodsSell> sellerGoods = dao.selectSellerGoods(goodsNo);
		
		if(goodsInfo.getBuyerNo() == 0) {
			if(goodsInfo.getCategoryNo() == 11) {
				goodsInfo.setSellStatus("구매중");
			} else {
				goodsInfo.setSellStatus("판매중");					
			}
			
		} else {
			if(goodsInfo.getCategoryNo() == 11) {
				goodsInfo.setSellStatus("구매완료");
			} else {
				goodsInfo.setSellStatus("판매완료");					
			}
		}

		map.put("goodsInfo", goodsInfo);
		map.put("goodsImg", goodsImg);
		map.put("sellerInfo", sellerInfo);
		map.put("sellerGoods", sellerGoods);

		return map;
	}
}