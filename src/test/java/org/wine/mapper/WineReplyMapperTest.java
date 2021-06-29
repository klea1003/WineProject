package org.wine.mapper;

import java.util.List;
import org.wine.domain.WineReplyVO;

import org.wine.mapper.WineReplyMapper;
import org.wine.domain.Criteria;

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

public class WineReplyMapperTest {
	@Setter(onMethod = @__({ @Autowired }))
	private WineReplyMapper mapper;

	@Test
	public void testinsert() {
		WineReplyVO like = new WineReplyVO();
		like.setWno(1L);
		like.setReply("Good");
		like.setReplyer("user006");
		like.setReplyStar(5L);
		mapper.insert(like);
		log.info(like);
	}

	@Test
	public void testread() {
		log.info(mapper.read(1L));
	}

	@Test
	public void testUpdate() {
		WineReplyVO like = new WineReplyVO();
		like.setReply("so so");
		like.setReplyStar(4L);
		like.setRno(1L);
		mapper.update(like);
		log.info(like);
	}

	@Test
	public void testgetFromStar() {
		WineReplyVO like = new WineReplyVO();
		like.setWno(1L);
		like.setReplyStar(4L);
		mapper.getFromStar(like);
		log.info(like);
	}

	@Test
	public void testgettotal() {
		mapper.getTotalCount(1L);
	}

}
