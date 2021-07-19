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
	public List<BoardVO> getQList(Criteria cri);
	public List<BoardVO> getBList(Criteria cri);
	public int getTotal(Criteria cri);
	public int getBTotal(Criteria cri);
	public int like(BoardLikeVO boardLike);
	public int disLike(BoardLikeVO boardLike);
	public int totalLike(Long boardNum);
	
	public List<BoardAttachVO> getAttachList(Long boardNum);
	public List<Integer> likelist(List<BoardVO> getList);
	public int readLike(BoardLikeVO boardLike);
	
	
}
