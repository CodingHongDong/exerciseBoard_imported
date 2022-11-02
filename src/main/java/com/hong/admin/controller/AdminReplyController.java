package com.hong.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hong.fitness.service.FitnessBoardReplyServiceImpl;
import com.hong.util.domain.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/reply/*")
@Log4j
public class AdminReplyController {

	// fitnessboard 관련
	
	@Autowired
	private FitnessBoardReplyServiceImpl adminFitness;
	
	// 댓글 삭제 
	//@GetMapping("/delete.do")
	@RequestMapping(value="/delete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String replyDelete(int rno, long no, Model model, @ModelAttribute PageObject pageObject) throws Exception {
		
		log.info("===  reply delete requested 댓글 번호: " + rno + ", 게시물 번호: "+ no);
		
		adminFitness.replyDelete(rno);
		log.info("---  replyDelete Mapper executed");
		
		model.addAttribute("pageObject", pageObject);
		log.info("---  PageObject Set: " + pageObject);
		log.info("댓글 삭제 해당 댓글의 번호 :" + rno + ", 해당 댓글이 속한 게시물의 번호 : " + no);
		
		return "redirect:http://localhost/hong/admin/fitnessboard/view.do?no=" + no
				+ "&page=" + pageObject.getPage()
				+ "&perPageNum=" + pageObject.getPerPageNum();
	}
	
	// fitnessboard 끝
	
}
