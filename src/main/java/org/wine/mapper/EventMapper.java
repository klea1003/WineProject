package org.wine.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
//import org.apache.ibatis.annotations.Select;
import org.wine.domain.BoardVO;
import org.wine.domain.Criteria;
import org.wine.domain.EventVO;

public interface EventMapper {
	//@Select("select*from tblBoardTest where boardNum>0")
	 public List<EventVO> getList();
	 public void insert(EventVO event);
	 public EventVO read(Long eventNum);
	 public int delete(Long eventNum);
	 public int update(EventVO event);
	 public List<EventVO> getListWithPaging(Criteria cri);
	 public List<EventVO> getListAllWithPaging(Criteria cri);
	 public int getTotalCount();
	
	 
	
}
