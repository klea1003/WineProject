package org.wine.mapper;

import java.util.List;

import org.wine.domain.WineReplyVO;

public interface WineReplyMapper {
	
	 public List<Long> getMost(Long wno);
	 public List<WineReplyVO> getList5(Long wno);
	 public List<WineReplyVO> getListAll(Long wno);
	 public void insert(WineReplyVO WineReply);
	 public WineReplyVO read(Long rno);
	 public int delete(Long rno);
	 public int update(WineReplyVO WineReply);
	 public int getTotalCount(Long wno);
	 public double getTotalStar(Long wno);
	 public List<WineReplyVO> getFromStar(WineReplyVO WineReply);
}
