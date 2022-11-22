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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.banana.goods.model.service.GoodsService;
import edu.kh.banana.goods.model.vo.Goods;
import edu.kh.banana.member.model.vo.Member;


@Controller
@SessionAttributes({"loginMember", "message, favoriteGoods"})
public class MainController {
	
	@Autowired
	private GoodsService service;
	

	
	@GetMapping("/")
	public String mainPage(Model model,
			@SessionAttribute(value="loginMember", required=false) Member loginMember) {
		
		// 1. Model model 넣고
		// 2. service->dao->sql에서 조회한 goods(인기상품/최근) 조회해서 담기
		// 3. Goods vo에 등록된 List<Goods>와 어떻게 연결?
		
		// + 로그인한 상태에서는 좋아요 눌렀는지 여부 체크는 어떻게..?
		
		
		int memberNo = -1;
		
		if(loginMember != null) {
			memberNo = loginMember.getMemberNo();
		}
		
		
		// 메인페이지 인기상품
		List<Goods> favoriteGoodsList = service.favoriteGoods(memberNo);
		
		// 메인페이지 최근글
		List<Goods> newGoodsList = service.newGoods(memberNo);
		
		
		

		
		
		
		model.addAttribute("favoriteGoodsList", favoriteGoodsList);
		model.addAttribute("newGoodsList", newGoodsList);
		
		
		
		
		return "common/main";
	}

	
	
}
