package io.github.eyulingo.Controller.Users;

import io.github.eyulingo.Service.UserService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class UserFindPasswordCheckCodeController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/findcheckcode",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public
    @ResponseBody
    JSONObject userFindPasswordCheckCode(@RequestBody JSONObject data){
        return this.userService.findPasswordGetCode(data);
    }
}
