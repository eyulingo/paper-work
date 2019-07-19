# General APIs
# 通用 API
# Last Update: 2019/7/19 1:29PM

# =============================================
# 获取图片
# =============================================
image_get = ({
	name: "获取图片",
	url: "/img/download",
	method: "GET"
}).params({
	fileId: "<图像 ID，可能是头像的、商品的、商店的>"
}).response({
	<body>: <Image Object>
})

# =============================================
# 上传图片
# =============================================
image_upload = ({
	name: "上传图片",
	url: "/img/upload",
	method: "POST"
}).params({
	<body>: <Image Object>
}).response({
	status: <"ok" / "internal_error">,
	fileId: "<MongoDB gridFS 中的唯一 ID>",
	filename: "<生成的原始文件名>"
})
