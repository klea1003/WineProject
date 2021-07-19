package org.wine.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.wine.domain.WineReplyVO;
import org.wine.mapper.WineReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class WineReplyServiceImpl implements WineReplyService {

	private WineReplyMapper mapper;

	@Override
	public List<WineReplyVO> getList5(Long wno){
		
		log.info("getList5......." + wno);
		
		return mapper.getList5(wno);
	}

	@Override
	public List<WineReplyVO> getListAll(Long wno) {
		
		log.info("getListAll......." + wno);
		
		return mapper.getListAll(wno);
	}

	@Override
	public void insert(WineReplyVO WineReply) {
		WineReplyVO reply = new WineReplyVO();
		
		log.info("insert......." );
		
		mapper.insert(WineReply);
	}

	@Override
	public WineReplyVO read(Long reviewNum) {
		
		log.info("read......." + reviewNum);
		
		return mapper.read(reviewNum);
	}

	@Override
	public void delete(Long reviewNum) {
        log.info("delete......." + reviewNum);
		
		 mapper.delete(reviewNum);
		
	}

	@Override
	public void update(WineReplyVO WineReply) {
		
		 log.info("update.......");
			
		 mapper.update(WineReply);
		
	}

	@Override
	public void upLike(WineReplyVO WineReply) {
		
		int check = mapper.checkLike(WineReply);
		
		if(check==0) {
			mapper.upLike(WineReply);
		}else {
			mapper.downLike(WineReply);
		}
		
	}

	@Override
	public int getTotalCount(Long wno) {

		return  mapper.getTotalCount(wno);
	}

	@Override
	public double getTotalStar(Long wno) {
		
		return mapper.getTotalStar(wno);
	}

	@Override
	public List<WineReplyVO> getFromStar(WineReplyVO WineReply) {
		
		return mapper.getFromStar(WineReply);
	}

	
		

}
