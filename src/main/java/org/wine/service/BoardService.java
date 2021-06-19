package org.wine.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.wine.domain.BoardAttachVO;
import org.wine.domain.BoardVO;
import org.wine.domain.Criteria;

public interface BoardService {
	
	public void register(BoardVO board);
	public BoardVO get(Long boardNum);
	public boolean modify(BoardVO board);
	public boolean remove(Long boardNum);
	public List<BoardVO> getList();
	public List<BoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public void updateBoardReadCount(Long boardNum);
	public void updateLike(Long boardNum);
	
	public List<BoardAttachVO> getAttachList(Long boardNum);
	
	
}
