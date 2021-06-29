package org.wine.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class WineReplyVO {
	private Long rno;
	private Long wno;
	private String replyer;
	private String reply;
	private Date replyDate;
	private double replyStar;

}
