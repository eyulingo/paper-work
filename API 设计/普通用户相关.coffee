# User APIs
# 一般用户 API
# Last Update: 2019/7/19 1:34PM



# =============================================
# 登录
# =============================================
user_login = ({
	name: "用户登录",
	url: "/login",
	method: "POST"
}).params({
	username: "<用户名>",
	password: "<用户密码>"
}).response({
	status: <"ok" / "bad_auth" / "internal_error">
})


# =============================================
# 获取验证码
# =============================================
get_check_code = ({
	name: "获取验证码",
	url: "/getcode",
	method: "POST"
}).params({
	email: "<接收验证码的电子邮箱>"
}).response({
	status: <"ok" / "exist_email" / "internal_error">
})



# =============================================
# 注册
# =============================================
register = ({
	name: "用户注册",
	url: "/register",
	method: "POST"
}).params({
	email: "<注册电子邮箱>",
	username: "<用户名>",
	password: "<密码>",
	confirm_password: "<确认密码>",
	confirm_code: "<六位数字验证码>"
}).response({
	status: <"ok" / "bad_confirm" / "bad_email" / "bad_confirm_code" / "internal_error">
})


# =============================================
# 获取个人信息
# =============================================
personal_profile = ({
	name: "获取个人信息",
	url: "/myprofile",
	method: "GET"
}).params({
	# - <none> - #
}).response({
	status: <"ok" / "internal_error">,
	avatar: "<头像 ID>",
	username: "<用户名>",
	userid: "<用户数字 ID>",
	email: "<用户注册邮箱>"
}).notes("先调用 get_check_code 获取验证码之后，再调用此方法。")


# =============================================
# 更新头像
# =============================================
update_avatar = ({
	name: "更新头像",
	url: "/setavatar",
	method: "POST"
}).params({
	avatar_id: "<图像 ID>"
}).response({
	status: <"ok" / "internal_error">
}).notes("首先用 General API 中的 image upload 方法上传图片并得到 imageID 后再调用此方法。")


# =============================================
# 修改密码
# =============================================
change_password = ({
	name: "修改密码",
	url: "/changepassword",
	method: "POST"
}).params({
	origin_password: "<旧密码>",
	new_password: "<新密码>",
	confirm_new_password: "<确认新密码>"
}).response({
	status: <"ok" / "bad_confirm" / "internal_error">
})


# =============================================
# 换绑邮箱
# =============================================
change_email = ({
	name: "换绑邮箱",
	url: "/changeemail",
	method: "POST"
}).params({
	new_email: "新电子邮箱地址",
	confirm_code: "六位数字验证码"
}).response({
	status: <"ok" / "bad_confirm" / "internal_error">
}).notes("先调用 get_check_code 获取验证码之后，再调用此方法。")


# =============================================
# 获取常用收货地址
# =============================================
get_addresses = ({
	name: "获取常用收货地址",
	url: "/myaddress",
	method: "GET"
}).params({
	# - <none> - #
}).response({
	status: <"ok" / "internal_error">,
	values: [
		{
			receive_no: "<收件人>",
			receive_phone: "<联系电话>",
			receive_address: "<收件地址>"
		}, <... more identical structures ...>
	]
})


# =============================================
# 增加收货地址
# =============================================
add_addresses = ({
	name: "增加收货地址",
	url: "/addaddress",
	method: "POST"
}).params({
	receive_name: "<收货人>"
	receive_phone: "<收货电话>"
	receive_address: "<收货地址>"
}).response({
	status: <"ok" / "internal_error">
})

# =============================================
# 删除收货地址
# =============================================
remove_addresses = ({
	name: "删除收货地址",
	url: "/removeaddress",
	method: "POST"
}).params({
	receive_name: "<收货人>"
	receive_phone: "<收货电话>"
	receive_address: "<收货地址>"
}).response({
	status: <"ok" / "internal_error">
})


# =============================================
# 获取商品联想词
# =============================================
get_goods_suggestion = ({
	name: "获取联想词",
	url: "/suggests",
	method: "GET"
}).params({
	q: "<当前搜索关键字>"
}).response({
	status: <"ok" / "internal_error">,
	values: ["word1", "word2", "word3", ...]
})


# =============================================
# 获取商店联想词
# =============================================
get_store_suggestion = ({
	name: "获取商店联想词",
	url: "/suggeststore",
	method: "GET"
}).params({
	q: "<当前搜索关键字>"
}).response({
	status: <"ok" / "internal_error">,
	values: ["word1", "word2", "word3", ...]
})


# =============================================
# 搜索商品
# =============================================
search_goods = ({
	name: "搜索商品",
	url: "/searchgood",
	method: "GET"
}).params({
	q: "<搜索关键字>"
}).response({
	status: <"ok" / "internal_error">,
	values: [{
		id: "<商品 ID>",
		name: "<商品名称>",
		store: "<商店名称>",
		store_id: "<商店 ID>",
		price: "<价格>",
		coupon_price: "<优惠后价格>",
		storage: "<库存数量>",
		description: "<描述>",
		image_id: "<图片 ID>",
		tags: ["tag1", "tag2", "tag3", ...]
	}]
})


