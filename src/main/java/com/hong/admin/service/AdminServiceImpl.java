package com.hong.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hong.admin.mapper.AdminMapper;
import com.hong.member.vo.MemberVO;
import com.hong.util.domain.PageObject;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminMapper mapper;
	
	@Override
	public List<MemberVO> list(PageObject pageObject) throws Exception {
		// TODO Auto-generated method stub
		return mapper.list(pageObject);
	}

	@Override
	public MemberVO view(String id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.view(id);
	}

	@Override
	public int delete(String id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(id);
	}

}
