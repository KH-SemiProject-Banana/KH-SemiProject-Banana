package edu.kh.banana.goods.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.banana.goods.model.service.GoodsService;
import edu.kh.banana.goods.model.vo.Goods;

@Controller
@SessionAttributes({"inputGoods", "message"})
public class GoodsController {
	
	@Autowired
	private GoodsService service;
	
	@GetMapping("/goods/registerGoods")
	public String registerGoods() {
		
		return "goods/registerGoods";
	}
	
	
	
	@PostMapping("/goods/registerGoods")
	public String registerGoods(Goods inputGoods,
			RedirectAttributes ra,
			@RequestParam(value="imagePath") String[] imagePath,
			@RequestHeader("referer") String referer) {
			
		
				System.out.println(imagePath);
		
				
//				inputGoods만 전달하면 되는가?? String[] imagePath는???
				
				int result = service.registerGoods(inputGoods);
				String path = null;
				String message = null;
				
				if(result > 0) {
					
					path = "";
					message = "상품 등록 완료";
				} else {
					
					path = referer;
					message = "상품 등록 실패";
				}
		
				ra.addFlashAttribute("message", message);

		
		
		return "redirect:" + path;
		
	}

}
