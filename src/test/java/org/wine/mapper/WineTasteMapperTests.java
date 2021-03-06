package org.wine.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.WineVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class WineTasteMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private WineTasteMapper mapper;
	
	@Test
	public void getList() {
		mapper.getList(5L).forEach(wine->log.info(wine));
	}
	
}