package edu.kh.banana.pay.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseCookie;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import edu.kh.banana.member.model.vo.Member;
import edu.kh.banana.pay.model.service.PayService;
import edu.kh.banana.pay.model.vo.BananaPay;

@Controller
public class PayController {
	@Autowired
	private PayService service;
	
	// 페이 페이지 이동(임시)
	@GetMapping("/pay")
	public String payMain(@SessionAttribute("loginMember") Member loginMember,
						  Model model) {
		model.addAttribute("loginMember", loginMember);
		return "pay/bananaPay";
	}
	
	// 잔여 페이 조회
	@GetMapping("/searchRemainPay")
	@ResponseBody
	public int searchRemainPay(@RequestParam Map<String, Object> paramMap) {
		return service.searchRemainPay(paramMap);
	}
	
	// 주문번호 조회
	@GetMapping("searchOrderNo")
	@ResponseBody
	public int searchOrderNo() {
		return service.searchOrderNo();
	}
	
	// 결제 히스토리
	@PostMapping("/payHistory")
	@ResponseBody
    public int pointCharge(@RequestParam Map<String, Object> paramMap) {
        return service.pointCharge(paramMap);
    }
	
	@GetMapping("/searchPayLogList")
	@ResponseBody
	public List<BananaPay> searchPayLogList(@RequestParam Map<String, Object> paramMap) {
		return service.searchPayLogList(paramMap);
	}
}