package io.github.eyulingo.Controller.Users

import net.sf.json.JSONObject
import org.springframework.web.bind.annotation.*

@RestController
class OKLoginController {

    @RequestMapping(value = ["/ok"], method = [RequestMethod.GET], produces = ["application/json;charset=UTF-8"])
    @ResponseBody
    fun adminModifyDist(): String {

        return "{\"status\": \"ok\"}"
    }
}
