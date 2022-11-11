package edu.kh.banana.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("ct")
@Controller
public class MainController {
	
	// main ¿Ãµø
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainPage() {
		
		return "common/main";
	}
	
	// header
	@GetMapping("/category/product")
	public String categoryPage(@RequestParam(name = "ct", required=false) String ct, Model model) {
		System.out.println(ct);
		model.addAttribute("ct", ct);
		return "member/productList";
	}
}