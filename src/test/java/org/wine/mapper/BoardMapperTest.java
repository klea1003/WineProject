package org.wine.mapper;

import java.util.List;

import org.wine.domain.BoardVO;
import org.wine.domain.Criteria;

import org.wine.mapper.BoardMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@WebAppConfiguration 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class BoardMapperTest {
 @Setter(onMethod =@__({@Autowired}))
 private BoardMapper mapper;

@Test
public void testGetList() {
   mapper.getList().forEach(board->log.info(board));
}

@Test
public void testInsert() {
	BoardVO board = new BoardVO();
	board.setTitle("제목");
	board.setBoardType("이벤트공지");
	board.setContent("내용");
	board.setWriter("newbie");
	mapper.insert(board);
	log.info(board);
}

@Test
public void testInsertSelectKey() {
	BoardVO board = new BoardVO();
	board.setTitle("제목");
	board.setBoardType("Q&A");
	board.setContent("내용");
	board.setWriter("newbie2");
	mapper.insertSelectKey(board);
	log.info(board);
}

@Test
public void testRead() {
   BoardVO board = mapper.read(182L);
   log.info(board);
}

@Test
public void testDelete() {
    log.info("DELETE COUNT : " + mapper.delete(182L));
}

@Test
public void testUpdate() {
	BoardVO board = new BoardVO();
	board.setBoardNum(3L);
	board.setTitle("제목2");
	board.setContent("내용2");
	board.setBoardType("Q&A");
	board.setWriter("rose2");
	int count = mapper.update(board);
	log.info("UPDATE COUNT : " + count);
	
}

@Test
public void testPaging() {
	Criteria cri = new Criteria();
	List<BoardVO> list=mapper.getQListWithPaging(cri);
	list.forEach(board->log.info(board));
}

@Test
public void testSearch() {
	Criteria cri = new Criteria();
	cri.setKeyword("이벤트"); cri.setType("P");
	List<BoardVO> list = mapper.getQListWithPaging(cri);
	list.forEach(board->log.info(board));
}

@Test
public void updateBoardReadCount() {
	mapper.updateBoardReadCount(29L);
	log.info("조회수 증가");
}



}