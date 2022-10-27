package com.hong.admin.service;

import java.util.List;

import com.hong.member.vo.MemberVO;
import com.hong.util.domain.PageObject;

public interface AdminService {

	// 회원 리스트
	public List<MemberVO> list(PageObject pageObject) throws Exception;
	
	// 회원 정보 보기
	public MemberVO view(String id) throws Exception;
	
	// 회원 정보 삭제
	public int delete(String id) throws Exception;
	
}
