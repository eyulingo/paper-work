package io.github.eyulingo.Controller.Stores;


import io.github.eyulingo.Service.StoreService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
public class StoreGetGoodCommentController {
    @Autowired
    private StoreService storeService;

    @RequestMapping(value = "/store/goodcomments",method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public
    @ResponseBody
    JSONObject storeGoodComment(HttpServletRequest httpServletRequest){
        return this.storeService.goodComments(new Long(httpServletRequest.getParameter("goodid")));
    }
}
