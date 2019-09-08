package io.github.eyulingo.Controller.Stores;

import io.github.eyulingo.Service.StoreService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
public class StoreSelectOrderController {
    @Autowired
    private StoreService storeService;

    @RequestMapping(value = "/store/selectorders",method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public
    @ResponseBody
    JSONObject storeSelect(HttpServletRequest httpServletRequest){
        return this.storeService.getSelectOrder(httpServletRequest.getParameter("startTime"),httpServletRequest.getParameter("endTime"),httpServletRequest.getParameter("username"));
    }
}
