package io.github.eyulingo.Service;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public interface StoreService {

    public JSONObject getDist();

    public String modifyDist(JSONObject data);

    public JSONObject getMyStore();

    public  String ChangeDistImage(JSONObject data);

    public String changeMyStore(JSONObject data);

    public String changeStoreImage(JSONObject data);

    public JSONObject getDeliver();

    public  String setDeliver(JSONObject data);

    public JSONArray getAllDeliver();

    public JSONObject getGoods();

    public String modifyGoods(JSONObject data);

    public String addGood(JSONObject data);

    public String addTag(JSONObject data);

    public String deleteTag(JSONObject data);

    public JSONObject storeOrders();

    public String setOrder(JSONObject data);

    public JSONObject goodComments(Long id);

    public JSONObject getSelectOrder(String startTime,String endTime,String username);
}
