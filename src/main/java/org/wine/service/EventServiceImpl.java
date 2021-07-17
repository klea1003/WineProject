package org.wine.service;

import java.util.ArrayList;
import java.util.List;

import org.wine.domain.BoardAttachVO;
import org.wine.domain.BoardLikeVO;
import org.wine.domain.BoardVO;
import org.wine.domain.Criteria;
import org.wine.domain.EventVO;
import org.wine.mapper.BoardAttachMapper;
import org.wine.mapper.BoardLikeMapper;
import org.wine.mapper.BoardMapper;
import org.wine.mapper.EventMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor

public class EventServiceImpl implements EventService {
	private EventMapper mapper;
	

	@Transactional
	@Override
	public void register(EventVO event) {
		// TODO Auto-generated method stub
		//log.info("register..." + board.getBoardNum());
		mapper.insert(event);	
		
	}

	@Override
	public EventVO get(Long eventNum) {
		log.info("get..." + eventNum);
		return mapper.read(eventNum);
	}

	@Transactional
	@Override
	public boolean modify(EventVO event) {
		log.info("modify..." + event);
		boolean modifyResult = mapper.update(event)==1; 
		
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean remove(Long eventNum) {
		log.info("remove.." + eventNum);
		
		return mapper.delete(eventNum) == 1;
	}

	@Override
	public List<EventVO> getList() {
		log.info("getList............");
		return mapper.getList();
	}

	@Override
	public List<EventVO> getList(Criteria cri) {
		log.info("getList With criteria" + cri);
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public List<EventVO> getListAll(Criteria cri) {
		log.info("getList With criteria" + cri);
		return mapper.getListAllWithPaging(cri);
	}
	
	

	@Override
	public int getTotal() {
		log.info("getTotal..");
		return mapper.getTotalCount();
	}
	
	
	
	
	
	
}
