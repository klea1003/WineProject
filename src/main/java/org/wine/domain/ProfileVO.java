package org.wine.domain;

import lombok.Data;

@Data
public class ProfileVO {
	private Long profileNum;
	private Long userNum;
	private String profileUuid;
	private String profileUploadPath;
	private String profileFileName;
	private boolean profileFileType;
	
}
