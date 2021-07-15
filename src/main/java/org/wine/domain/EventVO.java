package org.wine.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EventVO {
	private Long eventNum;
	private String eventTitle;
	private String eventContent;
	private String eventStart;
	private String eventEnd;
	 
	private String eventImage;

}
