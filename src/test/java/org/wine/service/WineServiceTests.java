package org.wine.service;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.Arrays;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.CriteriaWine;
import org.wine.domain.WineVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class WineServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private WineService service;
	
	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister( ) {
		
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
		
		service.register(wine);
		
		log.info("wine number:" + wine.getWno());
	}
	
	@Test
	public void testGetList() {
		CriteriaWine cri = new CriteriaWine(2,10);
		cri.setWineTypeArr(new ArrayList<String>(Arrays.asList("Red wine")));
		cri.setWineGrapeArr(new ArrayList<String>(Arrays.asList("Malbec")));		
		
		service.getList(cri).forEach(wine -> log.info(wine));
	}
	
	@Test
	public void testGetGrapeList() {
		CriteriaWine cri = new CriteriaWine(2,10);
		cri.setWineGrapeArr(new ArrayList<String>(Arrays.asList("Malbec")));		
		
		service.getList(cri).forEach(wine -> log.info(wine));
	}
	
	@Test
	public void testGet() {
		log.info(service.get(1L));
	}
	
	@Test
	public void testWinePropertyList() {
		ArrayList<Integer> ids = new ArrayList<Integer>();
		ids.add(1);
		ids.add(3);
		
		service.getWinPropertyDTO("wine_type", ids).forEach(propertyDTO -> log.info(propertyDTO));
		
	}

}
