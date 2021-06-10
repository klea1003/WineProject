package org.wine.sample;

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
	private MockMvc mockMvc; // MockMvc :��¥ mvc
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	
	@Test
	public void testJoin() throws Exception {
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/user/join")
						.param("USER_ID", "yosepcontroller")
						.param("USER_NICKNAME", "controller")
						.param("USER_EMAIL", "controller@email")
						.param("USER_PASSWORD", "conPWD")
						.param("USER_PHONENUM", "010-5555-6666")
						.param("USER_REALNAME", "��Ʈ�ѷ�")
						.param("USER_BIRTHDAY", "2021-05-13")
						)
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
}
