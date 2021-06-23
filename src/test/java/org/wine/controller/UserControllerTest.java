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

public class UserControllerTest {
	
	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;
	private MockMvc mockMvc; // MockMvc
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void testList() throws Exception{
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/user/userlist"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
		
	}
	
	@Test
	public void testJoin() throws Exception {
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/user/join")
						.param("userId", "yosepcontroller")
						.param("userNickName", "controller")
						.param("userEmail", "controller@email")
						.param("userPassword", "conPWD")
						.param("userPhoneNum", "010-5555-6666")
						.param("userRealName", "최요셉")
						.param("userBirthDay", "2021-05-13")
						)
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
}
