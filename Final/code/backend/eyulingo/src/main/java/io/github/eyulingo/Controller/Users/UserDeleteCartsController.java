package io.github.eyulingo.Controller.Users;

import io.github.eyulingo.Service.UserService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class UserDeleteCartsController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/deletecart",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public
    @ResponseBody
    String userDeleteCart(@RequestBody JSONObject data){
        return this.userService.deleteCart(data);
    }
}
