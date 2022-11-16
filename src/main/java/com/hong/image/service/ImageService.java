package com.hong.image.service;

import java.util.List;

import com.hong.image.vo.ImageVO;
import com.hong.util.domain.PageObject;

public interface ImageService {

	// list 
	public List<ImageVO> list(PageObject pageObject) throws Exception;
	
	// 전체 데이터 개수
	public long getTotalRow(PageObject pageObject) throws Exception;
	
	// view
	public ImageVO view(long no) throws Exception;
	
	// imageChange 처리
	public int imageChange(ImageVO vo) throws Exception;
	
	// write처리
	public int write(ImageVO vo) throws Exception;
	
	// update처리
	public int update(ImageVO vo) throws Exception;
	
	// delete처리
	public int delete(long no) throws Exception;
	
	// 조회수 1 증가
	public int increase(long no) throws Exception;
	
	// 게시믈 댓글 갯수 보이기
	public int updateReplyCount(int no) throws Exception;
	
	// 회원이 쓴 게시글 갯수
	public int getTotalBoard(String memberId) throws Exception;
	
}
