package com.hong.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hong.admin.service.AdminServiceImpl;
import com.hong.member.vo.MemberVO;
import com.hong.util.domain.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("hong/admin")
@Log4j
public class AdminController {

	@Autowired
	private AdminServiceImpl adminServiceImpl;
	
	// 회원리스트 조회
	@GetMapping("/memberList.do")
	public String memberList(Model model, @ModelAttribute PageObject pageObject) throws Exception{
		
		List<MemberVO> list = adminServiceImpl.list(pageObject);
		
		log.info(list.size());
		
		model.addAttribute("vo", list);
		model.addAttribute("pageObject", pageObject);
		
		return "hong/admin/memberList";
	}
	
	
	// 회원아이디 삭제
	
	
	
}
