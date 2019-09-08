package io.github.eyulingo.Controller.Stores;



import io.github.eyulingo.Service.StoreService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;


@RestController
public class StoreDistModifyController {


    @Autowired
    private StoreService storeService;

    @RequestMapping(value = "/store/modifydist",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String storeModifyDist(@RequestBody JSONObject data) {
        return this.storeService.modifyDist(data);
    }
}
