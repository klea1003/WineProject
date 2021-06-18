package org.wine.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.Criteria;
import org.wine.domain.WineVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class WineMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private WineMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(wine->log.info(wine));
	}
	
	@Test
	public void testInsert() {
		WineVO wine = new WineVO();
		wine.setTitle("wine1");
		wine.setWinenery("winenery1");
		wine.setGrapes("grapes1");
		wine.setRegions("regions1");
		wine.setAllergens("allergens1");
		wine.setWineType("wineType1");
		wine.setRegion("region1");
		wine.setCountry("country1");
		wine.setPrice(100);
		wine.setAlcohol(0.5);
		wine.setWineStyle("style1");
		wine.setImageName("test.jpg");	
		
		mapper.insert(wine);
		
		log.info(wine);
	}
	
	@Test
	public void testRead() {
		
		WineVO wine = mapper.read(8L);
		
		log.info(wine);
	}
	
	@Test
	public void testPaging() {
		
		Criteria cri = new Criteria();
		
		cri.setPageNum(3);
		
		cri.setAmount(10);		
		
		List<WineVO> list = mapper.getListWithPaging(cri); 
		
		list.forEach(wine-> log.info(wine.getWno()));
	}
}