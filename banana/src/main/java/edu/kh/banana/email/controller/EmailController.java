package edu.kh.banana.email.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import edu.kh.banana.email.model.service.EmailService;
import edu.kh.banana.member.model.service.MemberService;

@Controller
@RequestMapping("/sendEmail")
@SessionAttributes("authKey")
public class EmailController {
    
    @Autowired
    private EmailService service;
    
    @Autowired
    private  MemberService mService;
    
    
    
    
    /** 회원가입
     * @param email
     * @param model
     * @return
     */
    @GetMapping("/signUp")
    @ResponseBody
    public int signUp(String email, Model model) {
        
    	
        String authKey = service.signUp(email);
        
        if(authKey != null) {
            model.addAttribute("authKey", authKey);
            
            
            return 1;
        }else {
            return 0;
        }
    }
    
    
    @GetMapping("/checkAuthKey")
    @ResponseBody
    public int checkAuthKey(String inputKey, @SessionAttribute("authKey") String authKey, 
            SessionStatus status){
        
        if(inputKey.equals(authKey)) {
            status.setComplete();
            return 1;
        }
        
        return 0;
    }
    
    
    /** 아이디 찾기 이메일 발송
     * @param paramMap
     * @param model
     * @return
     */
    @GetMapping("/member/findEmailId")
    @ResponseBody
    public int findEmailId(@RequestParam Map<String, Object> paramMap) {
        
    	
    	String result = mService.infoFindId(paramMap);
    	
    	System.out.println("여기있나요?"+result);
    	System.out.println("여기있나요?"+paramMap);
    	
        String authKey = service.findEmailId(result);
        
        if(authKey != null) {
            return 1;
            
        }else {
        	
            return 0;
        }
    }
    
    
    
    
    
    
}
