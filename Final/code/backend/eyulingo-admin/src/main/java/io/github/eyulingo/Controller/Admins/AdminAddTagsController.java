package io.github.eyulingo.Controller.Admins;


import io.github.eyulingo.Service.AdminService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class AdminAddTagsController {

    @Autowired
    private AdminService adminService;


    @RequestMapping(value = "/admin/addtag",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String adminModifyDist(@RequestBody JSONObject data){
        return this.adminService.addTag(data);
    }
}
