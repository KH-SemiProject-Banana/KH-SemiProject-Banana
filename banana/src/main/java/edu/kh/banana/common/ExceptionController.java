package edu.kh.banana.common;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

// 예외처리용 Controller
@ControllerAdvice
public class ExceptionController {

	@ExceptionHandler(Exception.class) // 프로젝트 내에서 발생하는 모든 예외 처리
	// @ExceptionHandler(Exception.class) <-()안에 예외의 종류별로 메서드 작성가능
	public String exceptionHander(Exception e, Model model) {
		// 매개변수 Exception e: 발생한 예외를 전달받음
		// model : 데이터 전달용 객체
		e.printStackTrace();
		model.addAttribute("errorMessage", "서비스 이용 중 문제가 발생했습니다");
		model.addAttribute("e", e);
		
		return "common/error";
		
	}
}