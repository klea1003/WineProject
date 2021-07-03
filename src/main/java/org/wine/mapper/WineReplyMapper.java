package org.wine.mapper;

import java.util.List;

import org.wine.domain.WineReplyVO;

public interface WineReplyMapper {
	
	 public List<WineReplyVO> getList5(Long wno);
	 public List<WineReplyVO> getListAll(Long wno);
	 public void insert(WineReplyVO WineReply);
	 public WineReplyVO read(Long reviewNum);
	 public void delete(Long reviewNum);
	 public void update(WineReplyVO WineReply);
	 public void upLike(WineReplyVO WineReply);
	 public void downLike(WineReplyVO WineReply);
	 public int checkLike(WineReplyVO WineReply);
	 public int getTotalCount(Long wno);
	 public double getTotalStar(Long wno);
	 public List<WineReplyVO> getFromStar(WineReplyVO WineReply);
}
