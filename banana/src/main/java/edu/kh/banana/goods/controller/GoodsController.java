package edu.kh.banana.goods.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import edu.kh.banana.goods.model.vo.GoodsSell;
import edu.kh.banana.member.model.vo.Member;

@Controller
@SessionAttributes({"inputGoods", "message"})
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired
	private GoodsService service;
	
	/** 상품 등록 페이지로 이동
	 * @return
	 */
	@GetMapping("/registerGoods")
	public String registerGoods() {
		
		return "goods/registerGoods";
	}
	
	
	
	/** 상품 등록 페이지
	 * @param loginMember
	 * @param inputGoods
	 * @param ra
	 * @param imagePath
	 * @param req
	 * @param referer
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/registerGoods")
	public String registerGoods(
			@SessionAttribute("loginMember") Member loginMember,
			GoodsSell inputGoods,	
			RedirectAttributes ra,
			@RequestParam(value="inputImage", required = false) List<MultipartFile> inputImageList,
			HttpServletRequest req,
			HttpSession session,
			@RequestHeader("referer") String referer) throws Exception{
			

		// 1. 로그인한 회원번호를 goodsSell에 셋팅
		// 2. 업로드된 파일의 웹 접근 경로/서버 내부 경로 준비
		// 3. 상품 삽입 서비스 호출
		
		
		String webPath = "/resources/images/goodsImage/";
		String folderPath = session.getServletContext().getRealPath(webPath);
		

		inputGoods.setSellerNo(loginMember.getMemberNo());
		int result = service.registerGoods(webPath, folderPath, inputImageList, inputGoods);
		
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
	

	
	

	
	
	// 내 상품 수정하기
	@GetMapping("/updateGoods")
	public String updateGoods(@RequestParam(value="goodsNo") int goodsNo,
			Model model) {
		

		GoodsSell goods = service.selectGoods(goodsNo);
		
		model.addAttribute("goods", goods);
		
		return "goods/goods-update";
		
	}

	
	
	/** 좋아요 수 증가
	 * @param paramMap
	 * @return result
	 */
	@GetMapping("/like/up")
	@ResponseBody
	public int goodsLikeUp(@RequestParam Map<String, Object> paramMap) {
		
		
		return service.goodsLikeUp(paramMap);
	}
	
	
	/** 좋아요 수 감소
	 * @param paramMap
	 * @return result
	 */
	@GetMapping("/like/down")
	@ResponseBody
	public int goodsLikeDown(@RequestParam Map<String, Object> paramMap) {
		
		
		return service.goodsLikeDown(paramMap);
	}


}
