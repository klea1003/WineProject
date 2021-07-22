package org.wine.service;

import java.util.ArrayList;
import java.util.List;

import org.wine.domain.BoardAttachVO;
import org.wine.domain.BoardLikeVO;
import org.wine.domain.BoardVO;
import org.wine.domain.Criteria;
import org.wine.mapper.BoardAttachMapper;
import org.wine.mapper.BoardLikeMapper;
import org.wine.mapper.BoardMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor

public class BoardServiceImpl implements BoardService {
	private BoardMapper mapper;
	private BoardAttachMapper attachmapper;
	private BoardLikeMapper likemapper;

	@Transactional
	@Override
	public void register(BoardVO board) {
		// TODO Auto-generated method stub
		//log.info("register..." + board.getBoardNum());
		mapper.insertSelectKey(board);
		if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		board.getAttachList().forEach(attach -> {
			attach.setBoardNum(board.getBoardNum());
			attachmapper.insert(attach);
		});

	}

	@Override
	public List<BoardAttachVO> getAttachList(Long boardNum) {
		log.info("get Attach list by boardNum" + boardNum);
		return attachmapper.findByboardNum(boardNum);
	}

	@Override
	public BoardVO get(Long boardNum) {
		log.info("get..." + boardNum);
		return mapper.read(boardNum);
	}

	@Transactional
	@Override
	public boolean modify(BoardVO board) {
		log.info("modify..." + board);
		attachmapper.deleteAll(board.getBoardNum()); 
		boolean modifyResult = mapper.update(board)==1; 
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size()>0) {
			board.getAttachList().forEach(attach->{
				attach.setBoardNum(board.getBoardNum());
				log.info(board.getBoardNum());
				attachmapper.insert(attach); 
			});
		}
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean remove(Long boardNum) {
		log.info("remove.." + boardNum);
		attachmapper.deleteAll(boardNum);
		return mapper.delete(boardNum) == 1;
	}

	@Override
	public List<BoardVO> getList() {
		log.info("getList............");
		return mapper.getList();
	}

	@Override
	public List<BoardVO> getQList(Criteria cri) {
		log.info("getList With criteria" + cri);
		return mapper.getQListWithPaging(cri);
	}
	
	@Override
	public List<BoardVO> getBList(Criteria cri) {
		log.info("getList With criteria" + cri);
		return mapper.getBListWithPaging(cri);
	}
	
	

	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotal.." + cri);
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public int getBTotal(Criteria cri) {
		log.info("getTotal.." + cri);
		return mapper.getBTotalCount(cri);
	}
	
	@Transactional
	@Override
	public int like(BoardLikeVO boardLike) {
		Long boardNum = boardLike.getBoardNum();
		int read = likemapper.read(boardLike);
        if(read==0) {
        	likemapper.insert(boardLike);
        }else {
        	likemapper.update(boardLike);
        }
        log.info(boardNum);
        return likemapper.getTotalLike(boardNum);
	}
	
	@Transactional
	@Override
	public int disLike(BoardLikeVO boardLike) {
		Long boardNum = boardLike.getBoardNum();
		int read = likemapper.read(boardLike);
        if(read!=0) {
        	likemapper.updateD(boardLike);
        }
        return likemapper.getTotalLike(boardNum);
	}
	
	@Override
	public int totalLike(Long boardNum) {
		
        return likemapper.getTotalLike(boardNum);
	}
	@Override
	public int readLike(BoardLikeVO boardLike) {
	
        return likemapper.read(boardLike);
	}
	
	@Override
	public List<Integer> likelist(List<BoardVO> getList) {
		List<Integer> List = new ArrayList<Integer>();
		 for(int i=0;i<getList.size();i++) {
			 List.add(this.totalLike(getList.get(i).getBoardNum()));
		 }
		
        return List;
	}
}
