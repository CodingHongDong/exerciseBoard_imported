package com.hong.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hong.admin.service.AdminServiceImpl;
import com.hong.fitness.service.FitnessBoardReplyServiceImpl;
import com.hong.fitness.service.FitnessBoardServiceImpl;
import com.hong.fitness.vo.FitnessBoardReplyVO;
import com.hong.fitness.vo.FitnessBoardVO;
import com.hong.member.vo.MemberVO;
import com.hong.util.domain.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("hong/admin")
@Log4j
public class AdminController {

	@Autowired
	private AdminServiceImpl adminServiceImpl;
	
	@Autowired
	private FitnessBoardServiceImpl fitness;
	
	@Autowired
	private FitnessBoardReplyServiceImpl fitenssReply;
	
	// 회원리스트 조회
	@GetMapping("/memberList.do")
	public String memberList(Model model, @ModelAttribute PageObject pageObject) throws Exception{
		
		List<MemberVO> list = adminServiceImpl.list(pageObject);
		
		log.info(list.size());
		
		model.addAttribute("vo", list);
		model.addAttribute("pageObject", pageObject);
		model.addAttribute("member", adminServiceImpl.getTotalRow(pageObject));
		
		return "hong/admin/memberList";
	}
	
	// 회원 정보 상세
	@GetMapping("/view.do")
	public String view(String id, Model model, MemberVO vo, PageObject pageObject) throws Exception{
		
		log.info("회원 정보 보기 vo : " + vo);
		
		model.addAttribute("vo", adminServiceImpl.view(id));
		model.addAttribute("pageObject", pageObject);
		
		// 회원이 쓴 게시글 갯수 가져오기
		model.addAttribute("getTotalBoard", fitness.getTotalBoard(id));
		// 회원이 쓴 댓글 갯수 가져오기
		model.addAttribute("getTotalReply", fitenssReply.getTotalReply(id));
		
		return "hong/admin/view";
	}
	
	// 회원아이디 삭제
	@GetMapping("/delete.do")
	public String delete(String id, int perPageNum) throws Exception{
		
		log.info("회원 아이디 삭제 id : " + id);
		
		adminServiceImpl.delete(id);
		
		return "redirect:memberList.do?perPageNum=" + perPageNum; 
	}
	
	// fitnessboard 관련 시작
	
	// 관리자 > fitnessboard list
	@GetMapping("/fitnessboard/list.do")
	public String fitnessboardList(Model model, PageObject pageObject) throws Exception{
		
		log.info("관리자 > Fitnessboard List");
		
		List<FitnessBoardVO> list = fitness.list(pageObject);
		
		model.addAttribute("vo", list);
		model.addAttribute("pageObject", pageObject);
		
		return "hong/admin/fitnessboard/list";
	}
	
	// 관리자 > fitnessboard view
	@GetMapping("/fitnessboard/view.do")
	public String fitnessboardView(int no, Model model, PageObject pageObject) throws Exception {
		
		log.info("관리자 > fitness board 글보기 no : " + no);
		
		model.addAttribute("vo", fitness.view(no));
		model.addAttribute("pageObject", pageObject);
		
		// 댓글 조회
		List<FitnessBoardReplyVO> reply = fitenssReply.replyList(no);
		model.addAttribute("reply", reply);
		
		fitness.updateReplyCount(no);
		
		return "hong/admin/fitnessboard/view";
	}
	
	// 관리자 > fitnessboard delete
	@GetMapping("/fitnessboard/delete.do")
	public String delete(FitnessBoardVO vo, int perPageNum) throws Exception{
		
		fitness.delete(vo.getNo());
		
		return "redirect:list.do?perPageNum=" + perPageNum;
		
	}
	
	
	// fitnessboard 관련 끝
}
