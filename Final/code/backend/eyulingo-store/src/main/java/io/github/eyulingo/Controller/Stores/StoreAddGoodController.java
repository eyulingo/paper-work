package io.github.eyulingo.Controller.Stores;


import io.github.eyulingo.Service.StoreService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class StoreAddGoodController {

    @Autowired
    private StoreService storeService;


    @RequestMapping(value = "/store/addgood",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String storeAddGoood(@RequestBody JSONObject data) {
        return this.storeService.addGood(data);
    }
}
