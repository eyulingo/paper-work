package io.github.eyulingo.Controller.Stores;


import io.github.eyulingo.Service.StoreService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;



@RestController
public class StoreGetDistController {
    @Autowired
    private StoreService storeService;

    @RequestMapping(value = "/store/profile",method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public
    @ResponseBody
    JSONObject storeGetDist() {
        return this.storeService.getDist();
    }
}
