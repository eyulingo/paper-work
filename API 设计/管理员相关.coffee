# Administrator APIs
# 管理员 API
# Last Update: 2019/7/19 2:14PM



# =============================================
# 管理员登录
# =============================================
admin_login = ({
	name: "管理员登录",
	url: "/admin/login",
	method: "POST"
}).params({
	adminName: "<管理员用户名>",
	password: "<管理员用户密码>"
}).response({
	status: <"ok" / "bad_auth" / "internal_error">
})



# =============================================
# 获取店铺信息
# =============================================
get_stores = ({
	name: "管理员登录",
	url: "/admin/getstore",
	method: "GET"
}).params({
	# - <none> - #
}).response({
	status: <"ok" / "internal_error">,
	values: [{
		store_id: "<店铺 ID <用于定位店铺>>",
		name: "<店铺名称>",
		address: "<店铺地址>",
		starttime: "<营业开始时间>",
		endtime: "<营业结束时间>",
		store_image_id: "<店铺图片 ID>",
		location: "<地理位置>",
    	truename: "<真实姓名>".
    	dist_phone_nu: "<经销商联系方式>",
    	password: "<密码>",
		dist_image_id: "<经销商图片>",
		store_phone_nu: "<店铺手机号>"
	}, <... more identical structures ...>]
})



# =============================================
# 修改店铺信息
# =============================================
modify_store_info = ({
	name: "修改店铺信息",
	url: "/admin/modifystore",
	method: "POST"
}).params({
	store_id: "<店铺 ID <用于定位店铺>>",
	name: "<店铺名称>",
	address: "<店铺地址>",
	starttime: "<营业开始时间>",
	endtime: "<营业结束时间>",
	store_phone_nu: "<店铺手机号>"
}).response({
	status: <"ok" / "bad_format" / "internal_error">
})


# =============================================
# 修改经销商信息
# =============================================
modify_dist_info = ({
	name: "修改经销商信息",
	url: "/admin/modifydist",
	method: "POST"
}).params({
	store_id: "<店铺 ID <用于定位店铺>>",
    location: "<地理位置>",
    truename: "<真实姓名>",
    phone_nu: "<联系方式>",
    password: "<密码>"
}).response({
	status: <"ok" / "bad_format" / "internal_error">
})
