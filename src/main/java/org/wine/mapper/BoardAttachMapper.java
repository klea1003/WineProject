package org.wine.mapper;

import java.util.List;

import org.wine.domain.BoardAttachVO;

public interface BoardAttachMapper {
	
	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO>findByboardNum(Long boardNum);
	
	public void deleteAll(Long boardNum);
	
	public List<BoardAttachVO> getOldFiles();

}
