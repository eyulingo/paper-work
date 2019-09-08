package io.github.eyulingo.Service;



import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



public interface AdminService {


    public JSONArray getAllStores();

    public String modifyStores(JSONObject data);

    public String modifyDist(JSONObject data);

    public JSONObject getStoreGood(String store_id);

    public String addTag(JSONObject data);

    public String deleteTag(JSONObject data);

}

