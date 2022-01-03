package com.kiosk.websocket;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ChattingController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChattingController.class);
	
	// 채팅방 입장
	@RequestMapping(value = "/chatting", method = RequestMethod.GET)
	public String chatting(
			Model model, 
			@RequestParam("uid") String uid,
			HttpSession session) throws Exception {
		
		model.addAttribute("user", uid);
		
		session.setAttribute("user", uid);
		
		logger.info("#GET.chatting");
		logger.info(session.getId() + " -> " + uid);
		
		return "/chat/chatting";
	}
	
}
