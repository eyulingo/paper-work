package io.github.eyulingo.Controller.Stores;


import io.github.eyulingo.Service.StoreService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class GoodAddTagController {
    @Autowired
    private StoreService storeService;


    @RequestMapping(value = "/store/addtag",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String storeAddTag(@RequestBody JSONObject data) {
        return this.storeService.addTag(data);
    }

}
