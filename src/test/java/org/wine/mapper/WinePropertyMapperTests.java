package org.wine.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class WinePropertyMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private WinePropertyMapper mapper;
	
	@Test
	public void testWineTypeList() {
		mapper.getWineTypeList().forEach(wine->log.info(wine));
		
	}
	@Test
	public void getWineGrapeList() {
		mapper.getWineGrapeList().forEach(wine->log.info(wine));
		
	}
	@Test
	public void getWineRegionList() {
		mapper.getWineRegionList().forEach(wine->log.info(wine));
		
	}
	@Test
	public void getWineCountryList() {
		mapper.getWineCountryList().forEach(wine->log.info(wine));
		
	}
	@Test
	public void getWineStyleList() {
		mapper.getWineStyleList().forEach(wine->log.info(wine));
		
	}
	
}