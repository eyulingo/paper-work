package io.github.eyulingo.ServiceImpl;


import io.github.eyulingo.Dao.*;
import io.github.eyulingo.Entity.*;
import io.github.eyulingo.Service.StoreService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import javax.xml.crypto.Data;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class StoreServiceImpl implements StoreService {
    @Autowired
    StoreRepository storeRepository;

    @Autowired
    StoreCommentsRepository storeCommentsRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    DeliversRepository deliversRepository;

    @Autowired
    GoodsRepository goodsRepository;

    @Autowired
    TagsRepository tagsRepository;

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    OrderitemsRepository orderitemsRepository;

    @Autowired
    GoodCommentsRepository goodCommentsRepository;

    public static Boolean checkPhone(String phone) {


        if (null == phone || "".equalsIgnoreCase(phone)) {

            return false;
        } else {
            if (phone.length() != 11) {
                return false;
            }
            String regex = "^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9])|(16[6]))\\d{8}$";
            // String regex1 = "/0\\d{2,3}-\\d{7,8}/";座机
            Pattern p = Pattern.compile(regex);
            Matcher m = p.matcher(phone);
            boolean isMatch = m.matches();
            if (!isMatch) {
                return false;
            }
        }
        return true;
    }

    public static Boolean checkTime(String time) {


        String regex = "([01][0-9]|2[0-3]):[0-5][0-9]";
        // String regex1 = "/0\\d{2,3}-\\d{7,8}/";座机
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(time);
        boolean isMatch = m.matches();
        return isMatch;
    }


    public JSONObject getDist() {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Stores store = storeRepository.findByDistName(userDetails.getUsername());
        JSONObject item = new JSONObject();
        item.accumulate("store_id", store.getStoreId());

        String location = store.getDistLocation();
        item.accumulate("location", location);


        String truename = store.getDistName();
            item.accumulate("truename", truename);


        String dist_phone_nu = store.getDistPhone();
        item.accumulate("dist_phone_nu", dist_phone_nu);


        String password = store.getDistPassword();
        item.accumulate("password", password);


        String dist_image_id = store.getDistImageId();

        item.accumulate("dist_image_id", dist_image_id);

        item.accumulate("status","ok");


        return item;
    }

    public String modifyDist(JSONObject data) {
        try {
            UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            Stores store = storeRepository.findByDistName(userDetails.getUsername());
            if(storeRepository.findByDistName(data.getString("truename")) != null && !data.getString("truename").equals(store.getDistName())){
                return "{\"status\": \"用户名已被他人使用\"}";
            }
            String dist_phone_nu = data.getString("dist_phone_nu");
            if (!checkPhone(dist_phone_nu)) {
                return "{\"status\": \"电话号码格式错误\"}";
            }

            String location = data.getString("location");
            if (!location.isEmpty()) {
                store.setDistLocation(location);
            }

            String truename = data.getString("truename");
            if (!location.isEmpty()) {
                store.setDistName(truename);
            }


            if (!location.isEmpty()) {
                store.setDistPhone(dist_phone_nu);
            }

            String password = data.getString("password");
            if (!location.isEmpty()) {
                store.setDistPassword(password);
            }
            storeRepository.save(store);
            return "{\"status\": \"ok\"}";
        } catch (Exception ex) {
            ex.printStackTrace();
            return "{\"status\": \"修改失败\"}";
        }
    }

    public JSONObject getMyStore() {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Stores store = storeRepository.findByDistName(userDetails.getUsername());
        JSONObject item = new JSONObject();
        item.accumulate("store_id", store.getStoreId());
        String name = store.getStoreName();
        if (!name.isEmpty()) {
            item.accumulate("name", name);
        }

        String address = store.getStoreAddress();
        if (!address.isEmpty()) {
            item.accumulate("address", address);
        }

        String starttime = store.getStartTime();
        if (!starttime.isEmpty()) {
            item.accumulate("starttime", starttime);
        }

        String endtime = store.getEndTime();
        if (!endtime.isEmpty()) {
            item.accumulate("endtime", endtime);
        }

        String store_image_id = store.getCoverId();
        if (!store_image_id.isEmpty()) {
            item.accumulate("store_image_id", store_image_id);
        }

        String delivery_method = store.getDeliverMethod();
        if (!delivery_method.isEmpty()) {
            item.accumulate("delivery_method", delivery_method);
        }


        String store_phone_nu = store.getStorePhone();
        if (!store_phone_nu.isEmpty()) {
            item.accumulate("store_phone_nu", store_phone_nu);
        }

        List<StoreComments> commentsList = storeCommentsRepository.findByStoreId(store.getStoreId());
        BigDecimal star = new BigDecimal(0);
        JSONArray comments =new JSONArray();
        for(StoreComments storeComments:commentsList){
            System.out.printf("Get one comment %s\n", storeComments.getStoreComments());
            JSONObject commentsitem = new JSONObject();
            Long userId = storeComments.getUserId();
            Users user= userRepository.findByUserId(userId);
            System.out.printf("Found username %s by %d\n", user.getUserName(), user.getUserId());
            commentsitem.accumulate("username",user.getUserName());
            commentsitem.accumulate("comment_content",storeComments.getStoreComments() );
            commentsitem.accumulate("star_count",storeComments.getStar() );
            comments.add(commentsitem);
            star.add(new BigDecimal(storeComments.getStar()));
        }
        if(commentsList.size()>0) {
            item.accumulate("star_number", commentsList.size());
            item.accumulate("star", star.floatValue()/(float)commentsList.size());
        }
        else{
            item.accumulate("star_number", 0);
            item.accumulate("star", 0);
        }
        item.accumulate("comments",comments);
        item.accumulate("status","ok");

        return item;
    }

    public String ChangeDistImage(JSONObject data){
            UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            Stores store = storeRepository.findByDistName(userDetails.getUsername());
            store.setDistImageId(data.getString("image_id"));
            storeRepository.save(store);
            return "{\"status\": \"ok\"}";
    }



    public String changeMyStore(JSONObject data){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Stores store = storeRepository.findByDistName(userDetails.getUsername());
        if (!checkPhone(data.getString("phone_nu"))) {
            return "{\"status\": \"电话号码格式错误\"}";
        }
        if(!data.getString("name").isEmpty()){
            store.setStoreName(data.getString("name"));
        }
        if(!data.getString("address").isEmpty()){
            store.setStoreAddress(data.getString("address"));
        }
        if(!data.getString("starttime").isEmpty()){
            store.setStartTime(data.getString("starttime"));
        }
        if(!data.getString("endtime").isEmpty()){
            store.setEndTime(data.getString("endtime"));
        }
        if(!data.getString("phone_nu").isEmpty()){
            store.setStorePhone(data.getString("phone_nu"));
        }
        storeRepository.save(store);
        return  "{\"status\": \"ok\"}";
    }


    public String changeStoreImage(JSONObject data){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Stores store = storeRepository.findByDistName(userDetails.getUsername());
        store.setCoverId(data.getString("image_id"));
        storeRepository.save(store);
        return "{\"status\": \"ok\"}";
    }


    public JSONObject getDeliver(){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Stores store = storeRepository.findByDistName(userDetails.getUsername());
        JSONObject item = new JSONObject();
        item.accumulate("delivery_method",store.getDeliverMethod());
        item.accumulate("status","ok");
        return item;
    }

    public String setDeliver(JSONObject data){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Stores store = storeRepository.findByDistName(userDetails.getUsername());
        store.setDeliverMethod(data.getString("delivery"));
        storeRepository.save(store);
        return "{\"status\": \"ok\"}";
    }

    public JSONArray getAllDeliver(){
        List<Delivers> delivers = deliversRepository.findAll();
        JSONArray item = new JSONArray();
        for(Delivers Deliver:delivers){
            JSONObject data = new JSONObject();
            data.accumulate("delivery_method",Deliver.getDeliverName());
            item.add(data);
        }
        return item;
    }

    public JSONObject getGoods(){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Stores store = storeRepository.findByDistName(userDetails.getUsername());
        List<Goods> GoodsList = goodsRepository.findByStoreId(store.getStoreId());
        JSONObject allGoods = new JSONObject();
        JSONArray goods = new JSONArray();
        for(Goods good:GoodsList){
            JSONObject item = new JSONObject();
            item.accumulate("id", good.getGoodId());
            String name = good.getGoodName();
            if (!name.isEmpty()) {
                item.accumulate("name", name);
            }

            BigDecimal price = good.getPrice();
            if (price != null) {
                item.accumulate("price", price);
            }

            BigDecimal count_price = good.getDiscount();
            if (count_price != null) {
                item.accumulate("coupon_price", count_price);
            }

            Long storage = good.getStorage();
            if (storage != null) {
                item.accumulate("storage", storage);
            }

            String description = good.getDescription();
            if (!description.isEmpty()) {
                item.accumulate("description", description);
            }

            String image_id = good.getGoodImageId();
            if (!image_id.isEmpty()) {
                item.accumulate("image_id", image_id);
            }


            Boolean hidden = good.getHidden();
            if (hidden != null) {
                item.accumulate("hidden", hidden);
            }

            List<Tags> tagsList = tagsRepository.findByGoodId(good.getGoodId());
            List<String> list = new ArrayList<String>();
            for(Tags tag:tagsList){
                list.add(tag.getTagName());
            }
            item.accumulate("tags",list);
            goods.add(item);
        }
        allGoods.accumulate("status","ok");
        allGoods.accumulate("values",goods);
        return  allGoods;
    }

    public String modifyGoods(JSONObject data){
        Goods good = goodsRepository.findByGoodId(data.getLong("good_id"));
        Long coupon_price = data.getLong("coupon_price");
        if(coupon_price<=0 || data.getLong("price")<0){
            return "{\"status\": \"价格必须为正数\"}";
        }
        if(!data.getString("description").isEmpty()) {
            good.setDescription(data.getString("description"));
        }
        if(!data.getString("image_id").isEmpty()) {
            good.setGoodImageId(data.getString("image_id"));
        }
        if(!data.getString("name").isEmpty()){
            good.setGoodName(data.getString("name"));
        }
        Long price = data.getLong("price");
        if( price != null) {
            good.setPrice(new BigDecimal(data.getLong("price")));
        }

        if( coupon_price != null) {
            good.setDiscount(new BigDecimal(data.getLong("coupon_price")));
        }
        Long storage = data.getLong("storage");
        if( storage != null) {
            if(storage<0){
                good.setStorage(new Long(0));
            }
            else{good.setStorage(data.getLong("storage"));}
        }
        Boolean hidden = data.getBoolean("hidden");
        if(hidden != null) {
            good.setHidden(hidden);
        }
        goodsRepository.save(good);
        return "{\"status\": \"ok\"}";
    }

    public String addGood(JSONObject data){
        try {
            UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            Stores store = storeRepository.findByDistName(userDetails.getUsername());
            if(data.getLong("coupon_price")<0 || data.getLong("price")<0){
                return "{\"status\": \"价格必须大于0\"}";
            }
            Goods new_good = new Goods();
            new_good.setHidden(false);
            if(data.getLong("storage")<0){
                new_good.setStorage(new Long(0));
            }else {
                new_good.setStorage(data.getLong("storage"));
            }
            new_good.setDiscount(new BigDecimal(data.getLong("coupon_price")));
            new_good.setPrice(new BigDecimal(data.getLong("price")));
            new_good.setGoodName(data.getString("name"));
            new_good.setGoodImageId(data.getString("image_id"));
            new_good.setDescription(data.getString("description"));
            new_good.setStoreId(store.getStoreId());
            goodsRepository.save(new_good);
            return "{\"status\": \"ok\"}";
        }
        catch (Exception ex){
            return "{\"status\": \"internal_error\"}";
        }
    }

    public String addTag(JSONObject data){
        Tags tag = new Tags();
        tag.setGoodId(data.getLong("good_id"));
        tag.setTagName(data.getString("tag_name"));
        tagsRepository.save(tag);
        return "{\"status\": \"ok\"}";
    }

    public String deleteTag(JSONObject data){
        Tags tag = tagsRepository.findByGoodIdAndAndTagName(data.getLong("good_id"),data.getString("tag_name"));
        tagsRepository.delete(tag);
        return "{\"status\": \"ok\"}";
    }


    public JSONObject storeOrders(){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Stores store = storeRepository.findByDistName(userDetails.getUsername());
        List<Orders> ordersList = orderRepository.findByStoreId(store.getStoreId());
        JSONObject result = new JSONObject();
        JSONArray values = new JSONArray();
        for(Orders order:ordersList){
            if(!order.getStatus().equals("unpurchased")) {
                JSONObject item = new JSONObject();
                item.accumulate("user_id", order.getUserId());
                item.accumulate("username", userRepository.findByUserId(order.getUserId()).getUserName());
                item.accumulate("bill_id", order.getOrderId());
                item.accumulate("receiver", order.getReceiver());
                item.accumulate("receiver_phone", order.getRePhone());
                item.accumulate("receiver_address", order.getReAddress());
                item.accumulate("transport_method", order.getDeliverMethod());
                item.accumulate("order_status", order.getStatus());
                item.accumulate("time", order.getOrderTime().toString());
                item.accumulate("rated",order.getRated());
                if(order.getRated()){
                    item.accumulate("star_count",order.getRateLevel());
                    item.accumulate("comment_content",order.getCommentContent());
                }
                List<OrderItems> orderItemsList = orderitemsRepository.findByOrderId(order.getOrderId());
                JSONArray goodsList = new JSONArray();
                for (OrderItems orderItem : orderItemsList) {
                    Goods good = goodsRepository.findByGoodId(orderItem.getGoodId());
                    JSONObject goodDetail = new JSONObject();
                    goodDetail.accumulate("id", orderItem.getGoodId());
                    goodDetail.accumulate("name", good.getGoodName());
                    goodDetail.accumulate("store", store.getStoreName());
                    goodDetail.accumulate("store_id", store.getStoreId());
                    goodDetail.accumulate("current_price", orderItem.getCurrentPrice());
                    goodDetail.accumulate("amount", orderItem.getAmount());
                    goodDetail.accumulate("description", good.getDescription());
                    goodDetail.accumulate("image_id", good.getGoodImageId());
                    goodsList.add(goodDetail);
                }
                item.accumulate("goods", goodsList);
                values.add(item);
            }
        }
        values.sort(Comparator.comparing(obj -> ((JSONObject) obj).getString("time")).reversed());
        result.accumulate("status","ok");
        result.accumulate("values",values);
        return result;
    }

    public String setOrder(JSONObject data){
        Long id = data.getLong("id");
        String status = data.getString("status");
        Orders order = orderRepository.findByOrderId(id);
        if(order.getStatus().equals("unpurchased")){
           return "{\"status\": \"订单不存在\"}";
        }
        if(status.equals("invalid")){
            List<OrderItems> list = orderitemsRepository.findByOrderId(id);
            for(OrderItems orderItems:list){
                Goods good = goodsRepository.findByGoodId(orderItems.getGoodId());
                good.setStorage(good.getStorage()+orderItems.getAmount());
                orderitemsRepository.delete(orderItems);
            }
            orderRepository.delete(order);
            return "{\"status\": \"ok\"}";
        }
        order.setStatus(status);
        orderRepository.save(order);
        return "{\"status\": \"ok\"}";
    }

    public JSONObject goodComments(Long id){
        List<GoodComments> commentsList = goodCommentsRepository.findByGoodId(id);
        JSONObject item = new JSONObject();
        JSONArray commentItems = new JSONArray();
        BigDecimal star = new BigDecimal(0);
        for(GoodComments comment:commentsList){
            JSONObject commentItem = new JSONObject();
            Users users = userRepository.findByUserId(comment.getUserId());
            commentItem.accumulate("username",users.getUserName());
            commentItem.accumulate("comment_content",comment.getGooodComment());
            commentItem.accumulate("star_count",comment.getStar());
            commentItems.add(commentItem);
            star = star.add(new BigDecimal(comment.getStar()));
            System.out.printf(star.toString());
        }
        item.accumulate("comments", commentItems);
        if(commentsList.size()>0) {
            item.accumulate("star_number", commentsList.size());
            item.accumulate("star", star.floatValue()/(float)commentsList.size());

        }
        else{
            item.accumulate("star_number", 0);
            item.accumulate("star", 0);
        }
        item.accumulate("good_name",goodsRepository.findByGoodId(id).getGoodName());
        item.accumulate("status","ok");
        return item;
    }

    public JSONObject getSelectOrder(String startTime,String endTime,String username) {
        Format f = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
        Timestamp sTime = new Timestamp(new Date().getTime());
        Timestamp eTime = new Timestamp(new Date().getTime());
        if (!startTime.isEmpty()) {
            Date start = null;
            try {
                start = (Date) f.parseObject(startTime + "T00:00:00");
            } catch (ParseException e) {
                e.printStackTrace();
            }
            sTime = new Timestamp(start.getTime());
        }
        if(!endTime.isEmpty()) {
            Date end = null;
            try {
                end = (Date) f.parseObject(endTime + "T23:59:59");
            } catch (ParseException e) {
                e.printStackTrace();
            }
            eTime = new Timestamp(end.getTime());
        }
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Stores store = storeRepository.findByDistName(userDetails.getUsername());
        List<Orders> ordersList = orderRepository.findByStoreId(store.getStoreId());
        JSONObject result = new JSONObject();
        JSONArray values = new JSONArray();
        for(Orders order:ordersList){
            if ((startTime.equals("") || sTime.compareTo(order.getOrderTime())<=0)
                    && (endTime.equals("")||eTime.compareTo(order.getOrderTime())>=0)
                    && (username.equals("")||userRepository.findByUserId(order.getUserId()).getUserName().equals(username))){
                JSONObject item = new JSONObject();
                item.accumulate("user_id", order.getUserId());
                item.accumulate("username", userRepository.findByUserId(order.getUserId()).getUserName());
                item.accumulate("bill_id", order.getOrderId());
                item.accumulate("receiver", order.getReceiver());
                item.accumulate("receiver_phone", order.getRePhone());
                item.accumulate("receiver_address", order.getReAddress());
                item.accumulate("transport_method", order.getDeliverMethod());
                item.accumulate("order_status", order.getStatus());
                item.accumulate("time",order.getOrderTime().toString());
                List<OrderItems> orderItemsList = orderitemsRepository.findByOrderId(order.getOrderId());
                JSONArray goodsList = new JSONArray();
                for (OrderItems orderItem : orderItemsList) {
                    Goods good = goodsRepository.findByGoodId(orderItem.getGoodId());
                    JSONObject goodDetail = new JSONObject();
                    goodDetail.accumulate("id", orderItem.getGoodId());
                    goodDetail.accumulate("name", good.getGoodName());
                    goodDetail.accumulate("store", store.getStoreName());
                    goodDetail.accumulate("store_id", store.getStoreId());
                    goodDetail.accumulate("current_price", orderItem.getCurrentPrice());
                    goodDetail.accumulate("amount", orderItem.getAmount());
                    goodDetail.accumulate("description", good.getDescription());
                    goodDetail.accumulate("image_id", good.getGoodImageId());
                    goodsList.add(goodDetail);
                }
                item.accumulate("goods", goodsList);
                values.add(item);
            }
        }
        values.sort(Comparator.comparing(obj -> ((JSONObject) obj).getString("time")).reversed());
        result.accumulate("status","ok");
        result.accumulate("values",values);
        return result;
    }
}
