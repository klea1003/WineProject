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
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class SellerControllerTest {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception {
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/seller/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}
	
	
	@Test
	public void testGet() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/seller/get").param("sellerNum", "30"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
	
	@Test
	public void testModify() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/seller/modify")
				.param("sellerNum", "30")
				.param("sellerPhoneNum", "수정된 전화번호")
				.param("sellerLocation", "수정된 주소"))
			.andReturn().getModelAndView().getViewName();
			
		log.info(resultPage);
			
	}
	
	@Test 
	public void testRemove() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/seller/remove")
				.param("sellerNum", "30"))
				.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
		
	}
	
	
}