# =============================================
# 搜索店铺
# =============================================
search_stores = ({
	name: "搜索店铺",
	url: "/searchstore",
	method: "GET"
}).params({
	q: "<搜索关键字>"
}).response({
	status: <"ok" / "internal_error">,
	values: [{
		id: "<店铺 ID>",
		name: "<店铺名称>",
		address: "<店铺地址>",
		time: "<营业时间>",
		image_id: "<封面地址>"
	}]
})

# =============================================
# 按销量排序的店铺
# =============================================
search_stores = ({
	name: "搜索店铺",
	url: "/searchstorebysold",
	method: "GET"
}).params({
	q: "<搜索关键字>"
}).response({
	status: <"ok" / "internal_error">,
	values: [{
		id: "<店铺 ID>",
		name: "<店铺名称>",
		address: "<店铺地址>",
		time: "<营业时间>",
		image_id: "<封面地址>"
	}]
})


# =============================================
# 按距离排序的搜索店铺
# =============================================
search_stores = ({
	name: "搜索店铺",
	url: "/searchstorebydistance",
	method: "GET"
}).params({
	q: "<搜索关键字>",
	long: "<用户当前所在的经度>",
	lat: "<用户当前所在的纬度>"
}).response({
	status: <"ok" / "internal_error">,
	values: [{
		id: "<店铺 ID>",
		name: "<店铺名称>",
		address: "<店铺地址>",
		time: "<营业时间>",
		image_id: "<封面地址>"
		distance:"<距离>"
	}]
})

# =============================================
# 按评价排序的搜索店铺
# =============================================
search_stores = ({
	name: "搜索店铺",
	url: "/searchstorebystar",
	method: "GET"
}).params({
	q: "<搜索关键字>"
}).response({
	status: <"ok" / "internal_error">,
	values: [{
		id: "<店铺 ID>",
		name: "<店铺名称>",
		address: "<店铺地址>",
		time: "<营业时间>",
		image_id: "<封面地址>"
		star:"<评分>"
	}]
})



# =============================================
# 商品详情
# =============================================
goods_detail = ({
	name: "商品详情",
	url: "/gooddetail",
	method: "GET"
}).params({
	id: "<商品 ID>"
}).response({
	status: <"ok" / "not_exist" / "internal_error">,

	id: "<商品 ID>",
	name: "<商品名称>",
	store: "<商店名称>",
 	store_id: "<商店 ID>",
	price: "<价格>",
	coupon_price: "<优惠价格>",
	storage: "<库存>",
	star: "<平均分>",
	star_number: "<评分人数>",
	description: "<描述>",
	image_id: "<图片 ID>",
	comments: [{
		username: "<评论人>",
		comment_content: "<评论内容>",
		star_count: "<打星数目，1 - 5 数字>"
	}, <... more identical structures ...>]
})



# =============================================
# 商店详情
# =============================================
store_detail = ({
	name: "商店详情",
	url: "/storedetail",
	method: "GET"
}).params({
	id: "<店铺 ID>"
}).response({
	status: <"ok" / "not_exist" / "internal_error">,
	id: "<店铺 ID>",
	name: "<店铺名称>",
	address: "<店铺地址>",
	time: "<营业时间>",
	image_id: "<封面图片 ID>",
	phone_nu: "<店铺联系电话>",
	provider: "<经销商姓名>",
	provider_avatar: "<经销商头像 ID>",
	star: "<平均分>",
	star_number: "<评分人数>",
	description: "<描述>",
	comments: [{
		username: "<评论人>",
		comment_content: "<评论内容>",
		star_count: "<打星数目，1 - 5 数字>"
	}, <... more identical structures ...>],
	values: [{
		id: "<商品 ID>",
		name: "<商品名称>",
		store: "<商店名称>",
		store_id: "<商店 ID>",
		price: "<价格>",
		coupon_price: "<优惠价格>",
		storage: "<库存>",
		description: "<描述>",
		image_id: "<图片 ID>",
	}, <... more identical structures ...>]
})



# =============================================
# 加入购物车
# =============================================
add_to_cart = ({
	name: "加入购物车",
	url: "/addtocart",
	method: "POST"
}).params({
	id: "<商品 ID>",
	amount: "<购买数量>"
}).response({
	status: <"ok" / "internal_error">
})


# =============================================
# 查看购物车
# =============================================
get_my_cart = ({
	name: "查看购物车",
	url: "/mycart",
	method: "GET"
}).params({
	# - <none> - #
}).response({
	status: <"ok" / "internal_error">,
	values: [
		{
			name: "<商品名称>", 
			id: "<商品 ID>",
			image_id: "<商品图片 ID>",
			price: "<单价>",
			amount: "<数量>",
			store_id: "<商店 ID>",
			store: "<商店名>",
			storage: "<实时库存>"
		}, <... more identical structures ...>
	]
})


