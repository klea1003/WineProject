package org.wine.mapper;

import java.util.ArrayList;
import java.util.List;

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
public class WineMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private WineMapper mapper;
	
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
		
		WineVO wine = mapper.read(100L);		
		log.info(wine);
	}
	
	@Test
	public void testPaging() {
		
		CriteriaWine cri = new CriteriaWine();		
		cri.setPageNum(3);		
		cri.setAmount(10);				
		List<WineVO> list = mapper.getListWithPaging(cri);		
		list.forEach(wine-> log.info(wine.getWno()));
	}
	
	@Test
	public void testGetTotalCount1() {
		
		CriteriaWine cri = new CriteriaWine();		
		int count = mapper.getTotalCount(cri);		
		log.info(count);
	}
	
	@Test
	public void testGetTotalCount2() {
		
		CriteriaWine cri = new CriteriaWine(); 
		
		ArrayList<String> wineGrapeArr = new ArrayList<>(); 
		wineGrapeArr.add("Malbec");
		wineGrapeArr.add("Gamay"); 
		
		cri.setWineGrapeArr(wineGrapeArr);
		
		int count = mapper.getTotalCount(cri);		
		log.info(count);
	}
	
	@Test
	public void testWineTypeArr1() {
		CriteriaWine cri = new CriteriaWine();
		
		ArrayList<String> wineTypeArr = new ArrayList<>();
		
		cri.setWineTypeArr(wineTypeArr);
		
		List<WineVO> list = mapper.getListWithPaging(cri);
		log.info(list.size());
		log.info(list);
		
	}
	
	@Test
	public void testWineTypeArr2() {
		CriteriaWine cri = new CriteriaWine();
		
		ArrayList<String> wineTypeArr = new ArrayList<>(); 		
		wineTypeArr.add("Red wine");
		
		cri.setWineTypeArr(wineTypeArr);
		
		List<WineVO> list = mapper.getListWithPaging(cri);
		log.info(list.size());
		log.info(list);
		
	}
	
	@Test
	public void testWineTypeArr3() {
		CriteriaWine cri = new CriteriaWine();
		
		ArrayList<String> wineTypeArr = new ArrayList<>(); 		
		wineTypeArr.add("Red wine");
		wineTypeArr.add("White wine");
		
		cri.setWineTypeArr(wineTypeArr);
		
		List<WineVO> list = mapper.getListWithPaging(cri);
		log.info(list.size());
		log.info(list);
		
	}
	
	@Test
	public void testWineGrapeArr1() {
		CriteriaWine cri = new CriteriaWine(); 
		
		ArrayList<String> wineGrapeArr = new ArrayList<>(); 
		wineGrapeArr.add("Malbec"); 
		
		cri.setWineGrapeArr(wineGrapeArr);
		
		List<WineVO> list = mapper.getListWithPaging(cri); 
		log.info(list.size());
		log.info(list); 
	}
	
	@Test
	public void testWineGrapeArr2() {
		CriteriaWine cri = new CriteriaWine(); 
		
		ArrayList<String> wineGrapeArr = new ArrayList<>(); 
		wineGrapeArr.add("Malbec");
		wineGrapeArr.add("Gamay"); 
		
		cri.setWineGrapeArr(wineGrapeArr);
		
		List<WineVO> list = mapper.getListWithPaging(cri); 
		log.info(list.size());
		log.info(list); 
	}
	
	@Test
	public void testWineRegionArr() {
		CriteriaWine cri = new CriteriaWine(); 
		
		ArrayList<String> wineRegionArr = new ArrayList<>(); 
		wineRegionArr.add("Spain");
		
		cri.setWineRegionArr(wineRegionArr);
		
		List<WineVO> list = mapper.getListWithPaging(cri); 
		log.info(list.size());
		log.info(list);
	}
	
	@Test
	public void testWineCountryArr() {
		CriteriaWine cri = new CriteriaWine(); 
		
		ArrayList<String> wineCountryArr = new ArrayList<>(); 
		wineCountryArr.add("France");
		
		cri.setWineCountryArr(wineCountryArr);
		
		List<WineVO> list = mapper.getListWithPaging(cri); 
		log.info(list.size());
		log.info(list);
	}
	
	@Test
	public void testWineStyleArr() {
		CriteriaWine cri = new CriteriaWine(); 
		
		ArrayList<String> wineStyleArr = new ArrayList<>(); 
		wineStyleArr.add("Spanish Red");
		
		cri.setWineStyleArr(wineStyleArr);
		
		List<WineVO> list = mapper.getListWithPaging(cri); 
		log.info(list.size());
		log.info(list);
	}
	
	@Test
	public void testWineRating() {
		CriteriaWine cri = new CriteriaWine(); 
		
		cri.setWineRating(3);
		
		List<WineVO> list = mapper.getListWithPaging(cri);
		log.info(cri);
		log.info(list.size());
		log.info(list);
	}
	
	@Test
	public void testWineKeyword() {
		CriteriaWine cri = new CriteriaWine(); 
		
		cri.setKeyword("Lady");;
		
		List<WineVO> list = mapper.getListWithPaging(cri); 
		log.info(list.size());
		log.info(list);
	}
	
	@Test
	public void testGetWineRatingList() {
		CriteriaWine cri = new CriteriaWine(); 
		
		ArrayList<String> wineTypeArr = new ArrayList<>(); 		
		wineTypeArr.add("Red wine");
		
		cri.setWineTypeArr(wineTypeArr);
		
		List<WineVO> list = mapper.getListWithPaging(cri);
		log.info("list size" +  list.size());
		log.info(list);
	}
	
	@Test
	public void testGetwineRead() {
		
		WineVO wine = mapper.read(8L);
		log.info(wine);				
	}
	@Test
	public void testGetWinePriceList() {
		CriteriaWine cri = new CriteriaWine();
		cri.setWinePriceRange(80000, 100000);
		
		List<WineVO> list = mapper.getListWithPaging(cri);
		log.info("list size" +  list.size());
		log.info(list);
		
	}
	@Test
	public void testGetWineGrapeList() {
		CriteriaWine cri = new CriteriaWine();

		ArrayList<String> wineGrapeArr = new ArrayList<>(); 		
		wineGrapeArr.add("Malbec");
		
		cri.setWineGrapeArr(wineGrapeArr);
		
		List<WineVO> list = mapper.getListWithPaging(cri);
		log.info("list size" +  list.size());
		log.info(list);
		
	}
	
}