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

public class BoardControllerTest {
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
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list")).andReturn().getModelAndView().getModelMap());
	}
	@Test
	public void testLike() throws Exception {
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/board/like")
						.param("userID", "user000")
						.param("boardNum", "1"))
						.andReturn().getModelAndView().getViewName();
		log.info("Like"+resultPage);
	}
	@Test
	public void testDisLike() throws Exception {
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/board/dislike")
						.param("userID", "user000")
						.param("boardNum", "1"))
						.andReturn().getModelAndView().getViewName();
		log.info("disLike"+resultPage);
	}
	@Test
	public void testResister() throws Exception {
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/board/register")
						.param("title", "test from controller")
						.param("content", "test from controller")
						.param("writer", "user0000")
						.param("boardType", "Q&A"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}

	@Test
	public void testGet() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get").param("boardNum", "2")).andReturn()
				.getModelAndView().getModelMap());
	}
	
	@Test
	public void testModify() throws Exception{
		String resultPage =
				mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
						.param("boardNum", "3")
						.param("title", "test modify from controller")
						.param("content", "test modify from controller")
						.param("writer", "user0001")
						.param("boardType", "Q&A"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
				
	}
	
	@Test 
	   public void testRemove() throws Exception{
	      String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
	            .param("boardNum", "8"))
	            .andReturn().getModelAndView().getViewName();
	      log.info(resultPage);
	   }
	
	@Test
	public void testListPaging() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list")
				.param("pageNum", "2").param("amount", "50"))
				.andReturn().getModelAndView().getModelMap());
	}

}
