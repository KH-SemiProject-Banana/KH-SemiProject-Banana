package edu.kh.banana.common.aop;

import org.aspectj.lang.annotation.Pointcut;

public class CommonPointcut {
	
	// 모든 ServiceImpl을 모아두는 포인트컷
	@Pointcut("execution(* edu.kh.banana..*ServiceImpl.*(..))")
	public void serviceImplPointcut() {}

}
