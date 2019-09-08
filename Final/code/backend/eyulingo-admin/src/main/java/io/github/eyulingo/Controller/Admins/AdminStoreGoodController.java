package io.github.eyulingo.Controller.Admins;


import io.github.eyulingo.Service.AdminService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
public class AdminStoreGoodController {
    @Autowired
    private AdminService adminService;


    @RequestMapping(value = "/admin/getgoods",method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public
    @ResponseBody
    JSONObject adminGetAllStore(HttpServletRequest httpServletRequest) {
        return this.adminService.getStoreGood(httpServletRequest.getParameter("store_id"));
    }
}
