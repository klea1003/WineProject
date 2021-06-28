package org.wine.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j

public class WineControllerTests {
	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;
	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void testList() throws Exception {

		log.info(
			mockMvc.perform(MockMvcRequestBuilders.get("/wine/list"))
			.andReturn()
			.getModelAndView()
			.getModelMap());
	}
	
	@Test
	public void testListPaging() throws Exception{
		
		log.info(mockMvc.perform(
			MockMvcRequestBuilders.get("/wine/list")
			.param("pageNum", "2")
			.param("amount", "10"))
			.andReturn().getModelAndView().getModelMap());
		
	}
	
	@Test
	public void testRegister() throws Exception{
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/wine/register")
			.param("title", "wine2")
			.param("winenery", "winenery2")
			.param("grapes", "grapes2")
			.param("regions", "regions2")
			.param("allergens", "allergens2")
			.param("wineType", "wineType2")
			.param("region", "region2")
			.param("country", "country2")
			.param("price", "100")
			.param("alcohol", "1.2")
			.param("wineStyle", "wineStyle2")
			.param("imageName", "wineimage2")
		).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);		
	}
	
	@Test
	public void testGet() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/wine/get")
				.param("wno", "2"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
	
	@Test
	public void testGetTotalCount() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/wine/list")
				.param("amount", "10"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
}
