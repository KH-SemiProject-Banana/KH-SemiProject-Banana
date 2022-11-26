package edu.kh.banana.email.model.service;

public interface EmailService {

    String createAuthKey();
    
    String signUp(String email);

    
    
	String findEmailId(String result);
    
}
