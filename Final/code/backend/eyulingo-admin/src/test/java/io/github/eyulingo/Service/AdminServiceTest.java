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
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import java.util.jar.JarEntry;

import static org.junit.Assert.*;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;


@Transactional
@Rollback()
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
public class AdminServiceTest {
    private MockMvc mockMvc;

    @Autowired
    private WebApplicationContext wac;

    @Before // 在测试开始前初始化工作
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).apply(springSecurity()).build();
    }

    @Autowired
    private AdminService adminService;

    @Test
    @WithMockUser(username="Admin1")
    public void modifyStoresTest(){
        JSONObject data = new JSONObject();
        data.accumulate("store_id",1 );
        data.accumulate("name","二餐便利店");
        data.accumulate("address", "地址，某地");
        data.accumulate("starttime", "28:00" );
        data.accumulate("endtime","-0:00" );
        data.accumulate("store_phone_nu","电话号码");
        assertEquals("{\"status\": \"ok\"}",adminService.modifyStores(data));
    }

    @Test
    @WithMockUser(username="Admin1")
    public  void modifyDistTest(){
        JSONObject data = new JSONObject();
        data.accumulate("store_id",1 );
        data.accumulate("location", "家庭地址");
        data.accumulate("truename","真实姓名");
        data.accumulate("dist_phone_nu", "经销商名字");
        data.accumulate("password","123456");
        assertEquals("{\"status\": \"ok\"}",adminService.modifyDist(data));
    }
}