package edu.kh.banana.goods.category.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
						   @RequestParam(value="categoryNo", required=false) String categoryNoString,
					       Model model) {
		
		
		int categoryNo = 0;
		
		if(categoryNoString != null) {
			categoryNo = Integer.parseInt(categoryNoString);
			category.setCategoryNo(categoryNo);
		} 
		
		if(loginMember != null) {
			category.setLoginMemberNo(loginMember.getMemberNo());
		}
		

		
		category.setLocation(location);
		
		Map<String, Object> map = null;
		
		// '인기검색'
		if(query == null && category.getCategoryNo() == 0) {
			category.setCategoryName("인기매물");
			map = service.selectLikeGoodsList(category);
		}
		
		// 카테고리 없이 일반 겁색만 했을때
		else if(query != null && category.getCategoryNo() <= 0) {
			category.setCategoryNo(-1);
			category.setCategoryName(query);
			category.setQuery(query);
			map = service.selectQueryGoodsList(category);
		}
		
		// 카테고리 선택 중 일반검색 했을때
		else if(query != null && category.getCategoryNo() > 0) {
			
			category.setQuery(query);
			map = service.selectGoodsList(category);
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
	
    // 좋아요 O
    @GetMapping("/goodsLikeUp")
    @ResponseBody
    public int goodsLikeUp(@RequestParam Map<String, Object> paramMap) {
        return service.goodsLikeUp(paramMap);
    }
    
    // 좋아요 X
    @GetMapping("/goodsLikeDown")
    @ResponseBody
    public int goodsLikeDown(@RequestParam Map<String, Object> paramMap) {
        return service.goodsLikeDown(paramMap);
    }
	
	// 상품 상세 페이지 이동
	@GetMapping("/detailed")
	public String detailedPage() {
		return "goods/detailedPage";
	}
}