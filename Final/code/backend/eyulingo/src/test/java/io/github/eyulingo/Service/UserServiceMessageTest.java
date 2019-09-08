package io.github.eyulingo.Service;


import net.sf.json.JSONObject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import static net.sf.json.test.JSONAssert.assertEquals;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;


/**
 * Created by admin on 2017/9/21-11:33.
 * Description :
 */
@Transactional
@Rollback()
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
public class UserServiceMessageTest {
    @Autowired
    private UserService userService;

    private MockMvc mockMvc;

    @Autowired
    private WebApplicationContext wac;

    @Before // 在测试开始前初始化工作
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).apply(springSecurity()).build();
    }

    @Test
    public void getCheckCodeTest(){
        JSONObject data= new JSONObject();
        data.accumulate("email","121728670@qq.com");
        JSONObject item = new JSONObject();
        item.accumulate("status","ok");
        assertEquals(item, userService.getCheckCode(data));
    }



    @Test
    @WithMockUser(username="无竹")
    public void getMeTest() {
        JSONObject item = new JSONObject();
        item.accumulate("username","无竹");
        item.accumulate("userid","6");
        item.accumulate("email", "wu_zhu@foxmail.com");
        item.accumulate("avatar","5d1d5d6b6344590007151439" );
        item.accumulate("status", "ok");
        assertEquals(item, userService.getMe());
    }




}
