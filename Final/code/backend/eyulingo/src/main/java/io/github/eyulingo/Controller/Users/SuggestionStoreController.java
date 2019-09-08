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
public class SuggestionStoreController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/suggeststore",method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public
    @ResponseBody
    JSONObject userSuggestionStore(HttpServletRequest httpServletRequest){
        return this.userService.suggestionStore(httpServletRequest.getParameter("q"));
    }
}
