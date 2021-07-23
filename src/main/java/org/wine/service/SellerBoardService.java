package org.wine.service;

import java.util.List;

import org.wine.domain.SellerBoardVO;

public interface SellerBoardService {
	
	public void register(SellerBoardVO board);
	
	public SellerBoardVO get(Long parentSellerBno);
	
	public SellerBoardVO readAnswer(Long parentSellerBno);
	
	public SellerBoardVO getAnswer(Long parentSellerBno);
	
	public boolean modify(SellerBoardVO board);
	
	public boolean remove(Long parentSellerBno);
	
	public boolean answerRemove(Long parentSellerBno);
	
	public List<SellerBoardVO> getList();	
	
	public void insertAnswerSelectKey(SellerBoardVO board);
	
	public SellerBoardVO answerBtn(Long parentSellerBno);

}
