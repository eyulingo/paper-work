package io.github.eyulingo.Controller.Stores;

import io.github.eyulingo.Service.StoreService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class StoreSetOrderController {
    @Autowired
    private StoreService storeService;


    @RequestMapping(value = "/store/setorder",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String storeSetOrder(@RequestBody JSONObject data) {
        return this.storeService.setOrder(data);
    }
}
