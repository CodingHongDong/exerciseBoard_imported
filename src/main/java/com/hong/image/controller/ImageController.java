package com.hong.image.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hong.image.service.ImageService;
import com.hong.image.service.ImageServiceImpl;
import com.hong.image.vo.ImageVO;
import com.hong.util.domain.PageObject;
import com.webjjang.util.file.FileUtil;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/hong/imageboard")
@Log4j
public class ImageController {

	@Autowired
	private ImageServiceImpl image;
	
	// list - g
	@GetMapping("/list.do")
	public String list(PageObject pageObject, Model model) throws Exception {
		log.info("이미지 게시판 리스트");
		
		if(pageObject.getPerPageNum() == 10) pageObject.setPerPageNum(8);
		
		model.addAttribute("list", image.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		return "hong/imageboard/list";
	}
	
	// view - g
	@GetMapping("/view.do")
	public String view(long no, Model model) throws Exception {
		log.info("이미지 게시판 보기 no : " + no);
		
		model.addAttribute("vo", image.view(no));
		
		image.increase(no);
		
		return "hong/imageboard/view";
	}
	
	// write Form - g
	@GetMapping("/write.do")
	public String writeForm() {
		log.info("이미지 게시판 등록 폼");
		return "hong/imageboard/write";
	}
	
	// write - p
	@PostMapping("/write.do")
	public String write(ImageVO vo, HttpServletRequest request, int perPageNum) throws Exception {
		log.info("이미지 게시판 등록 처리");
		
		// 이미지 파일명을 찾아서 넣어주는것이 필요. - 중복이 되지 않는다. - 실제적으로 파일 올리기
		vo.setFilename(FileUtil.upload("/upload/image", vo.getImageFile(), request));
		
		image.write(vo);
		
		// 이미지가 업로드 되는 시간을 벌어서 기다리는 처리를 한다.
		Thread.sleep(2000);
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
	// imageChange
	@PostMapping("/imageChange.do")
	public String imageChange(PageObject pageObject, ImageVO vo, HttpServletRequest request) throws Exception{
		
		// 서버에 파일 업로드
		vo.setFilename(FileUtil.upload("/upload/image", vo.getImageFile(), request)); 
		
		// DB에 수정한다.
		image.imageChange(vo);
		
		// 원래 파일은 지운다.
		FileUtil.remove(FileUtil.getRealPath("", vo.getDeleteName(), request));
		
		// 이미지가 업로드 되는 시간을 벌어서 기다리는 처리르 한다.
		Thread.sleep(2000);
		
		return "redirect:view.do?no=" + vo.getNo() 
				+ "&page=" + pageObject.getPage()
				+ "&perPageNum=" + pageObject.getPerPageNum()
				+ "&key=" + pageObject.getKey()
				+ "&word=" + pageObject.getWord();				
	}
	
	// update Form - g
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) throws Exception {
		log.info("이미지 게시판 수정 폼");
		
		model.addAttribute("vo", image.view(no));
		return "hong/imageboard/update";
	}
	
	// update - p
	@PostMapping("/update.do")
	public String update(ImageVO vo, PageObject pageObject) throws Exception {
		log.info("이미지 게시판 수정 처리");
		
		image.update(vo);
		
		log.info(pageObject);
		
		// 검색처리를 하면서 key와 word를 확인해야 합니다.
		return "redirect:view.do?no=" + vo.getNo() 
				+ "&page=" + pageObject.getPage()
				+ "&perPageNum=" + pageObject.getPerPageNum()
				+ "&key=" + pageObject.getKey()
				+ "&word=" + pageObject.getWord();
	}
	
	// delete - g
	@GetMapping("/delete.do")
	public String delete(ImageVO vo, HttpServletRequest request, int perPageNum) throws Exception {
		log.info("이미지 게시판 삭제");
		
		// DB에서 데이터에서 데이터 삭제
		image.delete(vo.getNo());
		
		// 파일 삭제
		FileUtil.remove(FileUtil.getRealPath("", vo.getDeleteName(), request));
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
}
