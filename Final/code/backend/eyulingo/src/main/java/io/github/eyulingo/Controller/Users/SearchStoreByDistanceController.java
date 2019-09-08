package io.github.eyulingo.Controller.Users;


import io.github.eyulingo.Service.UserService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
public class SearchStoreByDistanceController {
    @Autowired
    UserService userService;

    @RequestMapping(value = "/searchstorebydistance",method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public
    @ResponseBody
    JSONObject userSearchGood(HttpServletRequest httpServletRequest){
        return this.userService.storeByDistance(httpServletRequest.getParameter("q"),Double.parseDouble(httpServletRequest.getParameter("long")),Double.parseDouble(httpServletRequest.getParameter("lat")));
    }
}
