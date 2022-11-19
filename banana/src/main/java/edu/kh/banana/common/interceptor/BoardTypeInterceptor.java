package edu.kh.banana.common.interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import edu.kh.banana.board.model.service.BoardService;

public class BoardTypeInterceptor implements HandlerInterceptor{
	
	@Autowired
	private BoardService service;

	// preHandle : 컨트롤러 실행 전
	// postHandle : 컨트롤러 실행 후
	// afterCompletion : 모든 뷰에서 최종 결과를 생성하는 일을 포함한 모든 일을 처리한 후.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		ServletContext application = request.getSession().getServletContext();
		
		if(application.getAttribute("boardTypeList") == null) {
			
			List<Map<String, Object>> boardTypeList = service.selectBoardType();
			
			application.setAttribute("boardTypeList", boardTypeList);
		}
				
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

	

	
}
