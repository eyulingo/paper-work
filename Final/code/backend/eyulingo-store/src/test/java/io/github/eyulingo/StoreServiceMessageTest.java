package io.github.eyulingo;


import io.github.eyulingo.Service.StoreService;
import net.sf.json.JSONArray;
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

import java.util.ArrayList;
import java.util.List;

import static junit.framework.Assert.failNotEquals;
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
public class StoreServiceMessageTest {
    @Autowired
    private StoreService storeService;

    private MockMvc mockMvc;

    @Autowired
    private WebApplicationContext wac;

    @Before // 在测试开始前初始化工作
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).apply(springSecurity()).build();
    }


    @Test
    @WithMockUser(username="乌绮玉")
    public void getDistTest() {
        JSONObject item = new JSONObject();
        item.accumulate("store_id",1);
        item.accumulate("location", "上海市静安区中华新路479号");
        item.accumulate("truename","乌绮玉");
        item.accumulate("dist_phone_nu", "13640698865");
        item.accumulate("password", "Wuqiyu123456");
        item.accumulate("dist_image_id", "5d1d5e47634459000715143b");
        item.accumulate("status", "ok");
        assertEquals(item,storeService.getDist());

    }

    @Test
    @WithMockUser(username = "乌绮玉")
    public void getMyStoreTest(){
        JSONObject item = new JSONObject();
        JSONArray comments = new JSONArray();
        item.accumulate("store_id",1);
        item.accumulate("name","Apple Store 零售店");
        item.accumulate("address", "上海市黄浦区南京东路300号");
        item.accumulate("starttime", "10:00");
        item.accumulate("endtime", "22:00");
        item.accumulate("store_image_id", "5d1d683a6344590007151455");
        item.accumulate("delivery_method", "顺丰速运");
        item.accumulate("store_phone_nu", "400-666-8800");
        item.accumulate("star_number", 0);
        item.accumulate("star", 0);
        item.accumulate("comments",comments);
        item.accumulate("status", "ok");
        assertEquals(item,storeService.getMyStore());
    }

    @Test
    @WithMockUser(username = "乌绮玉")
    public void getDeliverTest(){
        JSONObject item = new JSONObject();
        item.accumulate("status", "ok");
        item.accumulate("delivery_method","顺丰速运");
        assertEquals(item,storeService.getDeliver());
    }

    @Test
    @WithMockUser(username = "乌绮玉")
    public void getAllDeliver(){
        JSONArray items = new JSONArray();
        List<String> list = new ArrayList<String>();
        list.add("中通快递");
        list.add("圆通快递");
        list.add("宅急送");
        list.add("汇通快递");
        list.add("申通快递");
        list.add("自提");
        list.add("邮政EMS");
        list.add("韵达快递");
        list.add("顺丰速运");
        for(int i = 0;i<list.size();i++){
            JSONObject item = new JSONObject();
            item.accumulate("delivery_method",list.get(i));
            items.add(item);
        }
        assertEquals(items,storeService.getAllDeliver());
    }


}
