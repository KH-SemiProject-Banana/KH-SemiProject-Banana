package edu.kh.banana.goods.category.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.banana.goods.category.model.CategoryService;
import edu.kh.banana.goods.model.vo.GoodsSell;
import edu.kh.banana.member.model.vo.Member;

@SessionAttributes("category")
@Controller
public class CategoryController {
	@Autowired
	private CategoryService service;
	
	// 카테고리 페이지 이동
	@GetMapping("/category")
	public String category(GoodsSell category,
						   @RequestParam(value="location", required=false) String[] location,
						   @RequestParam(value="query", required=false) String query,
						   @SessionAttribute(value="loginMember", required=false) Member loginMember,
					       Model model) {
		
		if(loginMember != null) {
			category.setLoginMemberNo(loginMember.getMemberNo());
		}
		
		category.setLocation(location);
		
		Map<String, Object> map = null;
			
		// 검색어가 있을 때
		if(query != null) {
			category.setCategoryName(query);
			category.setQuery(query);
			map = service.selectQueryGoodsList(category);
		}
				
		// 인기매물
		else if(category.getCategoryNo() == 0) {
			category.setCategoryName("인기매물");
			map = service.selectLikeGoodsList(category);
		}
		
		else {
			category.setCategoryName(service.categoryPage(category.getCategoryNo()));
			map = service.selectGoodsList(category);
		}
		
		model.addAttribute("loginMember", loginMember);
		model.addAttribute("category", category);
		model.addAttribute("map", map);
		
		return "goods/productList";
	}
	
	// 자신의 게시글에 찜 불가능
	@GetMapping("/goodsLikeSelf")
    @ResponseBody
    public int goodsLikeSelf(@RequestParam Map<String, Object> paramMap) {
        int abc = service.goodsLikeSelf(paramMap);
        return abc;
	}
	
    // 찜 추가
    @GetMapping("/goodsLikeUp")
    @ResponseBody
    public int goodsLikeUp(@RequestParam Map<String, Object> paramMap) {
        return service.goodsLikeUp(paramMap);
    }
    
    // 찜 삭제
    @GetMapping("/goodsLikeDown")
    @ResponseBody
    public int goodsLikeDown(@RequestParam Map<String, Object> paramMap) {
        return service.goodsLikeDown(paramMap);
    }
	
	// 상품 상세 페이지 이동
	@GetMapping("/goods/{goodsNo}")
	public String detailedPage(@PathVariable("goodsNo") int goodsNo,
			   				   @SessionAttribute(value="loginMember", required=false) Member loginMember,
			   				   @SessionAttribute(value="category", required=false) GoodsSell category,
							   Model model) {
		
		GoodsSell goodsInfo = new GoodsSell();
		
		goodsInfo.setGoodsNo(goodsNo);
		
		if(loginMember != null) {
			goodsInfo.setLoginMemberNo(loginMember.getMemberNo());
		}
		
		Map<String, Object> map = service.detailedPage(goodsInfo, goodsNo);
		
		model.addAttribute("loginMember", loginMember);
		model.addAttribute("category", category);
		model.addAttribute("map", map);
		
		return "goods/detailedPage";
	}
}