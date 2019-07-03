登录

“/login”
Method: POST
Parameters:
	“username”
	“password”
Return:
	{
“Status”: “ok”/“admin_user”/“bad_auth”/“account_locked”/“internal_error”
	}


===================================


获取验证码
“/getcode”
Method: POST
Parameters: 
	phone_no: “1234566789”
Return:
	Status: “ok”/ “internal_error”
	Code: “123456”

===================================

注册
“/register”
Method: POST
Parameters:
	“phone_no”
	“username”
	“password”
	“confirm_password”
	“confirm_code”
Return:
	“Status”: “ok”/“bad_confirm”/“bad_phone_no”/“bad_confirm_code”/“internal_error”

===================================

修改密码
“/changepassword”
Method: .POST
Parameters:
    "origin_password: 旧密码
    "new_password: 新密码
    "confirm_new_password": 确认新密码

Return:
    “Status”: “ok”/“bad_confirm”/“internal_error”

===================================

换绑手机
“/changephoneno”
Method: .POST
Parameters:
    "new_phone_no": 新号码
    "confirm_code": 确认代码
Return：
    “Status”: “ok”, "bad_phone_no”/“bad_confirm_code”/“internal_error”

===================================

搜索商品
“/searchgood”
Method: .GET
Parameters:
	“q” - 关键字
Return:
	“Status”: “ok”, “internal_error”
	“values”: [{
		“id”: 商品 ID
		“name”: 商品名称
		“store”: 商店名称
	    “store_id” ：商店ID
		“price”: 价格
		“coupon_price”: 优惠价格
		“storage”: 库存
		“description”: 描述
		“image_id”: 图片 ID
		"tags": { “...”, “...” }
	} ...
	]

===================================

搜索店铺
“/searchstore”
Method: .GET
Parameters:
	“q” - 关键字
Return:
	“Status”: “ok”/“internal_error”
	“values”: [{
	“id”: 店铺 ID
	“name”: 店铺名称
	“address”: 店铺地址
	“time”: 营业时间
	“image_id”: 图片地址
	}]

===================================

商品详情
“/gooddetail”
Method: .GET
Parameters:
	“id”: 商品 ID
Return:
	{
	“status”: “ok”/  “not_exist” / “internal_error”
		“id”: 商品 ID
		“name”: 商品名称
		“store”: 商店名称
 		“store_id”: 商店 ID
		“price”: 价格
		“coupon_price”: 优惠价格
		“storage”: 库存
		“description”: 描述
		“image_id”: 图片 ID
		“comments”: [{ “username”, “comment_content”: “star_count”}...]
	}

===================================

商店详情
“/storedetail”
Method: .GET
Parameters:
	“id”: 店铺 ID
Return: {
	“status”: “ok”/“not_exist”, “internal_error”
	“name”: 店铺名称
	“id”: 店铺 ID
	“address”: 店铺地址
	“time”: 营业时间
	“image_id”: 图片地址
	“phone_no”: 联系电话
	“provider”: 经销商名称
    "provider_avatar": 经销商头像
	“comments”: [{ “username”, “comment_content”: “star_count”}...]
	“values”: 
	[{
		“id”: 商品 ID
		“name”: 商品名称
		“store”: 商店名称
		“price”: 价格
		“coupon_price”: 优惠价格
		“storage”: 库存
		“description”: 描述
		“image_id”: 图片 ID
	} ...]
}

===================================

加入购物车
“/addtocart”
Method: .POST

Parameters:
	“id”: 商品 ID
	“amount”: 购买数量
Return: {
	“status”: “ok”/“internal_error"
}

===================================

查看购物车
“/mycart”
Method: .GET

Parameters: <none>
Return: {
	“status”: “ok”/“internal_error”
	“values”: [{ 
		“商品名称”: 
		“商品 ID”:
		“商品图片 ID”
		“单价”:
		“数量"
	 }]

===================================

购买
“/purchase”
Method: .POST

Parameters:
	“id”: 商品 ID
	“amount”: 商品数量
	“receive_no”: 收货人
	“receive_phone”: 收货电话
	“receive_address”: 收货地址

<special>: 同时发送多个商品写法：
?id=1&id=2&id=3&amount=1&amount=2&amount=3

Return:
	“status”: “ok”/“internal_error”
	“cost”: “¥12.50”

===================================

评价商品
“/commentgood”
Method: .POST

Parameters:
	“id”: 商品 ID
	“star_count”: 星级
	“comment_content”: 评价内容

Return:
	“status”: “ok”/“not_purchased”/“internal_error”

===================================

评价店铺
“/commentstore”
Method: .POST

Parameters:
	“id”: 商店 ID
	“star_count”: 星级
	“comment_content”: 评价内容

Return:
	“status”: “ok”/“not_purchased”/“internal_error”

===================================

查看已购买订单
“/orderlist”

Method: .GET

Parameters: <none>

Return:
	“status”: “ok” / ‘internal_error”
	“values”: [{ 
		“order_id” 订单 ID
		“receiver”: 收货人
        “receiver_phone”: 收货电话
        “receiver_address”: 收货地址

        "transport_method": 配送方式
        “order_status”: 订单状态 「“pending”, “transporting”, “received”, “invalid”」
            “goods”: [{
                “id”: 商品 ID
                “name”: 商品名称
                “store”: 商店名称
                    “store_id” ：商店ID
                “current_price”: 下单时刻的价格
                "amount": 购买数量
                “description”: 描述
                “image_id”: 图片 ID
            }]
        }]

===================================

更新头像
“/setavatar”

Method: .POST

Parameters：
    "avatar_id": <MongoDB 图片 ID>

Return:
	“status”: “ok”/“internal_error”

===================================

获取个人信息
“/myprofile”

Method: .GET

Parameters: <none>

Return:
	“status”: “ok”/“internal_error”
	“avatar”: 头像 ID
	“username”：用户名
	“userid”：用户ID
	“user_phone”：用户手机号
	]
===================================
获取常用收货地址
“/myaddress”

Parameters: <none>

Return:
	“status”: “ok”/“internal_error”
 	“values”: [{	 
	“receive_no”: 收货人
	“receive_phone”: 收货电话
	“receive_address”: 收货地址
	}…]
===================================

增加收货地址
“/addaddress”

Method：.POST
Parameters: 
	“receive_no”: 收货人
	“receive_phone”: 收货电话
	“receive_address”: 收货地址

Return:
	“status”: “ok”/“internal_error”

===================================

删除收货地址
“/removeaddress”

Method：.POST
Parameters: 
	“receive_no”: 收货人
	“receive_phone”: 收货电话
	“receive_address”: 收货地址

Return:
	“status”: “ok”/“internal_error”

===================================

获取图片
“/getimage”

Method：.GET
Parameters:
	“image_id”: 图像 ID，可能是头像的、商品的、商店的

Return:
	<Image Object>


===================================

上传图片
“/uploadimage”

Method：.POST
Parameters:
	“image_id”: 图像 ID，可能是头像的、商品的、商店的

Return:
	<Image Object>