package org.wine.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.wine.domain.BoardAttachVO;
import org.wine.domain.BoardLikeVO;
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
	public int updateBoardReadCount(Long boardNum);
	public int like(BoardLikeVO boardLike);
	public int disLike(BoardLikeVO boardLike);
	
	public List<BoardAttachVO> getAttachList(Long boardNum);
	
	
}
