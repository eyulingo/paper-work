package io.github.eyulingo.Service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.springframework.stereotype.Service;


public interface UserService {
    public JSONObject getCheckCode(JSONObject data);

    public String register(JSONObject data);

    public JSONObject getMe();

    public String changeImage(JSONObject data);

    public String changePassword(JSONObject data);

    public String changeEmail(JSONObject data);

    public JSONObject findPasswordGetCode(JSONObject data);

    public String findPassword(JSONObject data);

    public JSONObject getMyAddress();

    public String addAddress(JSONObject data);

    public String removeAddress(JSONObject data);

    public String changeAddress(JSONObject data);

    public JSONObject searchGoods(String data);

    public JSONObject searchStore(String data);

    public JSONObject goodDetail(Long id);

    public JSONObject storeDetail(Long id);

    public String addToCart(JSONObject data);

    public JSONObject myCart();

    public String deleteCart(JSONObject data);

    public JSONObject purchase(JSONObject data);

    public JSONObject orderList();

    public String commentGoods(JSONObject data);

    public String commentStores(JSONObject data);

    public JSONObject suggestionGood(String data);

    public JSONObject suggestionStore(String data);

    public String getPassword();

    public String editCart(JSONObject data);

    public String pay(JSONObject data);

    public String deleteOrder(JSONObject data);

    public JSONObject storeByOrders(String data);

    public JSONObject storeByStar(String data);

    public JSONObject storeByDistance(String data,double longitude,double latitude);

    public String orderComment(JSONObject data);

    public JSONObject tags();

    public String confirmOrder(JSONObject data);

}
