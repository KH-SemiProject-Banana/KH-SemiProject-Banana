package edu.kh.banana.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AroundAdviceAspect {
	
	private Logger logger = LoggerFactory.getLogger(AroundAdviceAspect.class);
	
	@Around("CommonPointcut.serviceImplPointcut()")
	public Object aroundServiceLogs(ProceedingJoinPoint pp) throws Throwable {
		
		long startMs = System.currentTimeMillis();
		
		Object obj = pp.proceed();
		
		long endMs = System.currentTimeMillis();
		
		String str = "Running time : " + (endMs - startMs) + "ms";
		
		logger.info(str);
		
		return obj;
	}

}
