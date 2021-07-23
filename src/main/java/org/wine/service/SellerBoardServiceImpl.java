package org.wine.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.wine.domain.SellerBoardVO;
import org.wine.mapper.SellerBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Log4j
@Service
@AllArgsConstructor
public class SellerBoardServiceImpl implements SellerBoardService{
	
	private SellerBoardMapper mapper;

	@Override
	public void register(SellerBoardVO board) {
		
		log.info("register......" + board);
		
		mapper.insertSelectKey(board);
		
	}

	@Override
	public List<SellerBoardVO> getList() {
		
		log.info("getList..........");
		
		return mapper.getList();
		
	}
	
	@Override
	public SellerBoardVO get(Long parentSellerBno) {
		
		log.info("get.........." + parentSellerBno);
		
		return mapper.read(parentSellerBno);
		
	}

	@Override
	public boolean modify(SellerBoardVO board) {
		
		log.info("modify......" + board);
		
		return mapper.update(board) == 1;
		
	}

	@Override
	public boolean remove(Long parentSellerBno) {
		
		log.info("remove......" + parentSellerBno);
		
		return mapper.delete(parentSellerBno) == 1;
		
	}

	@Override
	public void insertAnswerSelectKey(SellerBoardVO board) {
		
		log.info("answer......" + board);
		
		mapper.insertAnswerSelectKey(board);
		
	}

	@Override
	public SellerBoardVO answerBtn(Long parentSellerBno) {
		
		log.info("parentSellerBno : " + parentSellerBno);
		
		return mapper.answerBtn(parentSellerBno);		
		
	}

	@Override
	public SellerBoardVO getAnswer(Long parentSellerBno) {
		// TODO Auto-generated method stub
		return mapper.getAnswer(parentSellerBno);
	}

	@Override
	public SellerBoardVO readAnswer(Long parentSellerBno) {
		// TODO Auto-generated method stub
		return mapper.readAnswer(parentSellerBno);
	}

	@Override
	public boolean answerRemove(Long parentSellerBno) {
		// TODO Auto-generated method stub
		log.info("answerRemove......" + parentSellerBno);
		
		return mapper.answerDelete(parentSellerBno) == 1;
		
	}
	
	

	
	
 
}
