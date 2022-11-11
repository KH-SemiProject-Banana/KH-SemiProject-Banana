package edu.kh.banana.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.banana.goods.model.service.GoodsService;

@SessionAttributes("category")
@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService service;

	// 카테고리 페이지 이동
	@GetMapping("/category/product")
	public String categoryPage(@RequestParam(name = "ct", required=false) int ct, Model model) {
		if(ct == 0) {
			model.addAttribute("category", "인기매물");
		
		} else {
			String category = service.categoryPage(ct);
			model.addAttribute("category", category);
		}
		
		return "member/productList";
	}
}