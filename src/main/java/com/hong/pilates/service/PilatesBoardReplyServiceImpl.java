package com.hong.pilates.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hong.pilates.mapper.PilatesBoardReplyMapper;
import com.hong.pilates.vo.PilatesBoardReplyVO;


@Service
public class PilatesBoardReplyServiceImpl implements PilatesBoardReplyService {

	@Inject
	private PilatesBoardReplyMapper mapper;

	@Override
	public List<PilatesBoardReplyVO> replyList(int no) throws Exception {
		
		return mapper.replyList(no);
	}

	@Override
	public void replyWrite(PilatesBoardReplyVO pbvo) throws Exception {
		mapper.replyWrite(pbvo);		
	}

	@Override
	public int replyUpdate(PilatesBoardReplyVO pbvo) throws Exception {
		return mapper.replyUpdate(pbvo);		
	}

	@Override
	public void replyDelete(int rno) throws Exception {
		mapper.replyDelete(rno);
	}

}
