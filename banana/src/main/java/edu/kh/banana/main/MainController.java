package edu.kh.banana.main;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.banana.goods.model.service.GoodsService;
import edu.kh.banana.goods.model.vo.GoodsSell;
import edu.kh.banana.member.model.vo.Member;


@Controller
@SessionAttributes({"loginMember", "message, favoriteGoods"})
public class MainController {
	
	@Autowired
	private GoodsService service;
	

	
	@GetMapping("/")
	public String mainPage(Model model,
			@SessionAttribute(value="loginMember", required=false) Member loginMember,
			@RequestParam(value="query", required=false) String query) {
		

		
		
		int memberNo = -1;
		
		if(loginMember != null) {
			memberNo = loginMember.getMemberNo();
		}
		
		
		
		
		// 메인페이지 인기상품
		List<GoodsSell> favoriteGoodsList = service.favoriteGoods(memberNo);
		
		// 메인페이지 최근글
		List<GoodsSell> newGoodsList = service.newGoods(memberNo);
		
		
		

		
		
		
		model.addAttribute("favoriteGoodsList", favoriteGoodsList);
		model.addAttribute("newGoodsList", newGoodsList);
		
		
		
		
		return "common/main";
	}
}
