package com.hong.running.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hong.running.service.RunningBoardReplyServiceImpl;
import com.hong.running.vo.RunningBoardReplyVO;
import com.hong.util.domain.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/runningReply/*")
@Log4j
public class RunningBoardReplyController {

	@Autowired
	private RunningBoardReplyServiceImpl rbrservice;
	
	// 댓글 조회
	
	// 댓글 작성
	@PostMapping("/write.do")
	public String postWrite(RunningBoardReplyVO rbvo, PageObject pageObject) throws Exception {
		
		rbrservice.replyWrite(rbvo);
		
		log.info("댓글 작성 : " + rbvo);
		
		return "redirect:http://localhost/hong/runningboard/view.do?no=" + rbvo.getNo()
				+ "&inc=0"
				+ "&page=" + pageObject.getPage()
				+ "&perPageNum=" + pageObject.getPerPageNum();
	}
	
	
	// 댓글 수정 폼
	@GetMapping("/update.do")
	public String replyUpdate(long no, int rno, Model model, PageObject pageObject) throws Exception {
		
		List<RunningBoardReplyVO> rbvo = rbrservice.replyList(rno);
		
		model.addAttribute("rbvo", rbvo);
		
		log.info("댓글 수정 폼 rbvo : " + no + ", " + rno);
		
		return "hong/runningboard/runningReply/update";
	}
	
	// 댓글 수정 처리
	@PostMapping("update.do")
	public String replyUpdate(long no, PageObject pageObject, RunningBoardReplyVO rbvo) throws Exception {
		
		log.info("댓글 수정 처리 vo : " + rbvo);
		
		rbrservice.replyUpdate(rbvo);
		
		return "redirect:http://localhost/hong/runningboard/view.do?no=" + no
				+ "&inc=0"
				+ "&page=" + pageObject.getPage()
				+ "&perPageNum=" + pageObject.getPerPageNum();
	}
	
	
	// 댓글 삭제 
	//@GetMapping("/delete.do")
	@RequestMapping(value="/delete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String replyDelete(int rno, long no, Model model, @ModelAttribute PageObject pageObject) throws Exception {
		
		log.info("===  reply delete requested 댓글 번호: " + rno + ", 게시물 번호: "+ no);
		
		rbrservice.replyDelete(rno);
		log.info("---  replyDelete Mapper executed");
		
		model.addAttribute("pageObject", pageObject);
		log.info("---  PageObject Set: " + pageObject);
		log.info("댓글 삭제 해당 댓글의 번호 :" + rno + ", 해당 댓글이 속한 게시물의 번호 : " + no);
		
		return "redirect:http://localhost/hong/runningboard/view.do?no=" + no
				+ "&inc=0"
				+ "&page=" + pageObject.getPage()
				+ "&perPageNum=" + pageObject.getPerPageNum();
	}
}
