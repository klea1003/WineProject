package org.wine.service;

import java.util.List;

import org.wine.domain.Criteria;
import org.wine.domain.ReplyPageDTO;
import org.wine.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);
	public ReplyVO get(Long rno);
	public int modify(ReplyVO vo);
	public int remove(Long rno);
	public List<ReplyVO> getList(Criteria cri, Long boardNum);
	public ReplyPageDTO getListPage(Criteria cri, Long boardNum);

}
