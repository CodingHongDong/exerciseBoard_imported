package com.hong.running.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hong.fitness.mapper.FitnessBoardReplyMapper;
import com.hong.running.mapper.RunningBoardReplyMapper;
import com.hong.running.vo.RunningBoardReplyVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RunningBoardReplyServiceImpl implements RunningBoardReplyService {

	@Inject
	private RunningBoardReplyMapper mapper;

	@Override
	public List<RunningBoardReplyVO> replyList(int no) throws Exception {
		
		return mapper.replyList(no);
	}

	@Override
	public void replyWrite(RunningBoardReplyVO rbvo) throws Exception {
		mapper.replyWrite(rbvo);		
	}

	@Override
	public int replyUpdate(RunningBoardReplyVO rbvo) throws Exception {
		return mapper.replyUpdate(rbvo);		
	}

	@Override
	public void replyDelete(int rno) throws Exception {
		mapper.replyDelete(rno);
	}

}