# =============================================
# 编辑购物车商品数量
# =============================================
edit_my_cart = ({
	name: "编辑购物车商品数量",
	url: "/editcart",
	method: "POST"
}).params({
	"id": "<商品 ID>",
	"amount": "<商品的新数量>"
}).response({
	status: <"ok" / "internal_error">
})



# =============================================
# 删除购物车中项目
# =============================================
delete_from_my_cart = ({
	name: "删除购物车中项目",
	url: "/deletecart",
	method: "POST"
}).params({
	"id": "<商品 ID>"
}).response({
	status: <"ok" / "internal_error">
})


# =============================================
# 提交订单
# =============================================
purchase = ({
	name: "提交订单"
	url: "/purchase",
	method: "POST"
}).params({
	receive_name: "<收货人姓名>",
	receive_phone: "<收货人电话>",
	receive_address: "<收货人地址>",
	values: [
		{
			id: "<商品 ID>",
			amount: "<要购买的数量>"
		}, <... more identical structures ...>
	]
}).response({
	status: <"ok" / "inadequate_storage" / "internal_error" / "Some goods have been removed from shelves">,
	cost: "<消费金额>",
	order_id: ["ID1", "ID2", "ID3", ...]
})



# =============================================
# 评价商品
# =============================================
comment_goods = ({
	name: "评价商品",
	url: "/commentgood",
	method: "POST"
}).params({
	id: "<要评价的商品 ID>",
	star_count: "<评价星级，1 - 5 的整数>",
	comment_content: "<评价内容>"
}).response({
	status: <"ok" / "not_purchased" / "internal_error">
})


# =============================================
# 评价店铺
# =============================================
comment_store = ({
	name: "评价店铺",
	url: "/commentstore",
	method: "POST"
}).params({
	id: "<要评价的商店 ID>",
	star_count: "<评价星级，1 - 5 的整数>",
	comment_content: "<评价内容>"
}).response({
	status: <"ok" / "not_purchased" / "internal_error">
})



# =============================================
# 查看所有订单
# =============================================
view_purchased_bills = ({
	name: "查看已购买订单",
	url: "/orderlist",
	method: "GET"
}).params({
	# - <none> - #
}).response({
	status: <"ok" / "internal_error">,
	values: [
		{
			rated: "true / false，此笔订单是否已经被评价了",
			star_count: "如果评价了（rated 为 true），则为评价星级数",
			comment_content: "如果评价了（rated 为 true），则为评价内容",
			generate_time: "<订单创建时间>",
			order_id: "<订单 ID>",
			receiver: "<收货人>",
			receiver_phone: "<联系电话>",
			receive_address: "<收货地址>",
			transport_method: "<配送方式>",
			order_status: "<订单状态> - " - <"unpurchased", "pending" / "transporting" / "received" / "invalid">,
			goods: [
				{
					id: "<商品 ID>",
                	name: "<商品名称>",
                	store: "<商店名称>",
                    store_id: "<商店 ID>",
                	current_price: "<下单时刻的价格>",
                	amount: "<购买数量>",
                	description: "<描述>",
                	image_id: "<图片 ID>"
				}, <... more identical structures ...>
			]
		}, <... more identical structures ...>
	]
})




# =============================================
# 找回密码时，根据用户名得到验证码
# =============================================
find_checkcode_forget = ({
	name: "找回密码根据用户名得到验证码",
	url: "/findcheckcode",
	method: "POST"
}).params({
	username: "<要找回的用户名>"
}).response({
	status: <"ok" / "internal_error">
})



# =============================================
# 找回密码
# =============================================
find_password = ({
	name: "找回密码",
	url: "/findpassword",
	method: "POST"
}).params({
	username: "<要找回的用户名>",
	new_password: "<设置的新密码>",
	confirm_password: "<确认新密码>",
	check_code: "<六位数字验证码>"
}).response({
	status: <"ok" / "bad_confirm" / "internal_error">
}).notes("先调用 find_checkcode_forget 获得验证码后，再调用此接口。")


# =============================================
# 付款
# =============================================
pay = ({
	username: "<用户名>",
	name: "付款",
	url: "/pay",
	method: "POST"
}).params({
	order_id: [{"order_id": 1}, {"order_id": 2}, {"order_id": 3}, <... more identical structures ...> ]
}).response({
	status: <"ok" / "internal_error">
}).notes("先调用 purchase 提交订单后，再调用此接口付款。")



# =============================================
# 删除未付款订单
# =============================================
deleteorder = ({
	name: "付款",
	url: "/deleteorder",
	method: "POST"
}).params({
	order_id: 1
}).response({
	status: <"ok" / "internal_error">
}).notes("先调用 purchase 提交订单后，再调用此接口付款。")


# =============================================
# 评价订单
# =============================================
rateorder = ({
	name: "付款",
	url: "/rateorder",
	method: "POST"
}).params({
	order_id: 1,
	star_count: <1 - 5 的数字>,
	comment_content: "<评价内容>"
}).response({
	status: <"ok" / "internal_error">
}).notes("先调用 purchase 提交订单，等订单结束之后，再调用此接口付款。")


