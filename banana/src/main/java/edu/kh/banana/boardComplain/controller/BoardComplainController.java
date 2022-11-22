package edu.kh.banana.boardComplain.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import edu.kh.banana.boardComplain.model.service.BoardComplainService;

@Controller
public class BoardComplainController {

	@Autowired
	private BoardComplainService service;
	
	@GetMapping("/report")
	public String report(){
		
		
		
		return "report/report";
	}
	
}
