package org.wine.domain;

import java.sql.Date;
import lombok.Data;

@Data
public class ReplyVO {

	private Long rno;
	private Long boardNum;
	private String reply;
	private String replyer;
	private Date replyDate;
	
	
}
