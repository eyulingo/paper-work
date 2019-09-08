package io.github.eyulingo.Controller.Users

import net.sf.json.JSONObject
import org.springframework.web.bind.annotation.*

@RestController
class FailureLoginController {

    @RequestMapping(value = ["/failure"], method = [RequestMethod.GET], produces = ["application/json;charset=UTF-8"])
    @ResponseBody
    fun adminModifyDist(): String {
        return "{\"status\": \"bad_auth\"}"
    }
}
