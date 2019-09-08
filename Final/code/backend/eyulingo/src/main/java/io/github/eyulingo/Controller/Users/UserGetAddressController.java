package io.github.eyulingo.Controller.Users;


import io.github.eyulingo.Service.UserService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class UserGetAddressController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/myaddress",method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public
    @ResponseBody
    JSONObject userMyAddress(){
        return this.userService.getMyAddress();
    }
}
