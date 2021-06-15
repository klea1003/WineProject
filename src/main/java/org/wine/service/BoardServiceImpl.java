package org.wine.service;

import java.util.List;

import org.wine.domain.BoardAttachVO;
import org.wine.domain.BoardVO;
import org.wine.domain.Criteria;
import org.wine.mapper.BoardAttachMapper;
import org.wine.mapper.BoardMapper;
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
		attachmapper.deleteAll(board.getBoardNum()); //db���� ��� ÷������ ���� ����
		boolean modifyResult = mapper.update(board)==1; //board ���̺� ���� ����
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size()>0) {
			board.getAttachList().forEach(attach->{
				attach.setBoardNum(board.getBoardNum());
				log.info(board.getBoardNum());
				attachmapper.insert(attach); //db�� ÷������ ���� ����
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
	public List<BoardVO> getList(Criteria cri) {
		log.info("getList With criteria" + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

}
