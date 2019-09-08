package io.github.eyulingo.Controller.Users;


import io.github.eyulingo.Service.UserService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class UserRegister {
    @Autowired
    UserService userService;

    @RequestMapping(value = "/register",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String UserRegister(@RequestBody JSONObject data){
        return this.userService.register(data);
    }
}
