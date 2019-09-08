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
public class GoodDetailController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/gooddetail",method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public
    @ResponseBody
    JSONObject userGoodDetail(HttpServletRequest httpServletRequest){
        return this.userService.goodDetail(Long.parseLong(httpServletRequest.getParameter("id")));
    }
}
