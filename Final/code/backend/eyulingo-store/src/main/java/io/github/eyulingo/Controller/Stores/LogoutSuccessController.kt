package io.github.eyulingo.Controller.Stores

import net.sf.json.JSONObject
import org.springframework.web.bind.annotation.*

@RestController
class LogoutSuccessController {

    @RequestMapping(value = ["/kickout"], method = [RequestMethod.GET], produces = ["application/json;charset=UTF-8"])
    @ResponseBody
    fun adminModifyDist(): String {
        return "{\"status\": \"ok\"}"
    }
}
