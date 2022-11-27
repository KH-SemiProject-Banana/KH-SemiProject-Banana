package edu.kh.banana.main;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
@SessionAttributes({"loginMember", "message"})
public class MainController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainPage() {
		
		return "common/main";
	}
}
