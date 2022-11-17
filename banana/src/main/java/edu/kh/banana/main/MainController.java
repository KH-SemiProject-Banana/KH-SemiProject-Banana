package edu.kh.banana.main;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
@SessionAttributes({"loginMember", "message"})
public class MainController {
	
	

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainPage() {
		
		// 1. Model model 넣고
		// 2. service->dao->sql에서 조회한 goods(인기상품/최근) 조회해서 담기
		// 3. Goods vo에 등록된 List<Goods>와 어떻게 연결?
		
		// + 로그인한 상태에서는 좋아요 눌렀는지 여부 체크는 어떻게..?
		
		
		return "common/main";
	}

	
	
}
