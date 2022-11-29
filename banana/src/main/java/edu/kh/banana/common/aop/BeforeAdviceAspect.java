//package edu.kh.banana.common.aop;
//
//import java.util.Arrays;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.aspectj.lang.JoinPoint;
//import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Before;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Component;
//import org.springframework.web.context.request.RequestContextHolder;
//import org.springframework.web.context.request.ServletRequestAttributes;
//
//import edu.kh.banana.member.model.vo.Member;
//
//@Component
//@Aspect
//public class BeforeAdviceAspect {
//
//	// 로그 출력 객체 얻어오기
//	private Logger logger = LoggerFactory.getLogger(BeforeAdviceAspect.class);
//
//	@Before("CommonPointcut.serviceImplPointcut()")
//	public void beforeServiceLog(JoinPoint jp) {
//		// Joinpoint 객체 : 부가기능이 적용되는 객체의 클래스명, 메서드명, 파라미터 등을 얻을 수 있는 메서드
//
//		String str = "-----------------------------------------------";
//
//		// jp.getTarget : 포인트컷으로 지정된 대상 객체
//		String className = jp.getTarget().getClass().getSimpleName();
//
//		// jp.getSigniture() : 대상이 된 메서드
//		String methodName = jp.getSignature().getName();
//
//		logger.info(str);
//
//		str += "\n\n[START] : " + className + " - " + methodName + "()\n";
//		str += "[Parameter] : " + Arrays.toString(jp.getArgs()); // 메서드에 전달된 매개변수
//
//		try {
//			// 접속자 IP 얻어오기
//			HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
//					.getRequest();
//			// 로그인한 사람이 있다면 그 이메일을 출력
//			Member loginMember = (Member) req.getSession().getAttribute("loginMember");
//
//			str += "[ip]" + getRemoteAddr(req);
//			if (loginMember != null) {
//				str += "(email:" + loginMember.getMemberEmail() + ")";
//			}
//		} catch (Exception e) {
//			str += "[스프링 스케쥴러]";
//		}
//
//		logger.info(str);
//	}
//
//	public String getRemoteAddr(HttpServletRequest request) {
//
//		String ip = null;
//
//		ip = request.getHeader("X-Forwarded-For");
//
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//			ip = request.getHeader("Proxy-Client-IP");
//		}
//
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//			ip = request.getHeader("WL-Proxy-Client-IP");
//		}
//
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//			ip = request.getHeader("HTTP_CLIENT_IP");
//		}
//
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
//		}
//
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//			ip = request.getHeader("X-Real-IP");
//		}
//
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//			ip = request.getHeader("X-RealIP");
//		}
//
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//			ip = request.getHeader("REMOTE_ADDR");
//		}
//
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//			ip = request.getRemoteAddr();
//		}
//
//		return ip;
//	}
//
//}
