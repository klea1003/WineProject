package org.wine.mapper;



import java.util.List;
import java.util.stream.IntStream;

import org.wine.domain.Criteria;
import org.wine.domain.ReplyVO;
import org.wine.mapper.ReplyMapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
      "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j



public class ReplyMapperTest {
	
	private Long[] boardNumArr = {2L, 3L, 4L, 5L, 7L};
 	
	@Setter(onMethod_ = { @Autowired })
	   private ReplyMapper mapper;
  

	   @Test
	   public void testMapper() {
	      log.info(mapper);
	   }
	   
	   @Test
	   public void testCreate() {
		   IntStream.rangeClosed(1, 10).forEach(i->{
			   ReplyVO vo = new ReplyVO();
			   vo.setBoardNum(boardNumArr[i%5]);
			   vo.setReply("reply"+i);
			   vo.setReplyer("replyer"+i);
			   mapper.insert(vo);   
			   
		   });
		   
	   }
	   
	      @Test
	      public void testRead() {
	         Long targetrno = 150L;
	         ReplyVO vo =mapper.read(targetrno);
	         log.info(vo);
	      }
	      
	      @Test
	      public void testDelete() {
	         Long targetRno = 1L;
	         mapper.delete(targetRno);
	      }
	      
	      @Test
	      public void testUpdate() {
	         Long targetRno =51L;
	         ReplyVO vo = mapper.read(targetRno);
	         vo.setReply("Update Reply");
	         int count=mapper.update(vo);
	         log.info("Update Count: "+count);
	      }
	      
	      @Test
	      public void testList() {
	    	  Criteria cri = new Criteria();
	    	  List<ReplyVO> replies = mapper.getListWithPaging(cri, boardNumArr[0]);
	    	  
	    	  replies.forEach(reply->log.info(reply));
	      }
	      
	      @Test
	      public void testList2() {
	         Criteria cri = new Criteria(1,3);
	         List<ReplyVO> replies = mapper.getListWithPaging(cri, 5L);
	         replies.forEach(reply ->log.info(reply));
	      }


}
