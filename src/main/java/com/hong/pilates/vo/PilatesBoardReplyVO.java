package com.hong.pilates.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PilatesBoardReplyVO {

	private int rno;
	private long no;
	private String writer;
	private String content;
	private Date regDate;
	
}
