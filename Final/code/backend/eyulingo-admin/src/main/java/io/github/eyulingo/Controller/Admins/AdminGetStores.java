package io.github.eyulingo.Controller.Admins;


import io.github.eyulingo.Service.AdminService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@RestController
public class AdminGetStores {
    @Autowired
    private AdminService adminService;


    @RequestMapping(value = "/admin/getstore",method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public
    @ResponseBody
    JSONArray adminGetAllStore() {
        return this.adminService.getAllStores();
    }
}
