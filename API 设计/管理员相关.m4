登录

“/admin/login”
Method: POST
Parameters:
	“adminName”
	“password”
Return:
	{
        “Status”: “ok”/“bad_auth”/“account_locked”/“internal_error”
	}


===================================

获取店铺信息

"/admin/getstore"

Method：GET

Parameters：<none>


 “Status”: “ok”/“bad_format”/"internal_error"
 "Values": [{    
	 	“store_id”：店铺 ID <用于定位店铺>
		“name”: 店铺名称
		“address”: 店铺地址
		“starttime”: 营业开始时间
		"endtime":营业结束时间
		“store_image_id”: 店铺图片地址
		"location"：地理位置
    	"truename": 真实姓名
    	"dist_phone_nu": 经销商联系方
    	"password": 密码
	"dist_image_id":经销商图片
	"store_phone_nu":店铺手机号
	}]

===================================

修改店铺信息

"/admin/modifystore"

Method：POST

Parameters：
    “store_id”：店铺 ID <用于定位店铺>
	“name”: 店铺名称
	“address”: 店铺地址
	“starttime”: 营业时间
	"endtime":截止
	“store_image_id”: 图片地址
	"store_phone_nu":店铺手机号

 “Status”: “ok”/“bad_format”/"internal_error"

===================================


修改经销商信息

"/admin/modifydist"

Method：POST

Parameters：
    “store_id”：店铺 ID <用于定位店铺>
    "location"：地理位置
    "truename": 真实姓名
    "phone_nu": 联系方式
    "password": 密码
    "dist_image_id":

 “Status”: “ok”/“bad_format”/"internal_error"

===================================
