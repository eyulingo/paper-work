package io.github.eyulingo.Controller.Admins;


import io.github.eyulingo.Service.AdminService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@RestController
public class AdminModifyStore {
    @Autowired
    private AdminService adminService;


    @RequestMapping(value = "/admin/modifystore",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public
    @ResponseBody
    String adminModitifyStores(@RequestBody JSONObject data) {
        return this.adminService.modifyStores(data);
    }
}
