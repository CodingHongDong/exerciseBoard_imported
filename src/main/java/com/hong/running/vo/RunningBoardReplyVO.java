package com.hong.running.vo;

import java.util.Date;

import lombok.Data;

@Data
public class RunningBoardReplyVO {

	private int rno;
	private long no;
	private String writer;
	private String content;
	private Date regDate;
	
}
