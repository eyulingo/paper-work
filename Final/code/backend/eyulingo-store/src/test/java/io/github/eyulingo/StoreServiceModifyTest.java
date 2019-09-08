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
public class StoreServiceModifyTest {
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
    public void modifyDistTest() {
        JSONObject item = new JSONObject();
        item.accumulate("location", "上海市静安区中华新路479号123");
        item.accumulate("truename","乌绮玉");
        item.accumulate("dist_phone_nu", "13640698865");
        item.accumulate("password", "Wuqiyu123456");
        storeService.modifyDist(item);
        assertEquals("上海市静安区中华新路479号123",storeService.getDist().getString("location"));

    }



    @Test
    @WithMockUser(username = "乌绮玉")
    public void changeMyStoreTest(){
        JSONObject item = new JSONObject();
        item.accumulate("name","Apple Store 零售店 b");
        item.accumulate("address", "上海市黄浦区南京东路300号");
        item.accumulate("starttime", "10:00");
        item.accumulate("endtime", "22:00");
        item.accumulate("phone_nu", "400-666-8800");
        storeService.changeMyStore(item);
        assertEquals("Apple Store 零售店 b",storeService.getMyStore().getString("name"));
    }


    @Test
    @WithMockUser(username = "乌绮玉")
    public void changeDistImageTest(){
        JSONObject item = new JSONObject();
        item.accumulate("image_id","456789");
        storeService.ChangeDistImage(item);
        assertEquals("456789",storeService.getDist().getString("dist_image_id"));
    }

    @Test
    @WithMockUser(username = "乌绮玉")
    public void changeStoreImageTest(){
        JSONObject item = new JSONObject();
        item.accumulate("image_id","456789");
        storeService.changeStoreImage(item);
        assertEquals("456789",storeService.getMyStore().getString("store_image_id"));
    }

    @Test
    @WithMockUser(username = "乌绮玉")
    public void setDeliverTest(){
        JSONObject item = new JSONObject();
        item.accumulate("delivery","自提");
        storeService.setDeliver(item);
        assertEquals("自提",storeService.getDeliver().getString("delivery_method"));
    }

}
