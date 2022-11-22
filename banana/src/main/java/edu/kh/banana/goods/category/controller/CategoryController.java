package edu.kh.banana.goods.category.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.banana.goods.category.model.CategoryService;
import edu.kh.banana.goods.model.vo.GoodsSell;

@SessionAttributes("category")
@Controller
public class CategoryController {
	@Autowired
	private CategoryService service;
	
	// 카테고리 페이지 이동
	@GetMapping("/category")
	public String category(GoodsSell category,
						   @RequestParam(value="cp", required=false, defaultValue="1") int cp,
					       Model model) {
		
		Map<String, Object> map = null;
		
		if(category.getCategoryNo() == 0) {
			category.setCategoryName("인기매물");
			map = service.selectLikeGoodsList(cp);
		}
		
		else {
			category.setCategoryName(service.categoryPage(category.getCategoryNo()));
			map = service.selectGoodsList(category.getCategoryNo(), cp);
		}
		
		model.addAttribute("category", category);
		model.addAttribute("map", map);
		
		return "goods/productList";
	}
	
	// 체크박스 선택 후
	@GetMapping("/category/Gu")
	public String searchGu(@RequestParam(value="location", required=false) String[] location,
						   @SessionAttribute(value="category", required=false) GoodsSell category){
		
		String path = null;
		
		if(location == null) {
			path = "/category?categoryNo=" + category.getCategoryNo();
			
		} else {
			path = "/";
		}
		
		return "redirect:" + path;
	}
	
	// 상품 상세 페이지 이동
	@GetMapping("/detailed")
	public String detailedPage() {
		return "goods/detailedPage";
	}
}