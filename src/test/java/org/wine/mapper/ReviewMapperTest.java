package org.wine.mapper;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.CriteriaReview;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(review->log.info(review));
	}
	
	@Test
	public void testGetListWithPaging() {
		CriteriaReview cri = new CriteriaReview();
		cri.setWineNum(1);
		
		log.info(cri);
		
		mapper.getListWithPaging(cri).forEach(review->log.info(review));
	}
	
	
}