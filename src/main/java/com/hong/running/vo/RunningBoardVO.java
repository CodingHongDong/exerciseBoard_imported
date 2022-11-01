package com.hong.running.vo;

import java.util.Date;

import lombok.Data;

@Data
public class RunningBoardVO {
	
	private long no;
	private String title;
	private String content;
	private Date regDate;
	private int hit;
	private String memberId;
	
	private int reply_count;
	
	// 위도, 경도 컬럼 추가
	private Double lat;
	private Double lng;
}
