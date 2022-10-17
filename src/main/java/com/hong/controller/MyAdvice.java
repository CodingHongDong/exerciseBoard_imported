//package com.hong.controller;
//
//import org.springframework.http.HttpStatus;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.bind.annotation.ResponseStatus;
//import org.springframework.web.servlet.NoHandlerFoundException;
//
//import lombok.extern.log4j.Log4j;
//
//@ControllerAdvice
//@Log4j
//public class MyAdvice {
//	
//	@ExceptionHandler(Exception.class)
//	public String handleException(Exception ex, Model model) {
//		log.error(ex.getMessage());
//		
//		model.addAttribute("msg", "잠시 후 다시 시도해주세요.");
//		
//		return "error/error500";
//	}
//	
//	@ExceptionHandler(NoHandlerFoundException.class)
//	@ResponseStatus(value = HttpStatus.NOT_FOUND)
//	public String handle404(NoHandlerFoundException ex, Model model) {
//		log.error(ex.getRequestURL());
//		
//		model.addAttribute("msg", "그런 페이지는 없어요.");
//		
//		return "error/error404";
//	}
//	
//	
//}
