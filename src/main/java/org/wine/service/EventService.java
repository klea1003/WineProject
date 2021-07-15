package org.wine.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.wine.domain.BoardAttachVO;
import org.wine.domain.BoardLikeVO;
import org.wine.domain.BoardVO;
import org.wine.domain.Criteria;
import org.wine.domain.EventVO;

public interface EventService {
	
	public void register(EventVO event);
	public EventVO get(Long eventNum);
	public boolean modify(EventVO event);
	public boolean remove(Long eventNum);
	public List<EventVO> getList();
	public List<EventVO> getList(Criteria cri);
	public List<EventVO> getListAll(Criteria cri);
	public int getTotal();
	
	
}
