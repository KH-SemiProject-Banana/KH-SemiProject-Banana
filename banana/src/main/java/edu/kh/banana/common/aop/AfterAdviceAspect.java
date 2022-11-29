package edu.kh.banana.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AfterAdviceAspect {
	
	private Logger logger = LoggerFactory.getLogger(AfterAdviceAspect.class);
	
	@After("CommonPointcut.serviceImplPointcut()")
	public void afterServiceLog(JoinPoint jp) {
		logger.info("-----------------------------------------------");
	}

}
