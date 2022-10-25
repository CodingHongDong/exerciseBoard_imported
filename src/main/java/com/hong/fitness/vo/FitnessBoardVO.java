package com.hong.fitness.vo;

import java.math.BigDecimal;
import java.util.Date;

import lombok.Data;

@Data
public class FitnessBoardVO {

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
