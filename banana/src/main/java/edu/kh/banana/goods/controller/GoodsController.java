package edu.kh.banana.goods.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

import edu.kh.banana.common.Util;
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
			@RequestParam(value="deleteList", required = false) String deleteImageList,
			HttpServletRequest req,
			HttpSession session,
			@RequestHeader("referer") String referer) throws Exception{
			

		// 1. 로그인한 회원번호를 goodsSell에 셋팅
		// 2. 업로드된 파일의 웹 접근 경로/서버 내부 경로 준비
		// 3. 상품 삽입 서비스 호출
		
		
		String webPath = "/resources/images/goodsImage/";
		String folderPath = session.getServletContext().getRealPath(webPath);
		

		inputGoods.setSellerNo(loginMember.getMemberNo());
		int goodsNo = service.registerGoods(webPath, folderPath, inputImageList, inputGoods);
		
		String path = null;
		String message = null;
		
		if(goodsNo > 0) {
			
			path = "/goods/" + goodsNo;
			message = "상품 등록 완료";
		} else {
			
			path = referer;
			message = "상품 등록 실패";
		}

		ra.addFlashAttribute("message", message);

		
		
		return "redirect:" + path;
		
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

	
	/** 상품 삭제
	 * @param boardNo
	 * @return
	 */
	@GetMapping("/delete")
	@ResponseBody
	public int goodsDelete(int goodsNo) {
		
		return service.goodsDelete(goodsNo);
	}
	
	
	

	
	/** 상품 수정 페이지로 이동
	 * @param goodsNo
	 * @param loginMember
	 * @param model
	 * @return
	 */
	@GetMapping("/update/{goodsNo}")
	public String goodsUpdate(
			@PathVariable("goodsNo") int goodsNo,
			Model model) {
		
		GoodsSell registerGoods = service.selectGoods(goodsNo);
		
		// 개행문자 처리 해제
		registerGoods.setDescription(Util.newLineClear(registerGoods.getDescription()));
		
		model.addAttribute("registerGoods", registerGoods);
		
		
		return "goods/updateGoods";
	}
	
	
	/** 상품 수정
	 * @param loginMember
	 * @param ra
	 * @param goodsNo
	 * @param registerGoods
	 * @param referer
	 * @param deleteList
	 * @param imageList
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@PostMapping("/update/{goodsNo}")
	public String goodsUpdate(@SessionAttribute("loginMember") Member loginMember,
			RedirectAttributes ra,
			@PathVariable("goodsNo") int goodsNo,
			GoodsSell registerGoods,
			@RequestHeader("referer") String referer,
			@RequestParam(value="deleteList", required=false) String deleteList, // 삭제된 이미지번호(imageNo) 리스트
			@RequestParam(value="images", required=false) List<MultipartFile> imageList, // 업로드한 이미지
			HttpSession session
			) throws IOException{
		
		String webPath = "/resources/images/goodsImage/";
		String folderPath = session.getServletContext().getRealPath(webPath);
		registerGoods.setSellerNo(loginMember.getMemberNo());
		
		int result = service.updateGoods(webPath, folderPath, registerGoods, imageList, deleteList);
		
		String message = null;
		String path = null;
		if (result > 0) {
			
			message = "상품글이 수정되었습니다";
			path = "/member/myPage/main";
			
		} else {
			
			message = "상품글 수정 실패";
			path = referer;
			
		}
		
		ra.addFlashAttribute("message", message);
	
		
		return "redirect:" + path;
	}
	
	
//	상품 끌어올리기
	@GetMapping("/refresh/{goodsNo}")
	@ResponseBody
	public int goodsRefresh(@PathVariable("goodsNo") int goodsNo) {
		
		return service.goodsRefresh(goodsNo);
	}

}
