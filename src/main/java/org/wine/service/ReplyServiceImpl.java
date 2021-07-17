package org.wine.service;

import java.util.List;

import org.wine.domain.Criteria;
import org.wine.domain.ReplyPageDTO;
import org.wine.domain.ReplyVO;
import org.wine.mapper.BoardMapper;
import org.wine.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor

public class ReplyServiceImpl implements ReplyService{

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;	
	private BoardMapper boardMapper;	
	
	
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		log.info("register..." + vo);
		boardMapper.updateReplyCnt(vo.getBoardNum(), 1);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		log.info("get..." + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify..." + vo);
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("remove..." + rno);
		ReplyVO vo = mapper.read(rno);
		log.info(vo);
		boardMapper.updateReplyCnt(vo.getBoardNum(), -1);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long boardNum) {
		log.info("get Reply List of a Board" + boardNum);
		return mapper.getListWithPaging(cri, boardNum);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long boardNum) {
		log.info(boardNum+"의 댓글 count 갯수 :" + mapper.getCountByboardNum(boardNum));
		return new ReplyPageDTO(
				mapper.getCountByboardNum(boardNum),
				mapper.getListWithPaging(cri, boardNum));
	}

}
