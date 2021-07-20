package org.wine.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	private Long boardNum;
	private String writer;
	private String boardType;
	private String title;
	private String content;
	private Date regdate;
	private int replyCnt;
	private int like;
	
	private List<BoardAttachVO> attachList;

}
