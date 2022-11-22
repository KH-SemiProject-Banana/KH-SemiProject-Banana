package edu.kh.banana.goods.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.banana.goods.model.service.GoodsService;
import edu.kh.banana.goods.model.vo.Goods;
import edu.kh.banana.member.model.vo.Member;

@Controller
@SessionAttributes({"inputGoods", "message", "category"})
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired
	private GoodsService service;
	
	@GetMapping("/registerGoods")
	public String registerGoods() {
		return "goods/registerGoods";
	}
	
	
	
	@PostMapping("/registerGoods")
	public String registerGoods(
			@SessionAttribute("loginMember") Member loginMember,
//			@RequestParam(name="title", required = false) String title,
//			@RequestParam(name="categoryNo", required = false) int categoryNo,
//			@RequestParam(name="description", required = false) String description,
//			@RequestParam(name="sellPrice", required = false) int sellPrice,
			Goods inputGoods,
			
			RedirectAttributes ra,
			@RequestParam(value="imagePath", required = false) List<MultipartFile> imagePath,
			HttpServletRequest req,
			@RequestHeader("referer") String referer) throws Exception{
			
				
//		inputGoods만 전달하면 되는가?? String[] imagePath는???
	
		System.out.println(inputGoods);
		System.out.println("imagePath : " + imagePath);
		
		
		
		String webPath = "/resources/images/goodsImage/";
		String filePath = req.getSession().getServletContext().getRealPath(webPath);
		

		inputGoods.setSellerNo(loginMember.getMemberNo());
		int result = service.registerGoods(webPath, filePath, imagePath, inputGoods);
		
		String path = null;
		String message = null;
		
		if(result > 0) {
			
			path = "/";
			message = "상품 등록 완료";
		} else {
			
			path = referer;
			message = "상품 등록 실패";
		}

		ra.addFlashAttribute("message", message);

		
		
		return "redirect:" + path;
		
	}
	
	/** 메인페이지 상품조회
	 * @param loginMember
	 * @return List<Goods> favoriteGoods
	 */
//	@PostMapping("/selectFavorite")
	@ResponseBody
	public String selectFavorite() {
		
		List<Goods> favoriteGoods = service.selectFavorite();
		
		return new Gson().toJson(favoriteGoods);
	}

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
		
		return "member/productList";
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
		return "member/detailedPage";
	}
}

// //@SessionAttributes("category")
// @Controller
// public class GoodsController {
	
// 	@Autowired
// 	private GoodsService service;

// 	// 카테고리 페이지 이동
// 	@GetMapping("/category")
// 	public String category(GoodsSell category,
// 						   @RequestParam(value="cp", required=false, defaultValue="1") int cp,
// 					       Model model) {
		
// 		Map<String, Object> map = null;
		
// 		if(category.getCategoryNo() == 0) {
// 			category.setCategoryName("인기매물");
// 			map = service.selectLikeGoodsList(cp);
// 		}
		
// 		else {
// 			category.setCategoryName(service.categoryPage(category.getCategoryNo()));
// 			map = service.selectGoodsList(category.getCategoryNo(), cp);
// 		}
		
// 		model.addAttribute("category", category);
// 		model.addAttribute("map", map);
		
// 		return "member/productList";
// 	}
	
// 	// 체크박스 선택 후
// 	@GetMapping("/category/Gu")
// 	public String searchGu(@RequestParam(value="location", required=false) String[] location,
// 						   @SessionAttribute(value="category", required=false) GoodsSell category){
		
// 		String path = null;
		
// 		if(location == null) {
// 			path = "/category?categoryNo=" + category.getCategoryNo();
			
// 		} else {
// 			path = "/";
// 		}
		
// 		return "redirect:" + path;
// 	}
	
// 	// 상품 상세 페이지 이동
// 	@GetMapping("/detailed")
// 	public String detailedPage() {
// 		return "member/detailedPage";
// 	}
// }