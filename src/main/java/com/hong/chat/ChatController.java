package com.hong.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChatController {

	@GetMapping("/hong/chat.do")
	public String chat(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		log.info("chat came in");
		
		return "/hong/chat"; //
	}
	
}
