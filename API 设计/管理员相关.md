登录

“/admin/login”
Method: POST
Parameters:
	“username”
	“password”
Return:
	{
        “Status”: “ok”/“admin_user”/“bad_auth”/“account_locked”/“internal_error”
	}


===================================

修改店铺信息

"/admin/modifystore"

Method：POST

Parameters：
    “store_id”：店铺 ID <用于定位店铺>
	“name”: 店铺名称
	“address”: 店铺地址
	“time”: 营业时间
	“image_id”: 图片地址

 “Status”: “ok”/“bad_format”/"internal_error"

===================================


修改经销商信息

"/admin/modifyprovider"

Method：POST

Parameters：
    “store_id”：店铺 ID <用于定位店铺>
    "location"：地理位置
    "truename": 真实姓名
    "phone_no": 联系方式
    "password": 密码

 “Status”: “ok”/“bad_format”/"internal_error"

===================================