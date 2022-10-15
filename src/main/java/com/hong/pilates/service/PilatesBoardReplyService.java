package com.hong.pilates.service;

import java.util.List;

import com.hong.pilates.vo.PilatesBoardReplyVO;

public interface PilatesBoardReplyService {

	// 댓글 조회
	public List<PilatesBoardReplyVO> replyList(int no) throws Exception;
	
	// 댓글 작성
	public void replyWrite(PilatesBoardReplyVO pbvo) throws Exception;
	
	// 댓글 수정
	public int replyUpdate(PilatesBoardReplyVO pbvo) throws Exception;
	
	// 댓글 삭제
	public void replyDelete(int rno) throws Exception;
	
}
