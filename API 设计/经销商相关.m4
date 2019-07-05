登录

“/store/login”
Method: POST
Parameters:
	“distName”
	“password”
Return:
	{
        “Status”: “ok”/“bad_auth”/“internal_error”
	}


===================================

获取自己的信息

"/store/profile"

Method：GET

Parameters：<none>

Return:
 “Status”: “ok”/“bad_format”/"internal_error"
"location"：地理位置
"truename": 真实姓名
"phone_no": 联系方式
"password": 密码

===================================

修改自己的信息

"/store/modify"

Method：POST

Parameters：

    "location"：地理位置
    "truename": 真实姓名
    "dist_phone_no": 联系方式
    "password": 密码

 “Status”: “ok”/“bad_format”/"internal_error"

===================================

查看我店铺的所有订单

"/store/orders"

Method: .GET

Parameters: <none>

Return:
    {
        "status": "ok" / "internal_error"
        "values": [{ 
            "username": 下单用户名
            "user_id": 下单用户 ID
            “bill_id” 订单 ID
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
                    “storage”: 库存
                    “description”: 描述
                    “image_id”: 图片 ID
                }]
            }]
        }]
    }

===================================

设置订单状态

Method：POST

Parameters：
    "bill_id": 订单 ID
    “status": 要设置的订单状态「“pending”, “transporting”, “received”, “invalid”」

Return："status": "ok" / "internal_error"

===================================



===================================

上传图片（普通用户功能已经实现）
“/upload”

Method：.POST
Parameters:
	“image_id”: 图像 ID，可能是头像的、商品的、商店的

Return:
	<Image Object>

===================================

新增商品
“/addgood”

Method：POST
Parameters：
    “name”: 商品名称
	“price”: 价格
	“coupon_price”: 优惠价格
	“storage”: 库存
	“description”: 描述
	“image_id”: 图片 ID
	//hidden默认设置 false(后端）

Return："status": "ok" / "internal_error"

===================================








===================================

修改店铺封面图片
“/store/cover”

Method：POST

Parameters：
    "image_id": MongODB 图像

Return："status": "ok" / "internal_error"

===================================

修改经销商头像
“/store/avatar”

Method：POST

Parameters：
    "image_id": MongODB 图像

Return："status": "ok" / "internal_error"

===================================

设置默认配送方式
“/store/setdefaultdelivery”

Method：POST

Parameters：
    "delivery": 配送方式

Return："status": "ok" / "internal_error"

===================================

获取默认配送方式
"/store/setdefaultdelivery”"

Method：GET

Return："status": "ok" / "internal_error"
        “delivery_method”: "配送方式"

===================================

修改商品信息

"/store/modifygood"

Method: POST
    "good_id": 商品 ID
    “name”: 商品名称
	“price”: 价格
	“coupon_price”: 优惠价格
	“storage”: 库存
	“description”: 描述
	“image_id”: 图片 ID
	"hidden":是否销售

Return："status": "ok" / "internal_error"

===================================

给商品加标签

"store/addtag"

Method: POST
    "good_id": 商品 ID
    "tag_name": tag 名称
Return："status": "ok" / "internal_error"


===================================

给商品移除标签

"store/addtag"

Method: POST
    "good_id": 商品 ID
    "tag_name": tag 名称

Return："status": "ok" / "internal_error"

===================================

获取我家商店的商品

"store/goods"

Method: GET

Return:
	“Status”: “ok”, “internal_error”
	“values”: [{
		“id”: 商品 ID
		“name”: 商品名称
		“price”: 价格
		“coupon_price”: 优惠价格
		“storage”: 库存
		“description”: 描述
		“image_id”: 图片 ID
		"tags": [ “...”, “...” ]
		"hidden":隐藏
	} ...
	]

===================================

修改商品信息

"store/modifygoods"

Method: POST
Params:
{
		“id”: 商品 ID
		“name”: 商品名称
		“price”: 价格
		“coupon_price”: 优惠价格
		“storage”: 库存
		“description”: 描述
		“image_id”: 图片 ID
		"hidden":隐藏
	} 

Return："status": "ok" / "internal_error"

